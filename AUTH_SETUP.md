# Sistema de Autenticação - Geek Floripa

## ✅ Implementação Completa

O sistema de autenticação foi implementado com Firebase Authentication, incluindo:

### 📋 Funcionalidades Implementadas

1. **Autenticação de Clientes**
   - Login com email/senha
   - Cadastro com validação
   - Persistência de sessão
   - Botões para Google/Facebook (preparados para futura implementação)

2. **Autenticação de Lojista**
   - Acesso único via email especial: `lojista@geekfloripa.com`
   - Painel exclusivo com estatísticas e gestão
   - Proteção de rotas por role

3. **Interface de Usuário**
   - Tela de Login moderna com estilo retro
   - Tela de Cadastro com validações
   - Badge de usuário na navegação superior
   - Menu com opções de logout e acesso ao painel

## 🏗️ Arquitetura

### Arquivos Criados

```
src/
├── types/
│   └── auth.ts                    # Tipos: User, UserRole, AuthContextData
├── contexts/
│   └── AuthContext.tsx            # Estado global de autenticação
├── screens/
│   ├── LoginScreen.tsx            # Tela de login
│   ├── CadastroScreen.tsx         # Tela de cadastro
│   └── PainelLojistaScreen.tsx    # Dashboard do lojista
```

### Arquivos Modificados

```
App.tsx                            # AuthProvider + rotas de auth
src/navigation/types.ts            # Adicionadas rotas: Login, Cadastro, PainelLojista
src/components/TopNavigationBar.tsx # Badge de usuário + menu
```

## 🔐 Configuração do Firebase

### 1. Habilitar Authentication

No [Firebase Console](https://console.firebase.google.com):

1. Acesse seu projeto "Geek Floripa MVP"
2. No menu lateral: **Authentication** → **Sign-in method**
3. Habilite os provedores:
   - ✅ **Email/Password** (já funcional)
   - ⏳ Google (futuro)
   - ⏳ Facebook (futuro)

### 2. Criar Conta do Lojista

#### Opção A: Via Console Firebase
1. Authentication → Users → **Add user**
2. Email: `lojista@geekfloripa.com`
3. Senha: (escolha uma senha segura)
4. O sistema detectará automaticamente pelo email e atribuirá role "lojista"

#### Opção B: Via App (Cadastro)
1. Abra o app e vá para Cadastro
2. Use o email: `lojista@geekfloripa.com`
3. O sistema automaticamente atribui role "lojista" para este email

### 3. Firestore - Coleção de Usuários

O sistema cria automaticamente documentos em `usuarios/`:

```javascript
usuarios/
  {uid}/
    email: string
    displayName: string
    role: "cliente" | "lojista"
    createdAt: timestamp
    photoURL?: string (futuro)
```

## 📱 Fluxo de Uso

### Para Clientes

1. **Primeira vez:**
   - Abrir app → Tela de Login
   - Clicar em "CRIAR CONTA"
   - Preencher nome, email, senha
   - Cadastro automático + login

2. **Usuário existente:**
   - Entrar com email e senha
   - Sessão persiste (AsyncStorage)

3. **Sem login:**
   - Opção "Continuar sem login"
   - Funcionalidades básicas disponíveis
   - Carrinho/favoritos locais (não sincronizados)

### Para Lojista

1. **Acesso:**
   - Login com `lojista@geekfloripa.com`
   - Sistema detecta role e direciona para painel

2. **Painel Lojista:**
   - Badge de usuário (topo) → Menu → "Painel Lojista"
   - Visualizar estatísticas (mockadas por enquanto)
   - Acessos rápidos para gestão

## 🔄 Próximos Passos

### Tarefa Pendente: Integração Carrinho/Favoritos

**O que fazer:**
- Salvar carrinho e favoritos no Firestore quando usuário logado
- Sincronizar entre dispositivos
- Migrar dados locais para nuvem no login

**Estrutura sugerida no Firestore:**
```javascript
usuarios/{uid}/
  carrinho/
    {itemId}/
      ...item data
  favoritos/
    {temaId}/
      ...tema data
```

### Funcionalidades Futuras

1. **Social Login:**
   - Google Sign-In (requer configuração Expo + Firebase)
   - Facebook Login (requer app Facebook Developers)

2. **Painel Lojista Completo:**
   - Lista de todos os pedidos
   - Gestão de estampas (upload, edição, remoção)
   - Relatórios com gráficos
   - Responder sugestões de clientes

3. **Perfil do Cliente:**
   - Editar dados pessoais
   - Histórico de pedidos
   - Endereços salvos

## 🚀 Como Testar

### 1. Iniciar o App
```bash
cd app
npm start
```

### 2. Criar Conta de Teste
- Use qualquer email válido
- Senha com 6+ caracteres
- Nome completo

### 3. Testar Lojista
- Criar conta com `lojista@geekfloripa.com`
- Verificar acesso ao Painel Lojista

### 4. Verificar Navegação
- Badge de usuário aparece no topo
- Menu mostra nome e email
- Logout funciona corretamente

## ⚠️ Observações Importantes

1. **Email do Lojista:**
   - Hardcoded em `AuthContext.tsx` (linha 24)
   - Altere se necessário: `const LOJISTA_EMAIL = 'seu@email.com'`

2. **Segurança:**
   - Firebase Rules devem ser configuradas
   - Apenas lojistas podem acessar coleções de gestão
   - Clientes só podem ler/escrever seus próprios dados

3. **Validações:**
   - Email: regex básico
   - Senha: mínimo 6 caracteres
   - Mensagens de erro traduzidas em português

4. **Persistência:**
   - AsyncStorage mantém sessão
   - Logout limpa todos os dados locais

## 🔗 Links Úteis

- [Firebase Auth Docs](https://firebase.google.com/docs/auth)
- [Expo AuthSession](https://docs.expo.dev/versions/latest/sdk/auth-session/) (para social login)
- [Firebase Security Rules](https://firebase.google.com/docs/firestore/security/get-started)

## 🐛 Troubleshooting

**Erro: "auth/email-already-in-use"**
- Email já cadastrado
- Use função "esqueci senha" (futuro) ou outro email

**Erro: "auth/weak-password"**
- Senha deve ter no mínimo 6 caracteres

**Não consegue acessar Painel Lojista:**
- Verifique se o email é exatamente `lojista@geekfloripa.com`
- Confirme que o campo `role` no Firestore está como "lojista"

**Sessão não persiste:**
- Verifique AsyncStorage
- Limpe cache: Settings → Clear Storage (no Expo Go)
