//****************************************************************
//* CangStream Framework v1.0
//* Module: Mainapp
//* Author: Li Qingsheng
//* Organization: Zhejiang University of Media and Communications
//* Creation Date: 2025-12-15
//* Description: Thread-safe state management with mutex protection
//****************************************************************

// 应用入口 - 示例应用
package cangstream
import cangstream.core.*

main() {
    let app = CangStreamApp()
    
    app.setUIBuilder({ app =>
        app.title("🎯 CangStream 演示应用")
        app.header("欢迎使用仓颉 Web 框架")
        
        app.text("这是一个类似 Streamlit 的纯仓颉 Web 框架，无需编写 HTML/CSS/JS！")
        
        let name = app.textInput("请输入您的名字", "用户", "name")
        let age = app.slider("选择年龄", 1, 100, 25, "age")
        
        if (app.button("👋 打招呼", "greet")) {
            app.text("你好，${name}！你 ${age} 岁了。")
        }
        
        app.header("数据指标", 2)
        
        app.metric("总用户数", "1,234", "+12%")
        app.metric("活跃用户", "856", "+5%")
        
        app.header("代码示例", 2)
        app.code("""
        let app = CangStreamApp()
        app.setUIBuilder({ app =>
            app.title("我的应用")
            app.text("Hello, CangStream!")
        })
        app.run()
        """, "cangjie")
    })
    
    app.run()
}