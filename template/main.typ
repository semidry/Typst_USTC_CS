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

== 论文阅读

_Efficient Memory Management for Large Language Model Serving with PagedAttention_

大型语言模型的高吞吐量服务需要一次批处理足够多的请求。然而每个请求的键值缓存（KV 缓存）内存都很大，并且会动态增长和收缩，则碎片和冗余重复可能会_严重浪费内存_，从而_限制批处理大小_。

现有的LLM服务系统未能有效管理KV缓存内存。这主要是因为将请求的 KV 缓存_存储在连续的内存空间中_。

KV 缓存随着模型生成新标记，它会随着时间的推移动态增长和收缩，并且其生存期和长度是先验未知的。不可避免地会导致_内部碎片_（预分配了具有请求最大长度的连续内存块）和_外部碎片_（每个请求的预分配大小可能不同）。

LLM服务为每个请求生成多个输出，请求由多个序列组成，这些序列可以部分共享其 KV 缓存。由于现有系统的序列的 KV 缓存_存储在单独的连续空间中因此无法共享内存_。

== PagedAttention机制

PagedAttention：受操作系统中经典_虚拟内存和分页技术_启发的注意力算法。
- 将请求的 KV 缓存划分为多个块，每个块可以包含固定数量令牌的注意力键和值。
- KV 缓存的块不一定存储在连续空间中。

PagedAttention的抽象：
- Block->Page; 
- Token->Byte; 
- Request->Process.

== LLM Service中的内存挑战

- KV 缓存大小随着请求数量的增加而快速增长，即使将所有可用内存都分配给 KV 缓存，也只能容纳几十个请求。GPU 的计算速度增长速度快于内存容量的增长速度，内存将成为一个越来越重要的瓶颈。
- 复杂的解码算法。KV 缓存共享的程度取决于所采用的特定解码算法。
- LLM服务的请求在其输入和输出长度上表现出可变性要求内存管理系统适应各种提示长度。

现有系统中的内存管理：
- 要求张量存储在连续内存中
- 根据请求的最大可能序列长度为请求静态分配内存块，而不考虑请求的实际输入或最终输出长度

== vLLM的解决方案

#slide[
  PagedAttention 算法允许将 KV 块存储在非连续物理内存中，从而在 vLLM 中实现更灵活的分页内存管理。vLLM 可以动态增长 KV 缓存内存，而无需提前为所有位置保留它，从而消除了现有系统中的大部分内存浪费。\
][
  #figure(
  image("../img/vLLM system overview.png",width: 100%), caption: [vLLM 采用集中式调度器来协调分布式 GPU Worker 的执行]
  )
]

== 其他解码场景的应用

#slide[
  在Parallel sampling中，一个请求生成多个序列，通过其 PagedAttention 和分页内存管理，vLLM 可以轻松实现这种共享并节省内存。

  #figure(
  image("../img/Parallel sampling example.png",width: 100%), caption: [Parallel sampling example.]
  
  )
][
  在Beam search中，不仅共享初始提示块，还共享不同候选者之间的其他块，并且共享模式随着解码过程的推进而动态变化。通过 vLLM 的物理块共享而不用频繁地复制KV缓存可以显著降低内存拷贝开销。
  
  #figure(
  image("../img/Beam search example.png",width: 100%), caption: [Beam search example.]
  )
]


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
      task("查阅文档，了解框架", (0, 2), style: (stroke: 2pt + gray))
      task("检索文档，关注其数据管理功能", (0, 0), style: (stroke: 2pt + gray))
    })

    taskgroup(title: [*了解终端大模型*], {
      task("查阅PowerInfer-2相关资料", (0, 0), style: (stroke: 2pt + gray))
    })

    taskgroup(title: [*学习vLLm论文*], {
      task("阅读并做摘录", (2, 5), style: (stroke: 2pt + gray))
    })

    taskgroup(title: [*学习Typst*], {
      task("查阅文档资料", (0, 3), style: (stroke: 2pt + gray))
      task("制作模板", (3, 6), style: (stroke: 2pt + gray))
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