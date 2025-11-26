# 📊 Script para Popular o Catálogo no Firebase

Este documento contém os dados estruturados para popular o Firebase com o catálogo inicial da Geek Floripa.

## 🎯 Como Usar

Você pode popular o Firebase de duas formas:

### **Opção 1: Manualmente via Console** (Mais Simples)
1. Acesse o Firebase Console
2. Vá em Firestore Database
3. Para cada item abaixo, clique em "Adicionar documento"
4. Copie e cole os campos

### **Opção 2: Via Script** (Mais Rápido)
Criar um arquivo `populate-firestore.ts` na pasta `app/scripts/` e executá-lo uma vez.

---

## 📁 Estrutura das Pastas de Imagens

Você tem:
```
animes/
  ├── Naruto/
  │   ├── POSTER_NARUTO.jpg (capa)
  │   └── [15 estampas].jpg
  ├── One Piece/
  │   ├── POSTER_ONEPIECE.jpg
  │   └── [20 estampas].jpg
  ├── Demon Slayer/
  ├── Jujutsu Kaisen/
  └── Dan Da Dan/

bandas de rock/
  ├── Metallica/
  │   ├── POSTER_METALLICA.jpg
  │   └── [9 estampas].jpg
  ├── Nirvana/
  │   ├── POSTER_NIRVANA.jpg
  │   └── [11 estampas].jpg
  ├── Pink Floyd/
  ├── Black Sabbath/
  └── Foo Fighters/
```

---

## 🔥 Passo 1: Upload das Imagens

### Firebase Storage (Recomendado)

1. No Firebase Console, clique em **Storage** no menu lateral
2. Clique em **"Começar"** ou **"Get Started"**
3. Aceite as regras padrão
4. Crie a seguinte estrutura de pastas:

```
storage/
  ├── temas/
  │   ├── animes/
  │   │   ├── POSTER_NARUTO.jpg
  │   │   ├── POSTER_ONEPIECE.jpg
  │   │   ├── POSTER_DEMONSLAYER.jpg
  │   │   ├── POSTER_JUJUTSUKAISEN.jpg
  │   │   └── POSTER_DANDADAN.jpg
  │   └── bandas/
  │       ├── POSTER_METALLICA.jpg
  │       ├── POSTER_NIRVANA.jpg
  │       ├── POSTER_PINKFLOYD.jpg
  │       ├── POSTER_BLACKSABBATH.jpg
  │       └── POSTER_FOOFIGHTERS.jpg
  └── estampas/
      ├── naruto/
      │   ├── estampa-001.jpg
      │   ├── estampa-002.jpg
      │   └── ...
      ├── onepiece/
      ├── metallica/
      └── ...
```

5. Para cada imagem, faça upload e copie a **URL pública**

### Configurar Regras do Storage

No Firebase Console > Storage > Rules, cole:

```
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {
    match /{allPaths=**} {
      allow read: if true;  // Leitura pública
      allow write: if false; // Escrita só via console
    }
  }
}
```

---

## 📝 Passo 2: Dados para a Coleção `temas`

Crie 10 documentos na coleção `temas`:

### ANIMES

#### Documento 1: Naruto
```json
{
  "tipo": "anime",
  "nome": "Naruto",
  "posterUrl": "URL_DO_POSTER_NARUTO",
  "totalEstampas": 15,
  "ativo": true
}
```
**ID sugerido**: `naruto`

#### Documento 2: One Piece
```json
{
  "tipo": "anime",
  "nome": "One Piece",
  "posterUrl": "URL_DO_POSTER_ONEPIECE",
  "totalEstampas": 20,
  "ativo": true
}
```
**ID sugerido**: `onepiece`

#### Documento 3: Demon Slayer
```json
{
  "tipo": "anime",
  "nome": "Demon Slayer",
  "posterUrl": "URL_DO_POSTER_DEMONSLAYER",
  "totalEstampas": 0,
  "ativo": true
}
```
**ID sugerido**: `demonslayer`
**Nota**: Ajuste `totalEstampas` após contar quantas estampas você tem

#### Documento 4: Jujutsu Kaisen
```json
{
  "tipo": "anime",
  "nome": "Jujutsu Kaisen",
  "posterUrl": "URL_DO_POSTER_JUJUTSUKAISEN",
  "totalEstampas": 0,
  "ativo": true
}
```
**ID sugerido**: `jujutsukaisen`

#### Documento 5: Dan Da Dan
```json
{
  "tipo": "anime",
  "nome": "Dan Da Dan",
  "posterUrl": "URL_DO_POSTER_DANDADAN",
  "totalEstampas": 0,
  "ativo": true
}
```
**ID sugerido**: `dandadan`

### BANDAS DE ROCK

#### Documento 6: Metallica
```json
{
  "tipo": "banda",
  "nome": "Metallica",
  "posterUrl": "URL_DO_POSTER_METALLICA",
  "totalEstampas": 9,
  "ativo": true
}
```
**ID sugerido**: `metallica`

#### Documento 7: Nirvana
```json
{
  "tipo": "banda",
  "nome": "Nirvana",
  "posterUrl": "URL_DO_POSTER_NIRVANA",
  "totalEstampas": 11,
  "ativo": true
}
```
**ID sugerido**: `nirvana`

#### Documento 8: Pink Floyd
```json
{
  "tipo": "banda",
  "nome": "Pink Floyd",
  "posterUrl": "URL_DO_POSTER_PINKFLOYD",
  "totalEstampas": 0,
  "ativo": true
}
```
**ID sugerido**: `pinkfloyd`

#### Documento 9: Black Sabbath
```json
{
  "tipo": "banda",
  "nome": "Black Sabbath",
  "posterUrl": "URL_DO_POSTER_BLACKSABBATH",
  "totalEstampas": 0,
  "ativo": true
}
```
**ID sugerido**: `blacksabbath`

#### Documento 10: Foo Fighters
```json
{
  "tipo": "banda",
  "nome": "Foo Fighters",
  "posterUrl": "URL_DO_POSTER_FOOFIGHTERS",
  "totalEstampas": 0,
  "ativo": true
}
```
**ID sugerido**: `foofighters`

---

## 🎨 Passo 3: Dados para a Coleção `catalogo`

Para cada estampa, crie um documento. Exemplo para **Naruto**:

### Template de Estampa
```json
{
  "tipo": "anime",
  "tema": "Naruto",
  "nomeEstampa": "Kakashi 01",
  "imagemUrl": "URL_DA_ESTAMPA",
  "tags": ["shounen", "konoha", "kakashi"],
  "ativo": true,
  "preco": 80,
  "dataCriacao": 1700000000000
}
```

### Tags Sugeridas por Tema

#### Naruto
- Tags: `["naruto", "shounen", "konoha", "ninja", "uzumaki", "uchiha", "sasuke", "sakura", "kakashi"]`

#### One Piece
- Tags: `["onepiece", "shounen", "pirata", "luffy", "zoro", "nami", "mugiwara", "grand line"]`

#### Demon Slayer
- Tags: `["demonslayer", "kimetsu", "shounen", "tanjiro", "nezuko", "hashira", "demon"]`

#### Jujutsu Kaisen
- Tags: `["jujutsu", "shounen", "yuji", "gojo", "sukuna", "maldição", "feiticeiro"]`

#### Dan Da Dan
- Tags: `["dandadan", "shounen", "alien", "yokai", "sobrenatural"]`

#### Metallica
- Tags: `["metallica", "metal", "thrash", "rock", "heavy"]`

#### Nirvana
- Tags: `["nirvana", "grunge", "rock", "alternativo", "seattle"]`

#### Pink Floyd
- Tags: `["pinkfloyd", "rock", "progressivo", "psicodelico", "classico"]`

#### Black Sabbath
- Tags: `["blacksabbath", "metal", "doom", "heavy", "ozzy"]`

#### Foo Fighters
- Tags: `["foofighters", "rock", "alternativo", "grunge", "dave grohl"]`

---

## 🤖 Script Automatizado (Opcional)

Criar arquivo `app/scripts/populate-firestore.ts`:

```typescript
import { collection, addDoc } from 'firebase/firestore';
import { db } from '../src/services/firebase';

// Dados dos temas
const temas = [
  { id: 'naruto', tipo: 'anime', nome: 'Naruto', posterUrl: 'URL', totalEstampas: 15 },
  { id: 'onepiece', tipo: 'anime', nome: 'One Piece', posterUrl: 'URL', totalEstampas: 20 },
  // ... adicionar todos os temas
];

// Função para popular
const popularTemas = async () => {
  for (const tema of temas) {
    await addDoc(collection(db, 'temas'), tema);
    console.log(`Tema ${tema.nome} adicionado!`);
  }
};

// Executar
popularTemas().then(() => {
  console.log('✅ Catálogo populado com sucesso!');
}).catch((error) => {
  console.error('❌ Erro:', error);
});
```

---

## ✅ Checklist de População

- [ ] Upload de todos os POSTERs no Firebase Storage
- [ ] Upload de todas as estampas no Firebase Storage
- [ ] Copiar todas as URLs das imagens
- [ ] Criar 10 documentos na coleção `temas`
- [ ] Criar documentos na coleção `catalogo` para cada estampa
- [ ] Testar se as imagens carregam no app
- [ ] Conferir se as tags estão corretas
- [ ] Verificar contagem de `totalEstampas` por tema

---

## 💡 Dicas Importantes

### Nomear Estampas
Siga um padrão:
- `Naruto - Kakashi 01`
- `One Piece - Luffy Gear 5`
- `Metallica - Master of Puppets`

### IDs dos Documentos
Use IDs automáticos ou siga padrão:
- `naruto-001`, `naruto-002`, ...
- `metallica-001`, `metallica-002`, ...

### Preços
Por padrão, todas as estampas têm `preco: 80`.
O cálculo final considera tamanho e localização da estampa.

---

✨ **Pronto!** Após popular o Firebase, seu catálogo estará pronto para ser consumido pelo app!
