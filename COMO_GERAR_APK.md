# 📱 Como Gerar o APK do Geek Floripa

## 🎯 Método 1: EAS Build (Recomendado - Gratuito)

### **Pré-requisitos:**
1. Conta no Expo (crie em https://expo.dev)
2. EAS CLI instalado (o script já instala automaticamente)

---

## 🚀 Passo a Passo Rápido

### **1. Fazer Login no Expo**
Abra o terminal PowerShell no projeto e execute:

```powershell
cd "c:\Users\serei\OneDrive\Área de Trabalho\PROJETOS_MOBILE\Geek Floripa_MVP\app"
eas login
```

Digite seu e-mail e senha do Expo.

---

### **2. Gerar o APK**

**Opção A: Usar o script automático (MAIS FÁCIL)**

Clique 2x no arquivo: **`build-apk.bat`**
- Escolha opção `1` para APK de teste
- Escolha opção `2` para APK de apresentação

**Opção B: Comando manual**

```powershell
# APK de Preview (mais rápido, para testes)
eas build --platform android --profile preview

# APK de Produção (otimizado, para apresentação)
eas build --platform android --profile production
```

---

### **3. Aguardar o Build**

O Expo vai:
1. ✅ Fazer upload do código (1-2 min)
2. ✅ Compilar o APK na nuvem (10-15 min)
3. ✅ Gerar link de download

Você pode:
- Aguardar no terminal OU
- Fechar e acompanhar em: https://expo.dev/accounts/[seu-usuario]/projects/geek-floripa/builds

---

### **4. Baixar e Instalar**

Quando finalizar:
1. Copie o link que aparece no terminal
2. Abra no navegador
3. Baixe o APK
4. Transfira para o celular
5. Instale (ative "Fontes desconhecidas" se necessário)

---

## 📦 Configurações do Projeto

Já configurei tudo no `app.json` e `eas.json`:

**App Info:**
- Nome: Geek Floripa
- Package: com.geekfloripa.app
- Versão: 1.0.0

**Build Profiles:**
- `preview`: APK rápido para testes
- `production`: APK otimizado para apresentação

---

## 🎓 Para a Apresentação

### **Recomendação:**

Gere o APK com 1-2 dias de antecedência:
```powershell
eas build --platform android --profile production
```

Você receberá:
- ✅ APK instalável (15-30 MB)
- ✅ Otimizado e compactado
- ✅ Pronto para distribuição

---

## 🐛 Troubleshooting

### **Erro: "EAS CLI not found"**
```powershell
npm install -g eas-cli
```

### **Erro: "Not logged in"**
```powershell
eas login
```

### **Erro: "No Expo account"**
Crie gratuitamente em: https://expo.dev

### **Build falhou?**
Verifique os logs em: https://expo.dev

---

## 🆚 Comparação dos Métodos

| Aspecto | EAS Build | Expo Build (Antigo) |
|---------|-----------|---------------------|
| Custo | Grátis | Grátis (deprecated) |
| Tempo | 10-15 min | 15-20 min |
| Qualidade | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ |
| Status | ✅ Atual | ⚠️ Descontinuado |

**Use EAS Build!**

---

## 💡 Dicas

1. **Build demora?** É normal! Vai tomar um café ☕

2. **Quer build local?** Requer Android Studio e é mais complexo

3. **Múltiplas versões?** Altere `versionCode` no `app.json`

4. **Google Play?** Use `buildType: "aab"` ao invés de `"apk"`

---

## 📞 Suporte

- Documentação EAS: https://docs.expo.dev/build/introduction/
- Fórum Expo: https://forums.expo.dev/
- Discord Expo: https://chat.expo.dev/

---

**Criado para apresentação do Geek Floripa MVP** 🚀
