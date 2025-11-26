# 🎮 Geek Floripa MVP

**Marketplace mobile de camisetas personalizadas com estampas de animes e bandas de rock**

## 📱 Sobre o Projeto

Aplicativo e-commerce desenvolvido em **React Native + TypeScript** com backend **Firebase**, permitindo que clientes personalizem e encomendem camisetas com estampas curadas de animes e bandas de rock.

### ✨ Funcionalidades Principais

**Para Clientes:**
- Catálogo dinâmico de estampas (animes e bandas)
- Customização completa (cor, tamanho, quantidade)
- Carrinho persistente (AsyncStorage)
- Sistema de favoritos
- Finalização via WhatsApp
- Sistema de sugestões de novos temas

**Para Lojistas:**
- CRUD completo de catálogo (temas e estampas)
- Gestão de pedidos com 6 status
- Dashboard de relatórios e analytics
- Upload de imagens para Firebase Storage

## 🏗️ Stack Tecnológico

### Frontend
- **React Native** (Expo SDK 51)
- **TypeScript** (100% type-safe)
- **React Navigation** (Stack + Bottom Tabs)
- **AsyncStorage** (persistência local)
- **Context API** (state management)

### Backend
- **Firebase Authentication** (email/senha + JWT)
- **Cloud Firestore** (database NoSQL em tempo real)
- **Firebase Storage** (CDN para imagens)
- **Firebase Hosting** (deploy de assets)

### Segurança
- Firestore Security Rules (role-based access)
- Validação client-side e server-side
- Autenticação persistente

## 📂 Estrutura do Projeto

```
app/src/
├── components/        # Componentes reutilizáveis
├── contexts/          # Context API (Auth, Carrinho, Favoritos)
├── screens/           # Telas (Cliente + Lojista)
├── services/          # Integração Firebase
├── types/             # TypeScript interfaces
├── styles/            # Design system
└── utils/             # Funções auxiliares
```

## 🚀 Como Executar

### Pré-requisitos
- Node.js 18+
- Expo CLI
- Conta Firebase configurada

### Instalação
```bash
cd app
npm install
npx expo start
```

### Build APK
```bash
eas build --platform android --profile production
```

## 🎯 Métricas do Projeto

- **~5.000 linhas de código** TypeScript
- **395 arquivos** (incluindo assets)
- **12 telas** (6 cliente + 6 lojista)
- **15 componentes** reutilizáveis
- **5 serviços** Firebase
- **10 interfaces** TypeScript

## 📊 Arquitetura Firebase

### Collections
- `temas/` - Animes e bandas cadastrados
- `estampas/` - Catálogo completo de imagens
- `pedidos/` - Encomendas dos clientes
- `sugestoes/` - Sugestões de novos temas

### Storage
```
storage/
├── temas/{nome}/capa.jpg
└── estampas/{tema}/{nome}.jpg
```

## 🔐 Segurança

- **Authentication**: Firebase Auth com JWT
- **Authorization**: Firestore Rules com role-based access
- **Validação**: TypeScript + input sanitization
- **Storage**: Upload apenas autenticado, leitura pública

## 📱 Sistema de Precificação

```typescript
Preços base:
- P: R$ 45,00
- M: R$ 50,00
- G: R$ 55,00
- GG: R$ 60,00
- XG: R$ 65,00
```

## 🎨 Design System

- **Paleta**: Laranja #FF6B00 (principal) + preto/branco
- **Estilo**: Retro gamer com bordas pixeladas
- **Tipografia**: Preparado para fontes pixel art

## 📚 Documentação Completa

Para guia técnico detalhado, consulte: `APRESENTACAO_TECNICA.md`

## 🔮 Roadmap Futuro

- [ ] Pagamento online (Stripe/Mercado Pago)
- [ ] Push notifications (FCM)
- [ ] Chat lojista-cliente (Firestore real-time)
- [ ] Analytics (Firebase Analytics)
- [ ] Versão iOS
- [ ] Web dashboard administrativo

## 👥 Autor

Desenvolvido como MVP acadêmico - **Geek Floripa**

## 📄 Licença

Projeto acadêmico - Todos os direitos reservados
