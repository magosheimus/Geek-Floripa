# 📱 Geek Floripa MVP - Resumo da Estrutura do Projeto

## ✅ O Que Foi Criado

### 1. **Estrutura Base do Projeto**
```
app/
├── src/
│   ├── components/      # Componentes reutilizáveis (a criar)
│   ├── hooks/          # Custom hooks (a criar)
│   ├── navigation/     # Navegação entre telas (a criar)
│   ├── screens/        # Telas do app (a criar)
│   ├── services/       # ✅ Serviços de comunicação com Firebase
│   ├── styles/         # ✅ Sistema de design (cores, espaçamento, tipografia)
│   ├── types/          # ✅ Definições TypeScript
│   └── utils/          # ✅ Utilitários (preços, WhatsApp)
├── assets/             # Imagens e recursos
├── App.tsx            # Componente principal
└── package.json       # Dependências
```

### 2. **Tipos TypeScript Criados** (`src/types/`)
- ✅ **catalogo.ts**: Estampa, Tema, ItemCarrinho, Tamanhos, Cores, LocalEstampa
- ✅ **pedido.ts**: Pedido, ItemPedido, StatusPedido, DadosCliente
- ✅ **sugestao.ts**: Sugestao, StatusSugestao
- ✅ **log.ts**: Log, TipoLog (métricas de uso)

### 3. **Serviços Firebase Criados** (`src/services/`)
- ✅ **firebase.ts**: Configuração e inicialização do Firebase
- ✅ **catalogo.service.ts**: Funções para gerenciar catálogo (temas e estampas)
- ✅ **pedido.service.ts**: Funções para criar e gerenciar pedidos
- ✅ **sugestao.service.ts**: Funções para gerenciar sugestões via Pinterest
- ✅ **log.service.ts**: Funções para registrar métricas e eventos

### 4. **Utilitários Criados** (`src/utils/`)
- ✅ **pricing.ts**: Cálculo de preços baseado nas regras da loja
  - Preço base: R$80 (normal) / R$100 (extra grande)
  - Acréscimo frente+verso: R$20
- ✅ **whatsapp.ts**: Integração com WhatsApp
  - Enviar pedidos formatados
  - Enviar sugestões
  - Confirmar pagamento PIX

### 5. **Sistema de Design** (`src/styles/`)
- ✅ **colors.ts**: Paleta retro (laranja #FF6B00, preto, branco, cinzas)
- ✅ **spacing.ts**: Espaçamentos, bordas, tamanhos de fonte e ícones
- ✅ **typography.ts**: Tipografia (preparado para fontes pixel art)
- ✅ **index.ts**: Tema unificado com sombras pixeladas

### 6. **Dependências Instaladas**
- ✅ Firebase (Firestore + Auth)
- ✅ React Navigation (Native + Stack)
- ✅ React Native WebView (para Pinterest)
- ✅ AsyncStorage (armazenamento local)
- ✅ React Native Screens + Safe Area Context

---

## 📋 Próximos Passos

### **Fase 1: Configurar Firebase** 🔥
- [ ] Criar projeto no Firebase Console
- [ ] Ativar Firestore Database
- [ ] Copiar credenciais para `src/services/firebase.ts`
- [ ] Criar coleções: `temas`, `catalogo`, `encomendas`, `sugestoes`, `logs`
- [ ] Configurar regras de segurança
- [ ] Popular catálogo inicial com dados de teste

👉 **Guia completo**: `FIREBASE_SETUP.md`

### **Fase 2: Popular Catálogo** 📊
- [ ] Upload das imagens para Firebase Storage ou hospedagem
- [ ] Criar documentos na coleção `temas`:
  - 5 animes: Naruto, One Piece, Demon Slayer, Jujutsu Kaisen, Dan Da Dan
  - 5 bandas: Metallica, Nirvana, Pink Floyd, Black Sabbath, Foo Fighters
- [ ] Criar documentos na coleção `catalogo` com todas as estampas
- [ ] Configurar URLs das imagens (POSTER e estampas individuais)

### **Fase 3: Criar Componentes UI** 🎨
- [ ] Criar componentes básicos:
  - `Button.tsx` (botão pixelado estilo retro)
  - `Card.tsx` (card de tema/estampa)
  - `Input.tsx` (campo de texto)
  - `Header.tsx` (cabeçalho com logo)
  - `Loading.tsx` (indicador de carregamento)

### **Fase 4: Criar Telas** 📱
- [ ] **HomeScreen**: Painéis de animes e bandas com scroll horizontal
- [ ] **CatalogoScreen**: Grid de estampas por tema
- [ ] **DetalheEstampaScreen**: Detalhes + adicionar ao carrinho
- [ ] **CarrinhoScreen**: Lista de itens + total
- [ ] **BuscaScreen**: Busca com integração Pinterest
- [ ] **SugestaoScreen**: Formulário de sugestão
- [ ] **PagamentoScreen**: QR Code PIX + confirmação

### **Fase 5: Implementar Navegação** 🧭
- [ ] Configurar Stack Navigator
- [ ] Criar fluxo de navegação entre telas
- [ ] Adicionar Bottom Tabs (Home, Busca, Carrinho)

### **Fase 6: Implementar Lógica de Negócio** ⚙️
- [ ] Hook `useCarrinho` para gerenciar carrinho
- [ ] Cálculo automático de preços
- [ ] Validação de formulários
- [ ] Integração completa com Firebase
- [ ] Sistema de logs de uso

### **Fase 7: Testes e Refinamentos** 🧪
- [ ] Testar fluxo completo de encomenda
- [ ] Testar busca e sugestões via Pinterest
- [ ] Testar integração WhatsApp
- [ ] Ajustar estilos e responsividade
- [ ] Otimizar performance

### **Fase 8: Dashboard Lojista (Futuro)** 👨‍💼
- [ ] Tela de login
- [ ] Lista de pedidos com filtros por status
- [ ] Lista de sugestões
- [ ] Análises básicas (top temas, tamanhos, cores)
- [ ] Exportação de dados (CSV/JSON)

---

## 🎯 Estrutura de Dados do Firebase

### Coleção: `temas`
```typescript
{
  tipo: "anime" | "banda",
  nome: string,           // Ex: "Naruto"
  posterUrl: string,      // URL do POSTER_
  totalEstampas: number,
  ativo: boolean
}
```

### Coleção: `catalogo`
```typescript
{
  tipo: "anime" | "banda",
  tema: string,           // Ex: "Naruto"
  nomeEstampa: string,    // Ex: "Kakashi 01"
  imagemUrl: string,
  tags: string[],         // Ex: ["shounen", "konoha"]
  ativo: boolean,
  preco: number,
  dataCriacao: number
}
```

### Coleção: `encomendas`
```typescript
{
  itens: ItemPedido[],
  valorTotal: number,
  status: "pendente" | "aguardando_pagamento" | "pago" | ...,
  cliente: { nome?, telefone? },
  createdAt: number,
  updatedAt?: number
}
```

### Coleção: `sugestoes`
```typescript
{
  pinUrl: string,         // URL do Pinterest
  tema: string,
  descricao: string,
  contato: { nome?, telefone?, querOrcamento },
  queryOriginal: string,
  status: "nova" | "em_analise" | ...,
  createdAt: number
}
```

---

## 🛠️ Comandos Úteis

### Iniciar o projeto:
```bash
cd "app"
npx.cmd expo start
```

### Limpar cache:
```bash
npx.cmd expo start -c
```

### Instalar nova dependência:
```bash
npm.cmd install nome-do-pacote
```

### Build para Android:
```bash
npx.cmd eas build --platform android
```

---

## 📞 Configurações Importantes

### WhatsApp
Arquivo: `src/utils/whatsapp.ts`
```typescript
const WHATSAPP_NUMERO = '5548999999999'; // ⚠️ ALTERAR
```

### Firebase
Arquivo: `src/services/firebase.ts`
```typescript
const firebaseConfig = {
  apiKey: "...",           // ⚠️ ALTERAR após criar projeto
  authDomain: "...",
  projectId: "...",
  // ...
};
```

---

## 📚 Documentação de Referência

- **Firebase**: https://firebase.google.com/docs/firestore
- **React Navigation**: https://reactnavigation.org/docs/getting-started
- **Expo**: https://docs.expo.dev/
- **React Native**: https://reactnative.dev/docs/getting-started

---

## 💡 Dicas Importantes

### Organização de Imagens
Você tem duas opções:

1. **Firebase Storage** (recomendado para MVP):
   - Upload via console do Firebase
   - URLs automáticas e seguras
   - Fácil de gerenciar

2. **Hospedagem Externa** (Imgur, Cloudinary):
   - Mais rápido para testar
   - Basta ter as URLs públicas

### Fontes Pixel Art
Para o visual retro, recomendo baixar fontes como:
- **Press Start 2P** (Google Fonts)
- **Pixelify Sans** (Google Fonts)
- **VT323** (Google Fonts)

Instalar com:
```bash
npx.cmd expo install expo-font @expo-google-fonts/press-start-2p
```

### Git (Controle de Versão)
Não esqueça de criar um `.gitignore` para não commitar:
- `node_modules/`
- `.expo/`
- `src/services/firebase.ts` (credenciais sensíveis)

---

## 🎨 Paleta de Cores Geek Floripa

- **Principal**: `#FF6B00` (Laranja vibrante)
- **Secundária**: `#000000` (Preto)
- **Background**: `#FFFFFF` (Branco)
- **Acentos**: Cinzas para dithering

**Estilo**: Retro gamer com bordas grossas, sombras pixeladas e visual 8-bit.

---

✨ **Está tudo pronto para começar a desenvolver!** 

O próximo passo mais importante é **configurar o Firebase** seguindo o guia `FIREBASE_SETUP.md`. Depois disso, podemos começar a criar as telas e componentes do app.
