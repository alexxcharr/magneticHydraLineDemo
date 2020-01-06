//:create data and send to local addr
var addr = NetAddr.localAddr;

Pwhite(0.4, 0.6, inf).stream(\test,
	{ | val, player |
		addr.sendMsg('/minibee/data', 1, val);
		//	postf("the value for freq was: %\n", val);
	}  , //[1.5, 0.2.pn(6), 0.1.pn(8)].prand;
	0.5
);

//:

Mapper.setSpec(\sensor1, \x, { |val|
	val.sin.linlin(-1, 1, 1, 10);
	10.wait;
	val.sin.linlin(-1, 1, 1, 100);
});
//:

Mapper.setSpec(\sensor1, \x, { |val| val.sin.linlin(-1, 1, 1, 10)});
Mapper.setSpec(\sensor1, \y, { |val| val.sin.linlin(-1, 1, 1, 100)});
Mapper.setSpec(\sensor1, \z, { |val| val.sin.linlin(-1, 1, 1, 100)});
//:
var addr = NetAddr.new("127.0.0.1", 51000);
OSCFunc({ |msg|
	var x, y, z;
	#x, y, z = msg[2..]; //

	addr.sendMsg(HM.m.postln,
		Mapper.map(x, \sensor1, \x).postln,
	);

}, '/minibee/data', argTemplate: [1]);
//:+
3.wait;
"setting message for hydra to scene2".postln;
HM.m = '/scene2';
5.wait;
"setting message for hydra to scene3".postln;
HM.m = '/scene3';
//:*
NetAddr.localAddr.sendMsg('/minibee/data', 1, 10, 20, 30);
0.25.wait;
