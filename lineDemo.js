msg.setPort(51000)

n = 1
o = 1
t = 0.8


shape(2, 0.0001)
//.repeat(4)
.modulate(noise(() => n , 0.01))
.modulateScrollY(osc(() => o, 0.01))
.rotate(-0.01)
//.colorama(11)
//.invert()
.thresh(() => t, 0.9)
.diff(o0)
//.add(shape(8).invert().scale(2).thresh(0.5, 1))
.out(o0)


msg.on('/scene1', (args) => {
  o = args[0]
  n = args[0]
})
msg.on('/scene2' , (args) => {
  t = args[0]/10
})
msg.on('/scene3' , (args) => {
  o = args[0]
  n = args[0]
  shape(2, 0.0001)
  //.repeat(4)
  .modulate(noise(() => n , 0.01))
  .modulateScrollY(osc(() => o, 0.01))
  .rotate(-0.01)
  //.colorama(11)
  //.invert()
  //.thresh(() => t, 0.9)
  .diff(o0)
  .add(shape(8).invert().scale(2).thresh(() => t, 1))
  .out(o0)
})
