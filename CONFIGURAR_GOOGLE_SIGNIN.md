# Configuração Google Sign-In

## Passo 1: Configurar no Firebase Console

1. Acesse o [Firebase Console](https://console.firebase.google.com/)
2. Selecione o projeto **geek-floripa-mvp**
3. Vá em **Authentication** > **Sign-in method**
4. Clique em **Google** e depois em **Enable**
5. Configure o **Project support email** (seu email)
6. Salve

## Passo 2: Obter Web Client ID

1. Ainda no Firebase Console, vá em **Project Settings** (ícone de engrenagem)
2. Na aba **General**, role até a seção **Your apps**
3. Você verá o app Web registrado
4. Copie o **Web client ID** que aparece nas configurações
   - Formato: `722781945204-xxxxxxxxxxxxxxxxx.apps.googleusercontent.com`

## Passo 3: Configurar no app.json

Cole o Web Client ID no campo `webClientId` do arquivo `app.json`:

```json
{
  "expo": {
    ...
    "plugins": [
      "expo-mail-composer",
      "expo-font",
      [
        "@react-native-google-signin/google-signin",
        {
          "webClientId": "COLE_AQUI_O_WEB_CLIENT_ID"
        }
      ]
    ]
  }
}
```

## Passo 4: Após configurar

Após adicionar o Web Client ID no `app.json`, me avise para eu continuar com a implementação do código!

## Observações

- O Web Client ID é diferente da API Key
- Você pode encontrar também em: Firebase Console > Project Settings > General > Web API Key
- Para Android/iOS em produção, será necessário configurar SHA-1/SHA-256, mas para Expo Go não é necessário
