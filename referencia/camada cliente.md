# **1.1. Camada “Cliente” (lado do usuário) — Organização Completa**

## **1) Tela Inicial – Menu Digital Interativo**

A tela inicial funciona como um **cardápio visual** que apresenta os dois universos da loja Geek Floripa: **Animes** e **Bandas de Rock**. É a primeira impressão do usuário e precisa ser simples, visual e convidativa.

---

## **Estrutura Principal da Tela**

### **1. Cabeçalho / Identidade**

* Pode conter o **logo da Geek Floripa** ou apenas texto minimalista:

  * *“Catálogo Digital – Geek Floripa”*
* Deve ser leve e ocupar pouco espaço visual.

### **2. Painéis Separados**

* **Animes**
* **Bandas de Rock**

Cada painel contém **cards** com:

* Capa/thumbnail
* Nome do anime ou banda

Comportamento:

* Scroll horizontal (estilo Netflix) ou exibição em grade
* Ao clicar: abre o catálogo de estampas daquele tema

---

## **Painel de Animes**

### Componente:

* Título **ANIMES**
* Botão **“Ver tudo”** (canto direito, minimalista)

### Conteúdo:

* Cards horizontais com:

  * Imagem de capa
  * Nome do anime
* Exemplos: Naruto, One Piece, Demon Slayer, Jujutsu Kaisen, Bleach…

### Função:

* Clique no card → abre catálogo exclusivo do anime
* Scroll lateral revela mais títulos


---

## **Painel de Bandas de Rock**

Mantém a mesma lógica do painel de animes, garantindo fluidez cognitiva.

### Conteúdo:

* Cards horizontais como:

  * Metallica
  * Nirvana
  * Slipknot
  * Iron Maiden
  * Queen
  * AC/DC

---

## **3) Catálogo de Estampas por Tema**

Ao clicar em qualquer card (anime ou banda):

* Abre uma lista com todas as estampas daquele tema.
* Cada estampa exibe:

  * Imagem
  * Nome/identificador
  * Botão **“+”** para encomendar

---

## **4) Busca Interna**

Um campo de busca em destaque logo na tela inicial.

### A barra de busca deve:

* Pesquisar por:

  * Nome de anime
  * Nome de banda
  * Tags associadas às estampas

### Se encontrar:

* Exibe resultados filtrados

### Se não encontrar:

* Mostra: *“Nada encontrado no catálogo”*
* Oferece:

  * Descrever ideia em texto
  * Ou abrir fluxo de sugestão com Pinterest via WebView

### Observação

A busca é a ponte entre o catálogo fixo e a criatividade do cliente.

---

## **5) Atalhos Opcionais**

Pequenos botões logo abaixo da busca:

* ⭐ Mais populares
* 🆕 Novidades
* 🔥 Tendências da semana
* 📦 Encomenda rápida

---

## **6) Navegação Básica**

Na parte superior, ao lado ou abaixo da logo, uma barra simples com:

* 🏠 Home
* 🎨 Catálogo
* 🛒 Carrinho
* ⭐ Sugestões

---

## **4) Sugestão de Estampa (Fluxo com Pinterest)**

### Quando o usuário quer sugerir algo:

1. App abre uma **WebView** com busca do Pinterest pré-formatada
   (ex.: *“evangelion unit 01 design”*)
2. Dentro de um pin, o app ativa o botão:

   * **“Selecionar esta imagem como referência”**

### De volta ao app, abre um formulário:

* Miniatura/URL da imagem selecionada
* Tema principal (dropdown)
* Descrição da ideia
* Nome e telefone (opcional, mas obrigatório para orçamento)
* Marcar: “Quero orçamento para esta estampa”

### Ao enviar:

* O app cria um registro de sugestão para o lojista
* Importante: **não baixa a imagem**, armazena apenas a URL

---

## **5) Sistema de Encomenda (Mini Carrinho)**

Ao clicar no **“+”** em qualquer estampa:

* Abre modal com:

  * Tamanho: 
	  * Infantil: 08,10,12, 14, 16  
	  * Adulto: P, M, G, GG 
	  * Extra grande GG1 ao GG8
  * Cor: Branca, Preta
  * Quantidade
  * Local da estampa (frente, verso, personalizado)
  * Tamanho da estampa (padrão é 25cm de largura, mas pode ter uma barra que desliza para personalizar o tamanho)
  * Valor estimado
	  * No caso aqui temos um valor base de R$80 por camiseta, estampado em um lado da camiseta (frente ou verso)
	  * Nas camisetas extra grandes o valor fica por R$100, tbm estampados em um lado da camiseta 
	  * Para camisetas com duas estampas (frente E verso) tem acréscimo de R$20, exemplo: camiseta P frente e verso = R$100; camiseta GG2 frente e verso = R$120;

Ao confirmar:

* O item vai para o **carrinho de encomendas**

---

## **6) Carrinho de Encomendas**

Lista de itens com:

* Estampa
* Tema
* Tamanho
* Cor
* Local da estampa 
* Tamanho da estampa
* Quantidade
* Subtotal

Funções:

* Editar item
* Remover
* Exibir total geral
* Botão **“Finalizar encomenda”**

---

## **7) Pagamento via PIX (QR Code)**

Na finalização:

* Exibe:

  * Resumo do pedido
  * QR code PIX da loja
  * Campo de valor (ou total sugerido)

Botões:

* “Marcar como pago / Enviar confirmação”
* “Enviar pedido via WhatsApp” (com mensagem pré-formatada)

---

## **8) Registro de Pedidos para Análise**

Cada encomenda salva contém:

* Tema (anime/banda)
* Estampa
* Tamanho
* Cor
* Quantidade
* Valor
* Data/hora

Depois será exportado para CSV/JSON e analisado com **Pandas**.

---

# **🎨 Visual – Identidade Geek Floripa**

O app segue um estilo **retro gamer**:

* Bordas pixeladas
* Fonte 8-bit
* Paleta: preto, branco, laranja
* Textura dithering suave

---

# **⚙️ Requisitos Técnicos da Tela Inicial**

A tela inicial deve:

* Renderizar listas separadas (animes e bandas)
* Puxar dados do catálogo (JSON/Firestore)
* Exibir cards com imagem + nome + ID
* Navegar para o catálogo do tema clicado
* Integrar busca inteligente
* Carregar rápido e ser responsiva

Além disso, deve coletar métricas de uso:

* Quais cards são clicados
* Termos buscados
* Resultados sem retorno (úteis para saber o que falta no catálogo)

