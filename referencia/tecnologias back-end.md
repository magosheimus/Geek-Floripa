## **2.2. Estrutura de Dados / “Backend”**

A arquitetura do backend será centrada no **Firebase**, usando principalmente:

* **Cloud Firestore** → banco de dados em nuvem (NoSQL, documentos/coleções)
* **Firebase Authentication** → autenticação do lojista (e, no futuro, clientes)
* **Firebase Storage** (futuro) → armazenar imagens de estampas
* **Cloud Functions** (futuro) → automatizar tarefas (ex.: notificação ao mudar status)

Para o trabalho, é totalmente aceitável focar em **Firestore simples + Auth opcional** e deixar o resto como “evolução”.

---

### 🔹 Fase 1 – Mínimo viável para o projeto 

**Objetivo:**
Ter um backend real, mas simples, que permita:

* Listar catálogo
* Registrar encomendas
* Registrar sugestões
* Registrar alguns logs de uso

**Tecnologia principal:**

* **Cloud Firestore**

### **Coleções principais (nível Fase 1)**

1. `catalogo`

   * Armazena **animes, bandas e estampas**.
   * Pode ser:

     * Uma coleção única de estampas com campo `tipo` e `tema`, ou
     * Duas coleções (`animes`, `bandas`) + subcoleções de `estampas`.

   Exemplo de documento em `catalogo`:

   ```json
   {
     "id": "naruto-01",
     "tipo": "anime",             // "anime" ou "banda"
     "tema": "Naruto",
     "nomeEstampa": "Kakashi 01",
     "imagemUrl": "https://...",
     "tags": ["shounen", "konoha"],
     "ativo": true,
     "preco": 59.9
   }
   ```

2. `encomendas`

   * Cada documento é um pedido feito no app.

   ```json
   {
     "id": "enc-0001",
     "itens": [
       {
         "estampaId": "naruto-01",
         "tema": "Naruto",
         "tipo": "anime",
         "tamanho": "M",
         "cor": "Preta",
         "quantidade": 2,
         "precoUnit": 59.9
       }
     ],
     "valorTotal": 119.8,
     "status": "pendente",        // pendente, aguardando_pagamento, em_producao...
     "cliente": {
       "nome": "Fulano",
       "telefone": "55..."
     },
     "createdAt": 1690000000
   }
   ```

3. `sugestoes`

   * Registra as ideias de estampas enviadas com referência do Pinterest.

   ```json
   {
     "pinUrl": "https://www.pinterest.com/pin/123...",
     "tema": "Evangelion",
     "descricao": "Unit-01 estilo graffiti roxo e preto.",
     "contato": {
       "nome": "Ciclano",
       "telefone": "55...",
       "querOrcamento": true
     },
     "queryOriginal": "camiseta evangelion",
     "status": "nova",            // nova, em_analise, em_producao, arquivada
     "createdAt": 1690000000
   }
   ```

4. `logs` (opcional, mas muito legal academicamente)

   * Guarda eventos de uso, p.ex. buscas sem resultado.

   ```json
   {
     "tipo": "search_empty",
     "query": "chainsaw man",
     "timestamp": 1690000000,
     "deviceId": "abc123"
   }
   ```

> Esses dados poderão ser exportados em **CSV/JSON** e analisados com **Pandas**, como você já planejou.

---

### 🔹 Fase 2 – Backend mais robusto 

**Componentes principais:**

1. **Firebase Authentication**

   * Lojista:

     * Login protegido para acessar dashboard, pedidos e sugestões.
   * Futuro:

     * Clientes com conta própria (favoritos, histórico de pedidos).

2. **Regras de Segurança do Firestore**

   * Garantir que:

     * O app público só consiga **criar** pedidos/sugestões e **ler** catálogo.
     * Apenas usuário autenticado como `admin` leia/modifique `encomendas` e `sugestoes`.

   Exemplo simplificado de regra:

   ```js
   rules_version = '2';
   service cloud.firestore {
     match /databases/{database}/documents {

       // Catálogo: leitura pública, escrita só por admin
       match /catalogo/{docId} {
         allow read: if true;
         allow write: if request.auth.token.role == 'admin';
       }

       // Encomendas: cliente pode criar, admin gerencia
       match /encomendas/{docId} {
         allow create: if true;
         allow read, update, delete: if request.auth.token.role == 'admin';
       }

       // Sugestões: qualquer um cria, só admin lê/edita
       match /sugestoes/{docId} {
         allow create: if true;
         allow read, update, delete: if request.auth.token.role == 'admin';
       }
     }
   }
   ```

3. **Dashboard Web lendo esses dados**

   * Front-end (React/Next/Streamlit) consumindo:

     * `encomendas`
     * `sugestoes`
     * `catalogo`
     * `logs`
   * Gráficos em tempo real: usando listeners (`onSnapshot`) ou consultas periódicas.

4. **Supabase como alternativa (conceitual)**

   * Se quiser citar, pode dizer que:

     * “Em uma versão futura, seria possível usar Supabase (PostgreSQL gerenciado) para um modelo relacional clássico, com tabelas para pedidos, clientes, sugestões, etc.”

---

### 🔹 Fase 3 – Automação e refinamento 

Aqui você pode só citar como visão avançada:

1. **Cloud Functions**

   * Trigger ao atualizar `status` da encomenda → envia notificação push.
   * Trigger ao criar nova `sugestao` → envia e-mail/alerta para o lojista.

2. **Firebase Storage**

   * Armazenar imagens de estampas.
   * Guardar miniaturas otimizadas para o app.

3. **Integração com Analytics**

   * Firebase Analytics para medir uso das telas, cliques em cards, etc.
   * Cruzar isso com seus `logs` para entender o comportamento dos usuários.

