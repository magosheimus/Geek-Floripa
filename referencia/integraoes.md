

## **2.4. Integrações**

As integrações do sistema têm como objetivo **conectar o app com ferramentas já usadas pela loja**, sem complicar demais a infraestrutura na primeira versão. São três pilares principais: **PIX**, **WhatsApp** e **Pinterest (como referência visual)**.

---

### 🔹 1) Integração com PIX

#### **Modelo adotado (MVP)**

* Uso de um **QR code estático** da loja (aquele mesmo que vocês já usam hoje).
* Esse QR pode ser:

  * Uma **imagem fixa** adicionada ao app (asset)

#### **Como funciona no app**

* Na tela de **finalização da encomenda**:

  * O app mostra:

    * Resumo do pedido (itens + total estimado)
    * QR code PIX estático
    * Campo para o cliente conferir o valor (pode ser preenchido automaticamente com o total)
  * Botão: **“Marcar como pago / já realizei o pagamento”**

* Ao clicar em “marcar como pago”:

  * O app:

    * Atualiza o status do pedido para **“aguardando confirmação”**
    * Registra em `logs` um evento tipo `pix_confirmado_pelo_cliente`.

> Importante: **no MVP, o app não verifica de fato o pagamento no banco**, ele apenas registra a informação para o lojista conferir manualmente (checar o app do banco).

#### **Possíveis evoluções (fase futura, mas você pode citar)**

* Migração para **Pix Dinâmico**, com:

  * QR único por pedido.
  * Possibilidade de o sistema marcar o pagamento automaticamente via API/webhook.

---

### 🔹 2) Integração com WhatsApp

#### **Modelo adotado**

* Uso de link direto no formato:

```text
https://wa.me/55SEUNUMERO?text=...
```

* O `text` é preenchido pelo app com um **resumo do pedido ou da sugestão**.

#### **Como funciona no fluxo de encomenda**

* Após o cliente finalizar a encomenda:

  * O app monta uma mensagem tipo:

    > "Olá, quero confirmar uma encomenda na Geek Floripa:\n
    >
    > * Naruto #1 – Tam M – Cor Preta – Qtd 2\n
    > * Metallica #3 – Tam G – Cor Branca – Qtd 1\n
    >   Total estimado: R$ 179,70\n
    >   Forma de pagamento: PIX\n"

* Em seguida:

  * Abre o WhatsApp já com essa mensagem preenchida.
  * O cliente pode editar antes de enviar, se quiser.

#### **Como funciona no fluxo de sugestão (Pinterest)**

* Quando o lojista decide responder uma **sugestão**:

  * Na dashboard (ou no app, lado do lojista), um botão **“Responder no WhatsApp”** monta um link com:

    * Nome do cliente
    * Ideia sugerida
    * URL de referência do pin

#### **Cuidados técnicos**

* É importante **escapar/encodar** o texto na URL (`encodeURIComponent`) para evitar problemas com espaços, acentos e quebras de linha.
* O WhatsApp pode não aceitar URLs muito longas → por isso é bom manter o resumo objetivo.

> Como MVP, essa integração é ótima: não exige API oficial, não precisa backend complexo, e encaixa direto no fluxo já usado pela loja.

---

### 🔹 3) Integração com Pinterest (como referência visual)

Essa é a parte mais “sensível” e elegante do sistema, então vocês estão fazendo certo em usar **WebView controlada**, sem baixar imagens nem “raspar” conteúdo.

#### **Modelo adotado**

* O app **não usa API oficial do Pinterest**.
* Em vez disso, usa uma **WebView** que abre uma URL de busca, por exemplo:

```text
https://www.pinterest.com/search/pins/?q=evangelion+unit+01+art
```

#### **Fluxo do usuário**

1. Cliente faz uma busca no app e não encontra o que quer.
2. O app oferece: **“Ver inspirações no Pinterest”**.
3. Abre uma WebView com o Pinterest já buscando o termo.
4. Quando o cliente entra em um **pin específico**:

   * O app detecta a URL com padrão `/pin/` (ex.: `.../pin/123456789/`).
   * Habilita o botão: **“Selecionar esta imagem como referência”**.
5. Ao clicar no botão:

   * A WebView fecha.
   * O app vai para o formulário de sugestão, já com:

     * `pinUrl` (URL do pin)
     * Opcionalmente um campo de preview (thumbnail vinda do oEmbed em fase futura)

#### **Armazenamento**

* O banco salva somente:

  * `pinUrl`
  * Tema
  * Descrição
  * Dados de contato
  * Status da sugestão

> Nada de baixar a imagem, nem de reutilizá-la diretamente como produto — ela é apenas **referência de gosto** do cliente. A estampa final é criada pela loja, de forma autoral.

#### **Cuidados técnicos e éticos**

* Não violar direitos autorais:

  * A imagem é referência, não produto final.
* Não fazer scraping automatizado.
* Não depender da estrutura HTML do Pinterest — só da URL de navegação.

---

### 🔹 4) Outras integrações 


* **Firebase Cloud Messaging (FCM)**

  * Para notificações push quando o pedido muda de status.

* **Mercado Pago / Pagamentos avançados**

  * Para transformar o app em e-commerce com pagamento integrado.

* **APIs de frete (Correios / Melhor Envio)**

  * Para cálculo de frete e envio.

Você pode colocar numa frase tipo:

