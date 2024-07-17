// #import "@preview/touying:0.4.2": *

#import "theme.typ": *
#import "lib.typ": *
// #import "./theme.typ" as ustc-theme

#let s = register(aspect-ratio: "16-9")
#let s = (s.methods.numbering)(self: s, section: "1.", "1.1")

#let s = (s.methods.info)(
  self: s,
  title: [日程活动记录汇报],
  subtitle: [],
  author: [董若扬],
  date: datetime.today(),
  institution: [School of Computer Science and Technology, USTC],
  logo: image("./assets/img/USTC.svg", width: 50%),
  github: []
)

#let (init, slides) = utils.methods(s)

#let (slide, empty-slide, title-slide, outline-slide, new-section-slide, ending-slide, focus-slide,matrix-slide) = utils.slides(s)

//<>在这里添加第三方库的导入
//时间轴：https://typst.app/universe/package/timeliney
#import "@preview/timeliney:0.0.1"

//代码块：https://typst.app/universe/package/codly
#import "@preview/codly:0.2.0": *

//图表：https://typst.app/universe/package/fletcher
#import "@preview/fletcher:0.5.1" as fletcher: diagram, node, edge

//提示框：https://typst.app/universe/package/gentle-clues
#import "@preview/gentle-clues:0.9.0": *

//展示框：https://typst.app/universe/package/showybox
#import "@preview/showybox:2.0.1": showybox

//泡泡框：https://typst.app/universe/package/babble-bubbles
#import "@preview/babble-bubbles:0.1.0": *

//日历：https://typst.app/universe/package/cineca
#import "@preview/cineca:0.2.1": *

//</>

#let icon(codepoint) = {
  box(
    height: 0.8em,
    baseline: 0.05em,
    image(codepoint)
  )
  h(0.1em)
}


