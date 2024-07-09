#import "@preview/touying:0.4.2": *
// #import "@preview/touying-buaa:0.1.0" as buaa-theme
#import "../lib.typ" as buaa-theme
#import "@preview/timeliney:0.0.1"


// #set text(
//   lang: "zh",
//   font: "PingFang SC",
// )
// 
#let ustcblue = rgb("034ea1")

#show emph: it => {
  text(ustcblue, it.body)
}

#let s = buaa-theme.register()

// Global information configuration
#let s = (s.methods.info)(
  self: s,
  title: [关于课题研究内容的了解学习],
  subtitle: [组会日程内容汇报],
  author: [董若扬],
  date: datetime.today(),
  institution: [计算机科学与技术学院, USTC],
  // logo: image("../assets/vi/ustc-cs.svg", width: 20%)
  // logo: image("../assets/vi/ustc_logo_side.svg", width: 20%)
  logo: image("../assets/vi/绘图1.svg", width: 50%)
)

// Extract methods
/**
 * This code initializes the `init` and `slides` variables using the `utils.methods` function.
 * It then displays the value of `init` using the `#show` directive.
 */
#let (init, slides) = utils.methods(s)
#show: init

// Extract slide functions
/**
 * This code defines a set of slides using the `utils.slides` function.
 * It then displays the slides using the `slides.with()` method.
 */

#let (slide, empty-slide, title-slide, outline-slide, new-section-slide, ending-slide) = utils.slides(s)
#show: slides.with()



/**
 * This function represents an outline slide.
 * It is used to define the structure and content of an outline slide.
 */
#outline-slide()

= OpenHarmony系统

== OpenHarmony框架

#figure(
  image("../img/OpenHarmony框架.png",width: 70%)
)
我认为学习的重点是_系统服务层_的(分布式)_数据管理_与_系统基本能力子系统集_中的_AI子系统_。其中研究的重点应该是在分布式数据管理上做改进使其能充分利用AI子系统的能力。

== OpenHarmony分布式数据管理

分布式数据管理

= 终端大模型



= vLLM

= 日程安排

== 日程安排


#timeliney.timeline(
  show-grid: true,
  {
    import timeliney: *
      
    headerline(group(([*July*], 7)))
    headerline(
      group(..range(7).map(n => strong(str(n + 5)))),
      // group(..range(4).map(n => strong("Q" + str(n + 1)))),
    )
  
    taskgroup(title: [*了解OpenHarmony*], {
      task("Research the market", (0, 2),(3,4), style: (stroke: 2pt + gray))
      task("Conduct user surveys", (1, 3), style: (stroke: 2pt + gray))
    })

    taskgroup(title: [*了解终端大模型*], {
      task("Create mock-ups", (2, 3), style: (stroke: 2pt + gray))
      task("Develop application", (3, 5), style: (stroke: 2pt + gray))
      task("QA", (3.5, 6), style: (stroke: 2pt + gray))
    })

    taskgroup(title: [*学习vLLm论文*], {
      task("Press demos", (3.5, 7), style: (stroke: 2pt + gray))
      task("Social media advertising", (6, 7.5), style: (stroke: 2pt + gray))
    })

    taskgroup(title: [*学习Typst*], {
      task("Press demos", (3.5, 7), style: (stroke: 2pt + gray))
      task("Social media advertising", (6, 7.5), style: (stroke: 2pt + gray))
    })

    

    // milestone(
    //   at: 3.75,
    //   style: (stroke: (dash: "dashed")),
    //   align(center, [
    //     *Conference demo*\
    //     Dec 2023
    //   ])
    // )

    // milestone(
    //   at: 6.5,
    //   style: (stroke: (dash: "dashed")),
    //   align(center, [
    //     *App store launch*\
    //     Aug 2024
    //   ])
    // )
  }
)