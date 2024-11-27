# touying-ustc

**www.中国科学技术大学.com**

To reduce the learning curve for beginners and lower the project's coupling, the project has been divided into multiple `.typ` files. Please follow these steps:  
为了降低新手上路的代码分析成本以及降低项目的耦合性，特将项目拆分成多个`.typ`文件，请按以下步骤了解：

1. **`main.typ`** is the entry point for rendering. Beginners should start here. // Step 1  
`main.typ`是渲染的入口，新手上路直接从这里开始。//第一步

2. Inside **`main.typ`**, the file **`config.typ`** is imported. This is the configuration file where you can modify the cover title, subtitle, author, and other details. No need to worry about other configurations. // Step 2  
`main.typ`中导入了`config.typ`，这是配置文件，封面的标题，副标题，作者等信息在这里修改，其他你无须烦恼。//第二步

3. **`config.typ`** imports **`theme.typ`** and **`lib.typ`**, which beginners can skip for now.  
`config.typ`中导入了`theme.typ`和`lib.typ`，新手上路可以暂时跳过。

- **`theme.typ`**: This is equivalent to CSS, controlling the appearance of the template. If you're unsatisfied with the template's style—such as fonts, image assets, navigation functions, or if you want to adapt it to another institution's theme—you can modify it here. Note: It has a steep learning curve and isn't essential for beginners.  
`theme.typ`相当于`CSS`,控制着模板长什么样，如果你对模板的样式不满意，包括字体，图片素材，跳转功能，或者改成其他学校的主题，在这里修改成你希望的样子。学习曲线较陡峭，初学者无需关心

- **`lib.typ`**: Contains third-party packages and custom functions. When the template's default packages are insufficient for your needs, or you want to define custom utility functions, add them here to maintain the project's structure and low coupling.  
`lib.typ`中是第三方包和自定义函数，当模板中的包不能满足你的需求，或者想自定义一些常用函数，请把它们放在这里以保持项目的结构性和低耦合。

**`content.typ`** is where you add your actual content. Level 1 headings represent the outline, level 2 headings are page titles, and subsequent levels are treated as content within the page without special hierarchy. // Step 3 
`content.typ`这是你放实际内容的地方，一级标题是大纲，二级标题是当页的标题，之后的n级标题都在页内作为内容显示，无特殊地位。//第三步


# File Descriptions  文件说明
- `assets`: Resources for the template  模板资源文件
    -   `img`: Images used in the template  模板图片文件

- `template`: Reusable components  可复用组件
    - []

- `config.typ`  : Configuration file, including cover details.  配置文件，包括封面的信息在这里。
- `content.typ` : The place to add your content.  只需在此处添加内容
- `lib.typ`     : Library file for importing third-party libraries and custom functions.  库文件，导入第三方库请在这导入
- `main.typ`    : Entry point for compilation. You may need to place `#show` here when importing third-party libraries.  编译入口，导入第三方库时有可能需要把`#show`放在此处
- `theme.typ`   : Theme file for customizing styles.  主题文件，可自行修改样式

# How to Use  使用方法
1. Install the following VS Code extensions: `Typst LSP`, `Tinymist Typst`, `Typst Sync`.  vscode下载插件`Typst LSP`,`Tinymist Typst`,`Typst Sync`。
2. Open this project and click `Preview` in `main.typ`. If you click `Preview` in `content.typ`, it will display a Markdown-like document layout.  打开本项目，在`main.typ`中点击`preview`。若在`content.typ`中点击`preview`，则预览类似`markdown`的文档排版。

# Notes   注意事项
1. The `config.typ` file should be treated as a top-level file and imported by other files. Avoid cross-importing.   在使用时，`config.typ` 应作为顶层文件被其他文件导入，避免交叉导入。

# Custom Templates  自定义模板
1. 

# Component Documentation   组件说明 (见doc中的文档)

# Additional Notes  其他说明

Code comments will be added when there’s time. 有空再写代码注释