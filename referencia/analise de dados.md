
# **✨ OPÇÃO A — Dashboard simples dentro do app (viável agora)**

Não é pesado, não exige gráficos ultra complexos.

## O que dá pra mostrar:

* Total de pedidos do dia
* Total do mês
* Top 5 animes mais pedidos
* Top 5 bandas mais pedidas
* Tamanhos mais comuns (ex.: M > G > GG…)
* Cores mais usadas
* Sugestões mais enviadas

## Como fazer?

Você lê o Firestore e faz os agrupamentos via JavaScript:

```js
// Exemplo simples
const counts = pedidos.reduce((acc, p) => {
  acc[p.tema] = (acc[p.tema] || 0) + p.quantidade;
  return acc;
}, {});
```

## Visual:

Você pode usar:

* **Charts.js** (via WebView)
* Ou simplesmente **tabelas + barrinhas horizontais** (super leve e bonito)

> Essa opção é totalmente viável para entregar agora.

---

# **✨ OPÇÃO B — Dashboard profissional dentro do app (viável, mas fase 2)**

Aqui já entra power total:

## Gráficos:

* Barras
* Pizza
* Linha
* Radar
* Heatmaps diários de vendas

## Tecnologias:

* **Victory Native**
* **Recharts (via WebView)**
* **React Native SVG Charts**
* **ECharts**

Funciona, mas:

* Aumenta complexidade
* Exige componentes mais pesados
* Precisa de mais tempo para polir

> Bom para fase 2 ou versão final do projeto.

---


# 🧠 O que você devemos incluir no perfil do lojista hoje:

## **1) Dashboard inicial**

* Pedidos hoje
* Pendências
* Aguardando pagamento
* Sugestões novas

## **2) Análises rápidas**

* Top animes
* Top bandas
* Tamanhos mais vendidos
* Cores mais usadas
* Estampas com mais cliques
* Busca sem resultado (puxado de logs)

## **3) Gestão**

* Atualizar status do pedido
* Ver detalhes da sugestão
* Marcar sugestão como “em análise” ou “aprovada”

## **4) Exportar CSV / JSON**

Botão simples que gera arquivo e baixa no celular.

