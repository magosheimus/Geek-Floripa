# 🎨 Estrutura do Projeto Geek Floripa MVP

## 📦 Estrutura de Arquivos Criada

```
Geek Floripa_MVP/
│
├── 📁 animes/                    # Imagens dos animes (suas pastas originais)
│   ├── Naruto/
│   ├── One Piece/
│   ├── Demon Slayer/
│   ├── Jujutsu Kaisen/
│   └── Dan Da Dan/
│
├── 📁 bandas de rock/            # Imagens das bandas (suas pastas originais)
│   ├── Metallica/
│   ├── Nirvana/
│   ├── Pink Floyd/
│   ├── Black Sabbath/
│   └── Foo Fighters/
│
├── 📁 assets/                    # Logos da Geek Floripa
│   ├── logo pacman.png
│   ├── nome geek floripa preto.png
│   └── ponte pixel preta.png
│
├── 📁 referencia/                # Documentação do projeto
│   └── [arquivos .md]
│
├── 📁 app/                       # ⭐ PROJETO REACT NATIVE + EXPO
│   │
│   ├── 📁 src/
│   │   │
│   │   ├── 📁 components/       # Componentes reutilizáveis (próxima fase)
│   │   │
│   │   ├── 📁 hooks/            # Custom hooks (próxima fase)
│   │   │
│   │   ├── 📁 navigation/       # Navegação entre telas (próxima fase)
│   │   │
│   │   ├── 📁 screens/          # Telas do app (próxima fase)
│   │   │
│   │   ├── 📁 services/         # ✅ CRIADO - Comunicação com Firebase
│   │   │   ├── firebase.ts              # Configuração Firebase
│   │   │   ├── catalogo.service.ts      # CRUD de catálogo
│   │   │   ├── pedido.service.ts        # CRUD de pedidos
│   │   │   ├── sugestao.service.ts      # CRUD de sugestões
│   │   │   ├── log.service.ts           # Registro de métricas
│   │   │   └── index.ts                 # Exports
│   │   │
│   │   ├── 📁 styles/           # ✅ CRIADO - Sistema de design retro
│   │   │   ├── colors.ts                # Paleta (laranja, preto, branco)
│   │   │   ├── spacing.ts               # Espaçamentos e tamanhos
│   │   │   ├── typography.ts            # Fontes (pixel art)
│   │   │   └── index.ts                 # Tema unificado
│   │   │
│   │   ├── 📁 types/            # ✅ CRIADO - Definições TypeScript
│   │   │   ├── catalogo.ts              # Estampa, Tema, ItemCarrinho
│   │   │   ├── pedido.ts                # Pedido, StatusPedido
│   │   │   ├── sugestao.ts              # Sugestao, StatusSugestao
│   │   │   ├── log.ts                   # Log, TipoLog
│   │   │   └── index.ts                 # Exports
│   │   │
│   │   └── 📁 utils/            # ✅ CRIADO - Utilitários
│   │       ├── pricing.ts               # Cálculo de preços
│   │       ├── whatsapp.ts              # Integração WhatsApp
│   │       └── index.ts                 # Exports
│   │
│   ├── 📁 assets/               # Assets do Expo
│   ├── 📄 App.tsx               # Componente principal
│   ├── 📄 app.json              # Configuração do Expo
│   ├── 📄 package.json          # Dependências
│   ├── 📄 tsconfig.json         # Config TypeScript
│   └── 📄 .env.example          # Exemplo de variáveis de ambiente
│
├── 📄 README.md                 # ✅ CRIADO - Guia principal do projeto
├── 📄 FIREBASE_SETUP.md         # ✅ CRIADO - Como configurar Firebase
└── 📄 POPULAR_CATALOGO.md       # ✅ CRIADO - Como popular o catálogo
```

---

## 🔥 Coleções do Firebase (Estrutura de Dados)

```
Firebase Firestore
│
├── 📊 temas/
│   ├── naruto { tipo, nome, posterUrl, totalEstampas, ativo }
│   ├── onepiece { ... }
│   ├── demonslayer { ... }
│   ├── jujutsukaisen { ... }
│   ├── dandadan { ... }
│   ├── metallica { ... }
│   ├── nirvana { ... }
│   ├── pinkfloyd { ... }
│   ├── blacksabbath { ... }
│   └── foofighters { ... }
│
├── 📚 catalogo/
│   ├── [auto-id] { tipo, tema, nomeEstampa, imagemUrl, tags[], ativo, preco }
│   ├── [auto-id] { ... }
│   └── ... (todas as estampas)
│
├── 🛒 encomendas/
│   ├── [auto-id] { itens[], valorTotal, status, cliente{}, createdAt }
│   └── ... (criados pelo app)
│
├── 💡 sugestoes/
│   ├── [auto-id] { pinUrl, tema, descricao, contato{}, status, createdAt }
│   └── ... (criados pelo app)
│
└── 📈 logs/
    ├── [auto-id] { tipo, query?, metadata{}, timestamp }
    └── ... (criados pelo app)
```

---

## 🎯 Dependências Instaladas

### Core
- ✅ `expo` - Framework principal
- ✅ `react-native` - UI nativo
- ✅ `typescript` - Tipagem estática

### Firebase
- ✅ `firebase` - SDK completo (Firestore + Auth)

### Navegação
- ✅ `@react-navigation/native`
- ✅ `@react-navigation/native-stack`
- ✅ `react-native-screens`
- ✅ `react-native-safe-area-context`

### Funcionalidades
- ✅ `react-native-webview` - Para Pinterest
- ✅ `@react-native-async-storage/async-storage` - Storage local

---

## 📊 Fluxos Implementados (Backend)

### ✅ Catálogo
- Buscar todos os temas
- Buscar tema por ID
- Buscar todas as estampas
- Buscar estampas por tema
- Buscar estampa por ID
- Buscar estampas por termo (search)

### ✅ Pedidos
- Criar pedido
- Buscar pedido por ID
- Listar pedidos (com filtros)
- Atualizar status do pedido
- Confirmar pagamento PIX

### ✅ Sugestões
- Criar sugestão
- Buscar sugestão por ID
- Listar sugestões (com filtros)
- Atualizar status da sugestão

### ✅ Logs/Métricas
- Registrar evento genérico
- Registrar busca sem resultado
- Registrar busca com sucesso
- Registrar clique em card
- Registrar visualização de estampa
- Registrar adição ao carrinho
- Registrar início de checkout
- Registrar finalização de pedido
- Registrar confirmação PIX
- Registrar envio de sugestão
- Registrar abertura do Pinterest

### ✅ Utilitários
- Cálculo de preços por tamanho e local
- Formatação de valores (R$)
- Envio de pedido via WhatsApp
- Envio de sugestão via WhatsApp
- Confirmação de PIX via WhatsApp

---

## 🎨 Sistema de Design (Retro Gamer)

### Cores
```typescript
primary: '#FF6B00'      // Laranja vibrante
secondary: '#000000'    // Preto
background: '#FFFFFF'   // Branco
```

### Espaçamentos
```typescript
xs: 4px, sm: 8px, md: 16px, lg: 24px, xl: 32px, xxl: 48px
```

### Bordas
```typescript
Estilo pixelado: 2px, 4px
Bordas grossas: 2-4px de espessura
Sombras: Sem blur (efeito pixel perfeito)
```

### Tipografia
```typescript
Preparado para fontes pixel art (Press Start 2P, Pixelify Sans)
Tamanhos: 10-36px
```

---

## 💰 Sistema de Preços

### Base
- **Infantil + P, M, G, GG**: R$ 80,00 (1 estampa)
- **GG1 até GG8**: R$ 100,00 (1 estampa)

### Acréscimos
- **Frente E Verso**: + R$ 20,00

### Exemplos
- Camiseta P, frente = **R$ 80,00**
- Camiseta GG2, frente = **R$ 100,00**
- Camiseta M, frente+verso = **R$ 100,00** (80+20)
- Camiseta GG4, frente+verso = **R$ 120,00** (100+20)

---

## 🚀 Status Atual

### ✅ Concluído
- [x] Estrutura base do projeto Expo + TypeScript
- [x] Instalação de todas as dependências
- [x] Definição de tipos TypeScript completos
- [x] Serviços Firebase (CRUD completo)
- [x] Sistema de design retro
- [x] Utilitários (preços + WhatsApp)
- [x] Documentação completa

### 🔄 Próxima Fase
- [ ] Configurar Firebase (Console)
- [ ] Popular catálogo inicial
- [ ] Criar componentes UI
- [ ] Criar telas do app
- [ ] Implementar navegação
- [ ] Integrar lógica de negócio

### 🔮 Fases Futuras
- [ ] Testes completos
- [ ] Dashboard lojista
- [ ] Notificações push
- [ ] Sistema de favoritos
- [ ] Analytics avançado

---

## 📞 Próximos Passos Imediatos

1. **Configurar Firebase Console** (seguir `FIREBASE_SETUP.md`)
2. **Upload das imagens** para Firebase Storage
3. **Popular coleções** `temas` e `catalogo` (seguir `POPULAR_CATALOGO.md`)
4. **Atualizar credenciais** em `src/services/firebase.ts`
5. **Atualizar número WhatsApp** em `src/utils/whatsapp.ts`

---

✨ **Tudo pronto para o desenvolvimento das telas!**
