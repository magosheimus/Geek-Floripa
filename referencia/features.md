# **1.3. Features de Evolução (Planejamento Futuro do Sistema)**

---

## **1) Sistema de Favoritos (lista de estampas salvas)**

### **O que é**

Permite que o usuário marque estampas como favoritas usando um ícone (⭐ ou ❤️). Elas ficam armazenadas para fácil acesso — útil para clientes indecisos, comparação e planejamento de compras.

### **Por que é importante**

* Cria **engajamento contínuo**.
* Aumenta chances de encomenda futura.
* Permite ao lojista observar quais estampas geram “desejo” mesmo sem compra.

### **Como funciona tecnicamente**

* Se o usuário estiver logado → favoritos são salvos no banco (Firestore/Supabase).
* Se o usuário não estiver logado → uso inicial via **LocalStorage**.
* Sincronização opcional quando o usuário cria uma conta posteriormente.

### **Tecnologias**

* Firestore (coleção `favoritos/{userId}`)
* LocalStorage (versão offline, mais simples)

---

## **2) Status do Pedido para o Cliente**

### **O que é**

Um acompanhamento visual que funciona como um rastreamento do pedido:

1. **Pendente** – o pedido foi criado
2. **Aguardando pagamento** – envio do PIX ou comprovante
3. **Em produção** – a camiseta está sendo feita
4. **Pronto para retirada/entrega**
5. **Finalizado**

### **Por que é importante**

* Reduz ruído no WhatsApp.
* Proporciona transparência.
* Profissionaliza o comércio.

### **Como funciona tecnicamente**

* Cada pedido no banco tem um campo `status`.
* A tela do cliente usa **listener em tempo real** (Firestore) ou pooling.
* Ao mudar o status, a tela atualiza automaticamente.

### **Tecnologias**

* Firestore com atualização em tempo real
* Banco SQL com API REST
* Tela de acompanhamento via ID do pedido

---

## **3) Notificações Push (mudanças de status)**

### **O que é**

O cliente recebe uma notificação automática quando o pedido muda de estado.

### **Exemplos de mensagens**

* “Sua camiseta entrou em produção!”
* “Seu pedido está pronto para retirada!”
* “Pedido finalizado. Obrigado por comprar na Geek Floripa 💛”

### **Por que é importante**

* Economiza tempo do lojista.
* Cria sensação de cuidado e eficiência.
* Reduz ansiedade do cliente.

### **Como funciona tecnicamente**

* Quando o status no banco muda, um servidor (ou Cloud Function) dispara a notificação.

### **Tecnologias**

* Firebase Cloud Messaging (FCM)
* Cloud Functions (para automatizar)

---

## **4) Dashboard Web com Gráficos em Tempo Real (para o lojista)**

### **O que é**

Um painel administrativo acessado pelo navegador, com dados atualizados:

* Vendas por tema (anime/banda)
* Estampas mais compradas
* Tamanhos e cores mais solicitados
* Evolução diária/semanal/mensal
* Sugestões mais enviadas pelos clientes
* Termos de busca sem resultado (extremamente valioso!)

### **Por que é importante**

* Melhora planejamento de estoque.
* Indica quais temas devem ser priorizados.
* Ajuda a tomar decisões baseadas em dados (data-driven).
* Eleva o sistema de um “app bonito” para uma **ferramenta de negócio real**.

### **Como funciona tecnicamente**

* O dashboard consome dados do banco em formato JSON.
* Gráficos atualizam em tempo real via WebSockets ou listeners.
* Pode ser integrado ao módulo de exportação (CSV/JSON) já existente.

### **Tecnologias possíveis**

* React + Firebase
* Streamlit (Python, rápido para dashboards)
* Chart.js, Plotly, Recharts (gráficos)
* Supabase + Edge Functions

---

## **5) Autenticação de Usuário (login do cliente)**

### **O que é**

O cliente pode criar uma conta com:

* Nome
* E-mail
* Telefone
* Histórico de pedidos
* Lista de favoritos
* Sugestões enviadas

### **Por que é importante**

* Permite personalização da experiência.
* Sincroniza favoritos entre dispositivos.
* Facilita reenvio de pedidos.
* Profissionaliza o app para longo prazo.

### **Como funciona tecnicamente**

* Autenticação com e-mail/senha ou login social (Google).
* Cada recurso (favoritos, pedidos, sugestões) vira privado por usuário.

### **Tecnologias**

* Firebase Authentication
* Supabase Auth
* JWT + backend simples (Node/Python)

---

## **6) Integração com Mercado Pago / Pagamentos Avançados**

### **O que é**

O app passa a ter um fluxo de venda completo com pagamento integrado:

* Pix automático
* Pix parcelado
* Cartão de crédito
* Checkout transparente dentro do app

### **Por que é importante**

* Elimina etapas manuais (manda PIX aqui, manda comprovante lá).
* Reduz abandono de cesta.
* Possibilita futura entrega via motoboy ou Correios.
* Transforma o app em **um e-commerce real**.

### **Como funciona tecnicamente**

* Cliente escolhe forma de pagamento.

* App envia dados ao Mercado Pago.

* MP retorna:

  * QR code Pix dinâmico
  * Link de pagamento
  * Status (“approved”, “pending”, “rejected”)

* Banco registra o pagamento automaticamente.

* Status do pedido atualiza.

### **Tecnologias possíveis**

* API Mercado Pago
* API Pix Dinâmico (bancos parceiros)
* Cálculo de frete com Correios / Melhor Envio
* Webhooks para atualizar status automaticamente

---

## **7) Segurança e Privacidade**

* Proteção de dados pessoais (telefone, nome, histórico).
* Regras de acesso no Firestore.
* Criptografia HTTPS obrigatória.

## **8) Otimização futura**

* Cache offline das estampas mais acessadas.
* Compressão automática de imagens para carregamento mais rápido.
* Suporte a dark/light theme.

## **9) Escalabilidade**

* Separar ambiente “cliente” e “lojista”.
* Camada de API para futuro crescimento (Node/Python).
* Organização clara das coleções / tabelas do banco.

