# Code Companion AI 助手使用指南

## 概述

Code Companion 是一個強大的 AI 編程助手插件，支持多種 AI 模型，包括 Qwen 和 Gemini。

## 安裝要求

### 1. Ollama（用於 Qwen 模型）
```bash
# 安裝 Ollama
curl -fsSL https://ollama.ai/install.sh | sh

# 下載 Qwen 模型
ollama pull Qwen/Qwen2.5-0.5B-Instruct
```

### 2. API 密鑰配置

#### 方法一：使用環境變量文件
```bash
# 複製示例文件
cp ~/.config/nvim/codecompanion_env.example ~/.config/nvim/codecompanion_env

# 編輯文件，填入您的 API 密鑰
nano ~/.config/nvim/codecompanion_env

# 在 shell 配置文件中添加（~/.zshrc 或 ~/.bashrc）
echo 'source ~/.config/nvim/codecompanion_env' >> ~/.zshrc
```

#### 方法二：直接在 shell 配置文件中設置
```bash
# 編輯 shell 配置文件
nano ~/.zshrc

# 添加以下內容：
export GOOGLE_API_KEY="your_google_api_key_here"
export OPENAI_API_KEY="your_openai_api_key_here"
export ANTHROPIC_API_KEY="your_anthropic_api_key_here"

# 重新加載配置
source ~/.zshrc
```

#### 支持的 API 服務
- **Google AI API** (Gemini): `GOOGLE_API_KEY`
- **OpenAI API** (GPT-4, GPT-3.5): `OPENAI_API_KEY`
- **Anthropic API** (Claude): `ANTHROPIC_API_KEY`
- **Ollama API** (本地部署): `OLLAMA_API_KEY` (通常不需要)

#### API 密鑰獲取指南

##### Google AI API (Gemini)
1. 訪問 [Google AI Studio](https://makersuite.google.com/app/apikey)
2. 登錄您的 Google 帳戶
3. 點擊 "Create API Key"
4. 複製生成的 API 密鑰

##### OpenAI API
1. 訪問 [OpenAI Platform](https://platform.openai.com/api-keys)
2. 登錄您的 OpenAI 帳戶
3. 點擊 "Create new secret key"
4. 複製生成的 API 密鑰

##### Anthropic API (Claude)
1. 訪問 [Anthropic Console](https://console.anthropic.com/)
2. 登錄您的 Anthropic 帳戶
3. 點擊 "Create Key"
4. 複製生成的 API 密鑰

## 快捷鍵

| 快捷鍵 | 命令 | 描述 |
|--------|------|------|
| `<leader>cc` | `CodeCompanion` | 打開 Code Companion 主界面 |
| `<leader>cC` | `CodeCompanionChat` | 打開聊天窗口 |
| `<leader>ce` | `CodeCompanionExplain` | 解釋選中的代碼 |
| `<leader>cf` | `CodeCompanionFix` | 修復代碼問題 |
| `<leader>co` | `CodeCompanionOptimize` | 優化代碼 |
| `<leader>ct` | `CodeCompanionTest` | 生成測試代碼 |
| `<leader>cd` | `CodeCompanionDocs` | 生成文檔 |

## 功能特性

### 1. 代碼解釋
- 選中代碼後使用 `<leader>ce` 解釋代碼功能
- 支持多種編程語言
- 提供詳細的技術說明

### 2. 代碼修復
- 自動檢測和修復常見問題
- 支持語法錯誤修復
- 提供最佳實踐建議

### 3. 代碼優化
- 性能優化建議
- 可讀性改進
- 安全性增強
- 最佳實踐應用

### 4. 測試生成
- 自動生成單元測試
- 集成測試支持
- 端到端測試框架

### 5. 文檔生成
- README 文件生成
- API 文檔生成
- 內聯註釋生成
- 代碼註釋優化

## 配置說明

### 模型配置
- **Qwen**: 使用 Ollama 本地運行，支持離線使用
- **Gemini**: 使用 Google AI API，需要網絡連接

### 窗口配置
- 聊天窗口：80% 屏幕大小，圓角邊框
- 解釋窗口：60% 寬度，70% 高度
- 所有窗口都支持調整大小

### 上下文配置
- 支持 1000+ 種文件類型
- 最大上下文行數：1000 行
- 自動包含相關註釋

## 使用技巧

### 1. 有效提問
- 提供具體的問題描述
- 包含相關的代碼上下文
- 說明期望的輸出格式

### 2. 代碼選擇
- 選中相關的代碼塊
- 包含必要的上下文信息
- 避免選擇過大的代碼範圍

### 3. 模型選擇
- **Qwen**: 適合本地開發，響應速度快
- **Gemini**: 適合複雜問題，理解能力強

## 故障排除

### 1. Ollama 連接問題
```bash
# 檢查 Ollama 服務狀態
ollama list

# 檢查 Qwen 模型是否已安裝
ollama list | grep Qwen

# 如果模型未安裝，執行：
ollama pull Qwen/Qwen2.5-0.5B-Instruct

# 重啟 Ollama 服務
ollama serve
```

### 2. API 密鑰問題
```bash
# 檢查所有 API 密鑰
echo "Google API Key: ${GOOGLE_API_KEY:0:10}..."
echo "OpenAI API Key: ${OPENAI_API_KEY:0:10}..."
echo "Anthropic API Key: ${ANTHROPIC_API_KEY:0:10}..."

# 測試 Google API 連接
curl -H "Authorization: Bearer $GOOGLE_API_KEY" \
  https://generativelanguage.googleapis.com/v1beta/models

# 測試 OpenAI API 連接
curl -H "Authorization: Bearer $OPENAI_API_KEY" \
  https://api.openai.com/v1/models

# 測試 Anthropic API 連接
curl -H "x-api-key: $ANTHROPIC_API_KEY" \
  https://api.anthropic.com/v1/models
```

### 3. 插件加載問題
```vim
:checkhealth codecompanion
:LspInfo
```

## 高級配置

### 自定義模型參數
在 `lua/plugins/codecompanion.lua` 中修改：
```lua
parameters = {
  temperature = 0.7,  -- 創意度 (0.0-1.0)
  top_p = 0.9,        -- 核採樣 (0.0-1.0)
  max_tokens = 4096,  -- 最大輸出長度
}
```

### 自定義快捷鍵
在配置文件中修改 `keys` 部分：
```lua
keys = {
  { "<leader>cc", "<cmd>CodeCompanion<cr>", desc = "Code Companion" },
  -- 添加自定義快捷鍵
}
```

## 更新日誌

- 支持 Qwen 2.5 7B 模型
- 支持 Gemini Pro 模型
- 完整的窗口配置
- 豐富的上下文支持
- 歷史記錄功能
- 詳細的日誌記錄

## 貢獻

歡迎提交 Issue 和 Pull Request 來改進這個配置！

## 許可證

MIT License 
