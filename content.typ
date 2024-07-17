#import "config.typ": *

#outline-slide()

= 日程记录

== 本周日程安排

#timeliney.timeline(
  show-grid: true,
  {
    import timeliney: *
      
    headerline(group(([*July*], 7)))
    headerline(
      group(..range(7).map(n => strong(str(n + 12)))),
      // group(..range(4).map(n => strong("Q" + str(n + 1)))),
    )
  
    taskgroup(title: [*试用DevEco Studio*], {
      task("了解OH Next应用程序的开发架构", (4, 7), style: (stroke: 2pt + gray))
      // task("检索文档，关注其数据管理功能", (5, 7), style: (stroke: 2pt + gray))
    })

    taskgroup(title: [*学习Typst*], {
      task("完善模板并添加小组件与说明文档", (0, 6), (4,5), style: (stroke: 2pt + gray))
    })

    taskgroup(title: [*个人能力提升*], {
      task("学习Sringboot开发", (1, 3), style: (stroke: 2pt + gray))
      task("Leetcode刷题", (6, 7), style: (stroke: 2pt + gray))
    })
  }
)

= 尝试DevEco Studio应用开发

#slide[
  #align(center,{
    figure(
      image("img/deveco.jpg",width: 110%),
      caption:[
        DevEco Studio界面及OH Next模拟器
      ]

    )
  })
]

我发现其声明式的语言风格和Google最新推荐的标准Jetpack Compose十分类似，是视图和控制逻辑结合的开发模式，其页面重组，数据传递和状态迁移相较传统的view模式有显著的提升，特别是其页面重组可以由状态树来最小化重组规模从而减小开销。刚好我的Android应用Wordle也是采用声明式的Jetpack Compose开发，所以我发现其开发模式很容易上手。阅读示例项目基本不需要查阅文档。

不过DevEco Studio与Android Studio不同，使用模拟器竟然需要申请资格，资格审核用了几天时间。

虽然课题研究内容不在应用层面上，但我希望能从应用层了解应用是如何与操作系统打交道的，毕竟Open Harmony系统设计吸取了过去操作系统的经验和教训也采用了新的设计理念，例如微内核架构，分布式架构等，其应用使用的接口和我过去开发的Android应用我所不了解的区别，了解了应用层如何开发设计才能更好的在操作系统层面做出有利于应用使用的改进。

= 继续完善Typst模板

#slide[
  #align(center,{
    figure(
      image("img/typst.jpg",width: 110%),
      caption:[
        Typst模板
      ]

    )
  })
]

从PPT到beamer，有许多科大的模板可供使用，PPT制作起来较为耗费心神，而beamer由于其LaTeX的特性，可以更加专注于内容的编写，而不用过多的关注样式，但Latex语言的语法和计算机学科接触的开发语言差别较大，而且其第三方包语法各不相同，有很高的入门门槛，同时其编译时间较长，#BlueText[不适合实时更新]。且beamer本身已经是很久之前的项目了（至少官网的教程已经十多年了），语言风格，性能，风格，功能均越来越显得与时代脱节，使用了一阵子的beamer模板后了解到基于Rust语言开发的Typst（做毕业设计学习了一段时间Rust），于是我决定转向Typst书写汇报幻灯片。鉴于当前Typst生态相较于Latex还显得十分不完善，也没有科大师生适用的模板，所以我基于北航模板（其借鉴了东南的项目）的框架，以科大的beamer模板的样式设计为参考，设计了一套科大的Typst模板，并添加了大量组件可供复用，当前还在完善中，希望将来可以成为Typst开源社区的项目之一，在官网上直接就能找到。