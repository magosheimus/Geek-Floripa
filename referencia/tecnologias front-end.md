## **2.1. Front-end Mobile**

### 🧱 Stack base

**Sugestão principal:**

* **React Native + Expo**

  * Expo simplifica:

    * Build e testes em diferentes dispositivos (Expo Go).
    * Uso de **WebView**, câmera, acesso à galeria, etc.
    * Configuração de ícones, splash screen e permissões.
  * Ecossistema bem documentado → facilita justificar escolhas na disciplina.

Opcional (forte, mas não obrigatório):

* **TypeScript**

  * Tipagem estática.
  * Melhor organização em projetos médios/grandes.
  * Dá um plus acadêmico: mostra preocupação com manutenção e qualidade do código.

---

### 📌 Principais bibliotecas (núcleo da aplicação)

#### 1) Navegação

* `@react-navigation/native`
* `@react-navigation/native-stack` ou `bottom-tabs`

**Por quê?**

* Permite organizar as telas em:

  * Stack principal: Home, Catálogo, Detalhe da Estampa, Carrinho, Pagamento.
  * Tab ou Drawer: navegação rápida (Home / Catálogo / Carrinho / Sugestões).
* Facilita passar parâmetros entre telas (ex.: tema selecionado, ID da estampa).

---

#### 2) WebView (fluxo Pinterest)

* `react-native-webview`

  * Usada para:

    * Abrir o Pinterest com uma URL de busca pré-formatada.
    * Detectar quando o usuário entra em um **pin** para capturar a URL.
  * É um ponto-chave pra justificar o uso de recursos nativos via Expo.

---

#### 3) Ícones e visual

* `@expo/vector-icons`

  * Ícones para:

    * Favoritos (⭐/❤️)
    * Carrinho (🛒)
    * Home (🏠)
    * Notificações, etc.

* **Estilização**:

  * `StyleSheet` nativo do React Native **ou**
  * `styled-components` / `tamagui` / `nativewind` (Tailwind for RN) se quiser um fluxo mais organizado.

Pro seu projeto, algo como:

* **StyleSheet + alguns estilos globais** já resolve bem e é fácil de explicar.

---

### 🧮 Estado, formulários e dados

Essas libs não são obrigatórias, mas mostram maturidade técnica se você citar:

#### 4) Gerenciamento de estado

Versão simples:

* `useState` e `useContext` nativos do React.

Versão um pouco mais sólida:

* **Zustand** ou **Context + Reducer**

  * Para:

    * Estado do carrinho
    * Estado do usuário (logado/não logado, no futuro)
    * Filtro atual do catálogo

Você pode descrever assim no relatório:

> “O estado global leve (como itens do carrinho) poderá ser mantido via Context API ou bibliotecas de estado como Zustand, conforme evolução do projeto.”

#### 5) Formulários e validação

Para telas como **Sugestão de estampa** e **Dados de contato**:

* `react-hook-form`

  * Facilita:

    * Controle de inputs
    * Mensagens de erro
    * Validação básica

* `yup` (ou `zod`)

  * Define esquemas de validação (ex.: telefone obrigatório se marcar “quero orçamento”).

---

### 💾 Armazenamento local

Mesmo com backend, é útil ter um pouco de persistência local:

* `@react-native-async-storage/async-storage`

  * Para:

    * Guardar últimas buscas
    * Lembrar filtros
    * Cache leve do catálogo ou favoritos no modo offline

* Futuro:

  * `expo-secure-store` para guardar tokens com segurança (se você implementar login e autenticação).

---

### 🌐 Comunicação com backend / APIs

Versão simples:

* `fetch` nativo do JavaScript.

Versão organizada:

* `axios`

  * Melhor tratamento de erros.
  * Interceptores (no futuro, para autenticação).

Opcional (pra ficar bem chique):

* `@tanstack/react-query`

  * Cache de requisições.
  * Estado de carregamento e erro automático.
  * Perfeito pra:

    * Catálogo
    * Listas de pedidos
    * Sugestões do cliente

---

### 🧪 Ferramentas de desenvolvimento e testes (pode citar como perspectiva)

* **ESLint + Prettier**

  * Garantem padrão de código.
* **Jest + React Native Testing Library**

  * Testes de componentes críticos (ex.: carrinho, formulário de sugestão).
* **Expo DevTools**

  * Monitorar logs, performance e builds.

Isso mostra que você sabe que front-end não é só “tela bonitinha”, mas também qualidade.

---

### 📂 Organização sugerida de pastas (importante pra relatório)

Você pode descrever algo assim:

```text
src/
  components/
    CardEstampa.tsx
    BotaoPrimario.tsx
  screens/
    HomeScreen.tsx
    CatalogoScreen.tsx
    DetalheEstampaScreen.tsx
    CarrinhoScreen.tsx
    SugestaoScreen.tsx
    PagamentoPixScreen.tsx
  navigation/
    AppNavigator.tsx
  hooks/
    useCarrinho.ts
  services/
    api.ts
    firebase.ts
  styles/
    colors.ts
    spacing.ts
  types/
    estampa.ts
    pedido.ts
```

Isso conversa bonito com a parte de **arquitetura de software** na disciplina.


