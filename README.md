# CangStream(仓穹)
## 仓穹——源自仓颉，广阔如穹的Web框架，用纯仓颉代码构建交互式Web应用
<div align="center">

![CangStream Logo](https://img.shields.io/badge/CangStream-v0.1.0-purple?style=for-the-badge)
![Cangjie](https://img.shields.io/badge/Cangjie-1.0.0+-blue?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

**🚀 用纯仓颉代码快速构建 Web 应用的框架**

像写 Python Streamlit 一样简单 | 无需 HTML/CSS/JS | 10 行代码即可上线

[快速开始](#快速开始) · [文档](#文档) · [示例](#示例) 

</div>

---

## ✨ 特性

- 🎨 **纯仓颉编写** - 只需要懂仓颉，零前端知识要求
- ⚡ **快速开发** - 10 行代码构建交互式 Web 应用
- 🎯 **声明式 API** - 直观的函数调用，自动生成美观 UI
- 🔄 **响应式交互** - 自动处理用户输入和状态同步
- 🧵 **线程安全** - 内置 Mutex 保证并发安全
- 📦 **模块化设计** - 清晰的代码结构，易于扩展
- 🌈 **现代化主题** - 内置渐变紫色主题，开箱即用

## 🎯 适用场景

- 📊 数据可视化仪表板
- 🤖 AI/ML 模型演示
- 🛠️ 内部管理工具
- 🧪 快速原型验证
- 📈 实时数据监控
- 🎓 教学演示应用

---

## 📦 快速开始

### 安装要求

```bash
# 仓颉编译器版本
cangjie >= 1.0.0
```

### Hello World

创建 `main.cj` 文件：

```cangjie
import cangstream.core.*

main() {
    let app = CangStreamApp()
    
    app.setUIBuilder({ app =>
        app.title("🎉 Hello CangStream")
        app.text("我的第一个仓颉 Web 应用！")
    })
    
    app.run()
}
```

运行：

```bash
cjpm run
# 🚀 CangStream 应用启动在 http://127.0.0.1:8080
```

打开浏览器访问 http://127.0.0.1:8080，你的应用已经上线！🎊

---

## 📚 示例

### 1. 交互式计数器

```cangjie
import cangstream.core.*

main() {
    let app = CangStreamApp()
    
    app.setUIBuilder({ app =>
        app.title("📊 智能计数器")
        
        let count = app.slider("选择数值", 0, 100, 50, "count")
        
        if (app.button("🔢 计算双倍", "calc_btn")) {
            app.metric("结果", "${count * 2}", "+${count}")
        }
    })
    
    app.run()
}
```

### 2. 用户表单

```cangjie
main() {
    let app = CangStreamApp()
    
    app.setUIBuilder({ app =>
        app.title("📝 用户注册")
        
        let name = app.textInput("姓名", "", "name")
        let age = app.slider("年龄", 18, 65, 25, "age")
        let email = app.textInput("邮箱", "", "email")
        
        if (app.button("提交", "submit")) {
            app.header("注册成功！", 2)
            app.text("姓名: ${name}")
            app.text("年龄: ${age}")
            app.text("邮箱: ${email}")
        }
    })
    
    app.run()
}
```

### 3. 数据仪表板

```cangjie
main() {
    let app = CangStreamApp()
    
    app.setUIBuilder({ app =>
        app.title("📊 销售数据仪表板")
        
        let threshold = app.slider("销售阈值", 0, 1000, 500, "threshold")
        
        app.header("核心指标")
        app.metric("总销售额", "¥ 125,678", "+15.3%")
        app.metric("订单数量", "2,345", "+8.7%")
        
        if (threshold > 500) {
            app.metric("优质客户", "187", "+12%")
        } else {
            app.metric("全部客户", "856", "+5%")
        }
    })
    
    app.run()
}
```

更多示例请查看 [examples/](examples/) 目录。

---

## 🎨 组件 API

### 文本展示

```cangjie
app.title("大标题")                    // H1 标题
app.header("二级标题")                 // H2 标题
app.header("三级标题", 3)              // H3 标题
app.text("这是一段文字")                // 段落文本
```

### 交互输入

```cangjie
// 按钮
if (app.button("点击我", "btn_key")) {
    // 按钮被点击后执行
}

// 文本输入框
let name = app.textInput("姓名", "默认值", "name_key")

// 滑动条
let age = app.slider("年龄", 0, 100, 25, "age_key")
```

### 数据展示

```cangjie
// 指标卡片
app.metric("用户数", "1,234")
app.metric("增长率", "+15%", "↑ 12 用户")

// 代码展示
app.code("let x = 42", "cangjie")
```

完整 API 文档：[docs/API.md](docs/API.md)

---

## 🏗️ 项目结构

```
cangstream/
├── src/
│   ├── cangstream/
│   │   ├── core/              # 核心模块
│   │   │   ├── app.cj         # CangStreamApp 主类
│   │   │   ├── state.cj       # SessionState 状态管理
│   │   │   └── component.cj   # Component 接口
│   │   │
│   │   ├── components/        # UI 组件库
│   │   │   ├── text.cj        # 文本组件
│   │   │   ├── input.cj       # 输入组件
│   │   │   ├── display.cj     # 展示组件
│   │   │   └── layout.cj      # 布局组件
│   │   │
│   │   └── server/            # 服务器模块
│   │       └── http_server.cj # HTTP 服务器
│   │
│   └── main.cj                # 应用入口
│
├── examples/                  # 示例应用
│   ├── hello_world.cj
│   ├── counter.cj
│   └── dashboard.cj
│
├── docs/                      # 文档
│   ├── API.md
│   ├── ARCHITECTURE.md
│   └── TUTORIAL.md
│
├── cjpm.toml                  # 项目配置
├── LICENSE                    # MIT 许可证
└── README.md                  # 本文件
```

---

## 🔧 工作原理

### 架构图

```
┌─────────────────────────────────────────┐
│         浏览器 (Browser)                 │
│    http://127.0.0.1:8080                │
└──────────────┬──────────────────────────┘
               │ HTTP Request/Response
               ↓
┌─────────────────────────────────────────┐
│    HTTP 服务器 (stdx.net.http)           │
│  • GET /        → 返回 HTML             │
│  • POST /action → 处理交互              │
└──────────────┬──────────────────────────┘
               │
               ↓
┌─────────────────────────────────────────┐
│      CangStreamApp (核心应用)            │
│  • UI 构建函数 (buildUI)                │
│  • 组件树 (components)                  │
│  • 状态管理 (SessionState)              │
└─────────────────────────────────────────┘
```

### 工作流程

1. **用户访问** → HTTP 服务器接收 GET 请求
2. **UI 构建** → 执行 buildUI 函数生成组件树
3. **渲染 HTML** → 遍历组件调用 render() 方法
4. **返回页面** → 浏览器显示美观的 Web 界面
5. **用户交互** → JavaScript 发送 POST 请求
6. **状态更新** → SessionState 保存用户输入
7. **页面刷新** → 重新执行步骤 2-4

详细架构说明：[docs/ARCHITECTURE.md](docs/ARCHITECTURE.md)

---

## 📖 文档

- [API 参考](docs/API.md) - 完整的组件 API 文档
- [架构设计](docs/ARCHITECTURE.md) - 框架内部原理
- [教程](docs/TUTORIAL.md) - 从入门到精通
- [最佳实践](docs/BEST_PRACTICES.md) - 开发建议和技巧
- [常见问题](docs/FAQ.md) - 故障排查指南

---


## 🗺️ 路线图

### v0.1.0 (当前版本) ✅

- [x] 基础组件（标题、文本、按钮、输入框、滑块）
- [x] HTTP 服务器
- [x] 状态管理
- [x] 示例应用

### v0.2.0 (计划中) 🔄

- [ ] 更多输入组件（复选框、单选框、下拉框）
- [ ] 布局系统（多列、侧边栏、标签页）
- [ ] 图表组件（折线图、柱状图、饼图）
- [ ] 文件上传
- [ ] 数据表格

### v0.3.0 (长期目标) 🎯

- [ ] WebSocket 支持（无刷新更新）
- [ ] 主题系统（自定义颜色和样式）
- [ ] 插件机制
- [ ] 性能优化
- [ ] 国际化支持

---

## 💡 灵感来源

CangStream 受到以下优秀项目的启发：

- [Streamlit](https://streamlit.io/) - Python 数据应用框架
- [Gradio](https://gradio.app/) - ML 模型演示工具
- [Shiny](https://shiny.rstudio.com/) - R 语言 Web 框架

---

## 📄 许可证

本项目采用 MIT 许可证 - 详见 [LICENSE](LICENSE) 文件

---

## 🙏 致谢

感谢所有为 CangStream 做出贡献的开发者！

特别感谢：
- 华为仓颉团队提供优秀的编程语言
- 开源社区的支持和反馈

---

## 📞 联系我们

- 🐛 提交 Bug：[Issues](https://github.com/yourusername/cangstream/issues)
- 💬 讨论交流：[Discussions](https://github.com/yourusername/cangstream/discussions)
- 📧 邮件联系：aylqs@163.com
- 🌐 官方网站：https://cangstream.aifollow.cn

---

## 🌟 Star History

如果这个项目对你有帮助，请给我们一个 Star ⭐️！

[![Star History Chart](https://api.star-history.com/svg?repos=yourusername/cangstream&type=Date)](https://star-history.com/#yourusername/cangstream&Date)

---

<div align="center">

**用仓颉构建 Web 应用，从未如此简单！** 🚀



[⬆️ 回到顶部](#cangstream)

</div>
