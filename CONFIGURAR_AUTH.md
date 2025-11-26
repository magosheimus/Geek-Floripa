# Configuração da Autenticação Firebase

## ⚠️ IMPORTANTE: Configure antes de usar!

### 1️⃣ Habilitar Email/Password no Firebase Console

1. Acesse: https://console.firebase.google.com
2. Selecione o projeto "geek-floripa-mvp"
3. No menu lateral, clique em **"Authentication"** (Autenticação)
4. Clique na aba **"Sign-in method"**
5. Clique em **"Email/Password"**
6. **HABILITE** a opção "Email/Password"
7. Clique em **"Salvar"**

### 2️⃣ Criar Conta do Lojista

Depois de habilitar Email/Password:

1. Vá para a aba **"Users"** no Authentication
2. Clique em **"Add user"**
3. Email: `lojista@geekfloripa.com`
4. Senha: (escolha uma senha forte)
5. Clique em **"Add user"**

Ou crie diretamente pelo app usando o email `lojista@geekfloripa.com` - o sistema automaticamente dará permissões de lojista.

### 3️⃣ Google Sign-In (Opcional - não implementado ainda)

Para habilitar login com Google:

1. No Firebase Console > Authentication > Sign-in method
2. Clique em "Google"
3. Habilite e configure o OAuth
4. Será necessário código adicional no app (não implementado)

### 4️⃣ Facebook Sign-In (Opcional - não implementado ainda)

Para habilitar login com Facebook:

1. Crie um app no Facebook Developers
2. No Firebase Console > Authentication > Sign-in method
3. Clique em "Facebook"
4. Configure com App ID e App Secret do Facebook
5. Será necessário código adicional no app (não implementado)

---

## 🧪 Testando a Autenticação

### Criar Conta de Cliente:
1. Abra o app
2. Clique em "CRIAR CONTA"
3. Preencha: Nome, Email, Senha (mín 6 caracteres)
4. Clique em "CRIAR CONTA"

### Fazer Login:
1. Use o email e senha cadastrados
2. Clique em "ENTRAR"

### Acessar como Lojista:
1. Use o email: `lojista@geekfloripa.com`
2. Após login, aparecerá opção "Painel Lojista" no menu do usuário (canto superior esquerdo)

---

## ❌ Erros Comuns

### "auth/email-already-in-use"
- Email já cadastrado. Use outro email ou faça login.

### "auth/weak-password"
- Senha precisa ter pelo menos 6 caracteres.

### "auth/invalid-email"
- Email inválido. Use formato: nome@email.com

### "auth/operation-not-allowed"
- **Email/Password não está habilitado no Firebase Console!**
- Siga as instruções do passo 1️⃣ acima.

---

## 📱 Funcionalidades Implementadas

✅ Cadastro com Email/Senha
✅ Login com Email/Senha
✅ Logout
✅ Persistência de sessão
✅ Proteção de rotas por role (cliente/lojista)
✅ Painel administrativo para lojista
⏳ Google Sign-In (preparado, não implementado)
⏳ Facebook Sign-In (preparado, não implementado)

---

## 🔐 Segurança

- Senhas são criptografadas pelo Firebase
- Dados de usuário armazenados no Firestore
- Email do lojista (`lojista@geekfloripa.com`) tem permissões especiais
- Sessions persistem localmente (AsyncStorage)
