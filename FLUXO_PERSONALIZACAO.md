# 🎨 Fluxo de Personalização - Geek Floripa

## Objetivo
Minimizar etapas e fricção no processo de compra de estampas personalizadas, reduzindo desistência.

---

## 📱 FLUXO 1: Imagem Própria do Cliente

### Caminho do Usuário:
```
HomeScreen (busca vazia)
  ↓ [ENVIAR MINHA IDEIA]
EnviarEstampaScreen
  ↓ [SELECIONAR IMAGEM]
ImagePicker (nativo)
  ↓ (automático ao selecionar)
CustomizacaoRapidaModal ⚡
  ↓ [ADICIONAR AO CARRINHO]
CarrinhoScreen
  ↓ [FINALIZAR PEDIDO]
FinalizarPedidoScreen
```

### Características:
- ✅ **2 toques** até configurar produto
- ✅ Modal **inline** - não navega para outra tela
- ✅ Preview da imagem durante customização
- ✅ Cálculo de preço em tempo real
- ✅ Adiciona direto ao carrinho

### Dados Salvos:
```typescript
{
  estampaPersonalizada: {
    tipo: 'personalizada_imagem',
    imagemUri: 'file:///...',
    descricao: 'Observações do cliente'
  },
  tamanho: 'M',
  cor: 'Branca',
  localEstampa: 'frente',
  quantidade: 1,
  precoUnitario: 45.00,
  nomeExibicao: 'Minha Estampa Personalizada',
  imagemExibicao: 'file:///...'
}
```

---

## 🌐 FLUXO 2: Inspiração do Pinterest

### Caminho do Usuário:
```
HomeScreen (busca vazia)
  ↓ [BUSCAR INSPIRAÇÃO]
Pinterest (browser/app)
  ↓ Cliente acha um pin interessante
  ↓ [COMPARTILHAR] → [Geek Floripa App]
PinterestCallbackScreen ⚡
  ↓ (automático - captura URL)
CustomizacaoRapidaModal
  ↓ [ADICIONAR AO CARRINHO]
CarrinhoScreen
```

### Características:
- ✅ **Deep linking** - volta pro app automaticamente
- ✅ **Zero digitação** - captura URL do pin
- ✅ Salva referência do Pinterest
- ✅ Cliente não precisa baixar imagem
- ✅ **1 toque** para customizar após voltar

### Dados Salvos:
```typescript
{
  estampaPersonalizada: {
    tipo: 'personalizada_pinterest',
    pinterestUrl: 'https://pin.it/xxxxx',
    descricao: 'Pin encontrado via busca: "naruto"'
  },
  tamanho: 'M',
  cor: 'Preta',
  localEstampa: 'frente',
  quantidade: 1,
  precoUnitario: 45.00,
  nomeExibicao: 'Inspiração Pinterest',
  imagemExibicao: 'https://i.pinimg.com/...' // thumbnail
}
```

---

## 🛠️ Implementação Técnica

### Componentes Criados:

1. **CustomizacaoRapidaModal**
   - Modal bottom-sheet
   - Seleção: Tamanho, Cor, Local, Quantidade
   - Preview da imagem
   - Cálculo de preço em tempo real
   - Botão: "ADICIONAR AO CARRINHO"

2. **EnviarEstampaScreen** (Refatorado)
   - Seletor de imagem simplificado
   - Abre modal automaticamente após seleção
   - Remove etapas de envio por email/WhatsApp

3. **PinterestCallbackScreen** (A criar)
   - Recebe deep link do compartilhamento
   - Extrai URL do pin
   - Baixa thumbnail para preview
   - Abre modal de customização

### Tipos Atualizados:

```typescript
// catalogo.ts
export type TipoEstampa = 
  | 'catalogo' 
  | 'personalizada_imagem' 
  | 'personalizada_pinterest';

export interface EstampaPersonalizada {
  tipo: TipoEstampa;
  imagemUri?: string;
  pinterestUrl?: string;
  descricao?: string;
}

export interface ItemCarrinho {
  id: string;
  estampa?: Estampa; // Opcional para catálogo
  estampaPersonalizada?: EstampaPersonalizada; // Para personalizadas
  tamanho: Tamanho;
  cor: Cor;
  localEstampa: LocalEstampa;
  quantidade: number;
  larguraEstampa: number;
  alturaEstampa: number;
  observacoes: string;
  precoUnitario: number;
  subtotal: number;
  nomeExibicao: string; // Para display
  imagemExibicao: string; // URL da imagem
}
```

### Context Atualizado:

```typescript
// CarrinhoContext.tsx
interface CarrinhoContextData {
  // ... métodos existentes
  
  adicionarItemPersonalizado: (config: {
    estampaPersonalizada: EstampaPersonalizada;
    tamanho: Tamanho;
    cor: Cor;
    localEstampa: LocalEstampa;
    quantidade: number;
    larguraEstampa: number;
    alturaEstampa: number;
    observacoes: string;
    nomeExibicao?: string;
  }) => void;
}
```

---

## 📊 Vantagens da Abordagem

### Redução de Fricção:
- **Antes**: 5-7 etapas (selecionar → enviar email → conversar WhatsApp → configurar produto)
- **Depois**: 2-3 etapas (selecionar → customizar → carrinho)

### Automação:
- Pinterest: Captura automática de URL via deep link
- Imagem própria: Modal abre automaticamente após seleção
- Preços calculados em tempo real

### Experiência:
- Cliente vê **preview** da estampa durante customização
- **Não sai do app** em nenhum momento crítico
- Feedback visual imediato (✅ adicionado ao carrinho)

---

## 🚀 Próximos Passos

### Prioridade Alta:
1. ✅ CustomizacaoRapidaModal - DONE
2. ✅ Refatorar EnviarEstampaScreen - DONE
3. ⏳ Criar PinterestCallbackScreen
4. ⏳ Configurar deep linking no app.json
5. ⏳ Atualizar CarrinhoScreen para exibir personalizadas

### Prioridade Média:
6. Adicionar thumbnail do Pinterest no preview
7. Permitir editar item personalizado no carrinho
8. Salvar histórico de personalizações

### Prioridade Baixa:
9. Integração com API do Pinterest (se necessário)
10. Cache de imagens do Pinterest
11. Sugestões baseadas em buscas anteriores

---

## 🔗 Deep Linking - Pinterest

### Configuração app.json:
```json
{
  "expo": {
    "scheme": "geekfloripa",
    "android": {
      "intentFilters": [
        {
          "action": "VIEW",
          "data": [
            {
              "scheme": "https",
              "host": "geekfloripa.app",
              "pathPrefix": "/pinterest"
            }
          ],
          "category": ["BROWSABLE", "DEFAULT"]
        }
      ]
    }
  }
}
```

### URL de compartilhamento:
```
Cliente no Pinterest: 
  → [Compartilhar pin] 
  → Seleciona "Geek Floripa"
  → Deep link: geekfloripa://pinterest?url=https://pin.it/xxxxx
```

---

## 💰 Cálculo de Preço

Utiliza função existente `calcularPrecoItem()`:

```typescript
// utils/pricing.ts
export const calcularPrecoItem = (
  tamanho: Tamanho,
  localEstampa: LocalEstampa
): number => {
  const precoBase = 35.00;
  const acrescimoTamanho = tamanho === 'GG' ? 10 : 0;
  const acrescimoLocal = localEstampa === 'frente-e-verso' ? 15 : 0;
  
  return precoBase + acrescimoTamanho + acrescimoLocal;
};
```

---

## 📦 Estrutura de Dados no Pedido

Quando o pedido é finalizado, o item personalizado é salvo assim:

```typescript
{
  id: "pedido_123",
  itens: [
    {
      id: "item_456",
      estampaPersonalizada: {
        tipo: "personalizada_imagem",
        imagemUri: "file:///storage/...",
        descricao: "Logo da banda favorita"
      },
      tamanho: "M",
      cor: "Preta",
      localEstampa: "frente",
      quantidade: 2,
      precoUnitario: 45.00,
      subtotal: 90.00,
      nomeExibicao: "Minha Estampa Personalizada",
      imagemExibicao: "file:///storage/..."
    }
  ],
  valorTotal: 90.00,
  status: "pendente",
  cliente: {
    nome: "João Silva",
    telefone: "+5548999999999"
  },
  createdAt: 1700000000000
}
```

---

## 🎯 Métricas de Sucesso

### KPIs a Monitorar:
- Taxa de conversão (busca → pedido)
- Tempo médio até adicionar ao carrinho
- Taxa de abandono no modal de customização
- % de pedidos com estampas personalizadas
- Origem das personalizações (imagem vs Pinterest)

### Meta:
- **Reduzir tempo** de personalização de ~10min para **<2min**
- **Aumentar conversão** de personalizadas em **30%**
- **Reduzir abandono** no funil em **50%**
