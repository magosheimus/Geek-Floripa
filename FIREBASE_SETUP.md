# 🔥 Guia de Configuração do Firebase - Geek Floripa

Este documento explica como configurar o Firebase para o projeto Geek Floripa MVP.

## 📋 Passo 1: Criar Projeto no Firebase

1. Acesse [Firebase Console](https://console.firebase.google.com/)
2. Clique em **"Adicionar projeto"** ou **"Create a project"**
3. Nome do projeto: **`geek-floripa-mvp`** (ou o nome que preferir)
4. Aceite os termos e clique em **"Continuar"**
5. **Google Analytics**: Pode desabilitar por enquanto (opcional)
6. Clique em **"Criar projeto"**
7. Aguarde a criação (leva alguns segundos)

## 📱 Passo 2: Adicionar App Web ao Projeto

1. No painel do Firebase, clique no ícone **Web** (`</>`)
2. **Nome do app**: `Geek Floripa App`
3. **Não** marque "Firebase Hosting" por enquanto
4. Clique em **"Registrar app"**
5. **IMPORTANTE**: Copie o objeto `firebaseConfig` que aparece

Exemplo do que você vai copiar:
```javascript
const firebaseConfig = {
  apiKey: "AIzaSyXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
  authDomain: "geek-floripa-mvp.firebaseapp.com",
  projectId: "geek-floripa-mvp",
  storageBucket: "geek-floripa-mvp.appspot.com",
  messagingSenderId: "123456789012",
  appId: "1:123456789012:web:xxxxxxxxxxxxx"
};
```

6. **Cole essas credenciais** no arquivo:
   - `app/src/services/firebase.ts`
   - Substitua os valores `YOUR_API_KEY`, `YOUR_PROJECT_ID`, etc.

## 🗄️ Passo 3: Ativar o Firestore Database

1. No menu lateral, clique em **"Firestore Database"**
2. Clique em **"Criar banco de dados"** ou **"Create database"**
3. **Modo de produção**: Selecione **"Iniciar no modo de teste"** (Start in test mode)
   - Isso permite leitura/escrita sem autenticação por 30 dias
   - Vamos ajustar as regras depois
4. **Localização**: Escolha **`us-central` ou `southamerica-east1`** (São Paulo)
5. Clique em **"Ativar"**

## 📊 Passo 4: Criar as Coleções no Firestore

### Estrutura de Dados

Você precisa criar 4 coleções principais:

#### 1️⃣ Coleção: `temas`
Armazena os temas (animes e bandas) que aparecem na home.

**Exemplo de documento:**
```javascript
{
  tipo: "anime",        // ou "banda"
  nome: "Naruto",
  posterUrl: "URL_DA_IMAGEM_POSTER",
  totalEstampas: 15,
  ativo: true
}
```

#### 2️⃣ Coleção: `catalogo`
Armazena todas as estampas disponíveis.

**Exemplo de documento:**
```javascript
{
  tipo: "anime",
  tema: "Naruto",
  nomeEstampa: "Kakashi 01",
  imagemUrl: "URL_DA_ESTAMPA",
  tags: ["shounen", "konoha", "kakashi"],
  ativo: true,
  preco: 80,
  dataCriacao: 1700000000000
}
```

#### 3️⃣ Coleção: `encomendas`
Armazena os pedidos dos clientes (criados automaticamente pelo app).

**Exemplo de documento:**
```javascript
{
  itens: [
    {
      estampaId: "abc123",
      tema: "Naruto",
      tipo: "anime",
      nomeEstampa: "Kakashi 01",
      imagemUrl: "URL",
      tamanho: "M",
      cor: "Preta",
      localEstampa: "frente",
      tamanhoEstampa: 25,
      quantidade: 2,
      precoUnit: 80,
      subtotal: 160
    }
  ],
  valorTotal: 160,
  status: "pendente",
  cliente: {
    nome: "João Silva",
    telefone: "5548999999999"
  },
  createdAt: 1700000000000
}
```

#### 4️⃣ Coleção: `sugestoes`
Armazena sugestões de estampas enviadas pelos clientes.

**Exemplo de documento:**
```javascript
{
  pinUrl: "https://www.pinterest.com/pin/123456789/",
  tema: "Evangelion",
  descricao: "Unit-01 estilo graffiti",
  contato: {
    nome: "Maria Santos",
    telefone: "5548988888888",
    querOrcamento: true
  },
  queryOriginal: "evangelion unit 01",
  status: "nova",
  createdAt: 1700000000000
}
```

#### 5️⃣ Coleção: `logs`
Armazena métricas de uso do app (criados automaticamente).

**Exemplo de documento:**
```javascript
{
  tipo: "search_empty",
  query: "chainsaw man",
  timestamp: 1700000000000
}
```

### Como criar as coleções manualmente:

1. No Firestore, clique em **"Iniciar coleção"** ou **"Start collection"**
2. **ID da coleção**: Digite o nome (ex: `temas`)
3. **Adicionar primeiro documento**:
   - **ID do documento**: Deixe automático ou coloque um ID (ex: `naruto`)
   - **Adicione os campos** conforme exemplos acima
4. Clique em **"Salvar"**
5. Repita para as outras coleções

**💡 Dica**: Por enquanto, você pode criar apenas 1 documento de exemplo em cada coleção para testar. Depois vamos popular com todos os dados.

## 🔐 Passo 5: Configurar Regras de Segurança

1. No Firestore, clique na aba **"Regras"** (Rules)
2. **Copie e cole** o código abaixo:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    
    // Temas: leitura pública
    match /temas/{document=**} {
      allow read: if true;
      allow write: if false; // Só via console por enquanto
    }
    
    // Catálogo: leitura pública
    match /catalogo/{document=**} {
      allow read: if true;
      allow write: if false; // Só via console por enquanto
    }
    
    // Encomendas: clientes podem criar, ninguém pode ler (só admin via console)
    match /encomendas/{document=**} {
      allow create: if true;
      allow read, update, delete: if false;
    }
    
    // Sugestões: clientes podem criar, ninguém pode ler (só admin via console)
    match /sugestoes/{document=**} {
      allow create: if true;
      allow read, update, delete: if false;
    }
    
    // Logs: qualquer um pode criar (métricas)
    match /logs/{document=**} {
      allow create: if true;
      allow read, update, delete: if false;
    }
  }
}
```

3. Clique em **"Publicar"**

## ✅ Passo 6: Verificar a Configuração

Agora volte para o código e verifique:

1. **Credenciais copiadas** em `app/src/services/firebase.ts`
2. **Firestore ativado** no console
3. **Coleções criadas** (pelo menos `temas` e `catalogo` com 1 doc de teste)
4. **Regras publicadas**

## 🚀 Próximos Passos

Depois dessa configuração inicial, você poderá:

1. **Popular o catálogo** com todas as estampas dos animes e bandas
2. **Testar o app** para ver se consegue ler os dados
3. **Criar pedidos de teste** para validar o fluxo
4. **Adicionar autenticação** para o dashboard do lojista (fase futura)

## 📞 Configurações Adicionais

### WhatsApp
No arquivo `app/src/utils/whatsapp.ts`, substitua:
```typescript
const WHATSAPP_NUMERO = '5548999999999';
```
Pelo número real da loja no formato: código país + DDD + número (sem espaços, traços ou parênteses).

### PIX
O QR Code PIX será configurado posteriormente. Por enquanto, o app está preparado para exibir uma imagem estática do QR Code.

---

## 🆘 Problemas Comuns

### Erro: "Permission denied"
- Verifique se as regras de segurança foram publicadas corretamente
- Certifique-se de que está no "modo de teste" (30 dias)

### Erro: "Firebase not configured"
- Verifique se copiou todas as credenciais corretamente
- Certifique-se de que não há espaços extras ou aspas quebradas

### App não conecta ao Firebase
- Verifique sua conexão com internet
- Certifique-se de que executou `npm install` para instalar as dependências

---

✨ **Pronto!** Seu Firebase está configurado e pronto para uso no MVP da Geek Floripa!
