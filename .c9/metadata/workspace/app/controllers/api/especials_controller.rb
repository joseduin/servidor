{"filter":false,"title":"especials_controller.rb","tooltip":"/app/controllers/api/especials_controller.rb","undoManager":{"mark":46,"position":46,"stack":[[{"start":{"row":0,"column":0},"end":{"row":1,"column":0},"action":"insert","lines":["class Api::ImagenesController < ApplicationController",""],"id":1}],[{"start":{"row":1,"column":0},"end":{"row":2,"column":0},"action":"insert","lines":["",""],"id":2}],[{"start":{"row":2,"column":0},"end":{"row":2,"column":1},"action":"insert","lines":["e"],"id":3}],[{"start":{"row":2,"column":1},"end":{"row":2,"column":2},"action":"insert","lines":["n"],"id":4}],[{"start":{"row":2,"column":2},"end":{"row":2,"column":3},"action":"insert","lines":["d"],"id":5}],[{"start":{"row":0,"column":6},"end":{"row":0,"column":18},"action":"remove","lines":["Api::Imagene"],"id":6},{"start":{"row":0,"column":6},"end":{"row":0,"column":7},"action":"insert","lines":["E"]}],[{"start":{"row":0,"column":7},"end":{"row":0,"column":8},"action":"insert","lines":["s"],"id":7}],[{"start":{"row":0,"column":8},"end":{"row":0,"column":9},"action":"insert","lines":["p"],"id":8}],[{"start":{"row":0,"column":9},"end":{"row":0,"column":10},"action":"insert","lines":["e"],"id":9}],[{"start":{"row":0,"column":10},"end":{"row":0,"column":11},"action":"insert","lines":["c"],"id":10}],[{"start":{"row":0,"column":11},"end":{"row":0,"column":12},"action":"insert","lines":["i"],"id":11}],[{"start":{"row":0,"column":12},"end":{"row":0,"column":13},"action":"insert","lines":["a"],"id":12}],[{"start":{"row":0,"column":13},"end":{"row":0,"column":14},"action":"insert","lines":["l"],"id":13}],[{"start":{"row":0,"column":49},"end":{"row":1,"column":0},"action":"insert","lines":["",""],"id":14},{"start":{"row":1,"column":0},"end":{"row":1,"column":4},"action":"insert","lines":["    "]}],[{"start":{"row":1,"column":4},"end":{"row":2,"column":0},"action":"insert","lines":["",""],"id":15},{"start":{"row":2,"column":0},"end":{"row":2,"column":4},"action":"insert","lines":["    "]}],[{"start":{"row":2,"column":4},"end":{"row":6,"column":5},"action":"insert","lines":["def last ","    @imagene = Imagene.find(:all, :order => \"id desc\", :limit => 1)","    render json: @imagene","    head :ok","  end"],"id":16}],[{"start":{"row":2,"column":8},"end":{"row":2,"column":9},"action":"insert","lines":["i"],"id":17}],[{"start":{"row":2,"column":9},"end":{"row":2,"column":10},"action":"insert","lines":["m"],"id":18}],[{"start":{"row":2,"column":10},"end":{"row":2,"column":11},"action":"insert","lines":["a"],"id":19}],[{"start":{"row":2,"column":11},"end":{"row":2,"column":12},"action":"insert","lines":["g"],"id":20}],[{"start":{"row":2,"column":12},"end":{"row":2,"column":13},"action":"insert","lines":["e"],"id":21}],[{"start":{"row":2,"column":13},"end":{"row":2,"column":14},"action":"insert","lines":["n"],"id":22}],[{"start":{"row":2,"column":14},"end":{"row":2,"column":15},"action":"insert","lines":["e"],"id":23}],[{"start":{"row":2,"column":14},"end":{"row":2,"column":15},"action":"remove","lines":["e"],"id":24}],[{"start":{"row":2,"column":13},"end":{"row":2,"column":14},"action":"remove","lines":["n"],"id":25}],[{"start":{"row":2,"column":13},"end":{"row":2,"column":14},"action":"insert","lines":["n"],"id":26}],[{"start":{"row":2,"column":14},"end":{"row":2,"column":15},"action":"insert","lines":["_"],"id":27}],[{"start":{"row":2,"column":0},"end":{"row":2,"column":4},"action":"remove","lines":["    "],"id":28}],[{"start":{"row":2,"column":0},"end":{"row":2,"column":4},"action":"insert","lines":["    "],"id":29}],[{"start":{"row":2,"column":0},"end":{"row":2,"column":4},"action":"remove","lines":["    "],"id":30}],[{"start":{"row":2,"column":0},"end":{"row":2,"column":1},"action":"insert","lines":[" "],"id":31}],[{"start":{"row":2,"column":1},"end":{"row":2,"column":2},"action":"insert","lines":[" "],"id":32}],[{"start":{"row":3,"column":22},"end":{"row":3,"column":67},"action":"remove","lines":[".find(:all, :order => \"id desc\", :limit => 1)"],"id":33},{"start":{"row":3,"column":22},"end":{"row":3,"column":23},"action":"insert","lines":["a"]}],[{"start":{"row":3,"column":23},"end":{"row":3,"column":24},"action":"insert","lines":["l"],"id":34}],[{"start":{"row":3,"column":24},"end":{"row":3,"column":25},"action":"insert","lines":["l"],"id":35}],[{"start":{"row":3,"column":24},"end":{"row":3,"column":25},"action":"remove","lines":["l"],"id":36}],[{"start":{"row":3,"column":23},"end":{"row":3,"column":24},"action":"remove","lines":["l"],"id":37}],[{"start":{"row":3,"column":22},"end":{"row":3,"column":23},"action":"remove","lines":["a"],"id":38}],[{"start":{"row":3,"column":22},"end":{"row":3,"column":23},"action":"insert","lines":["."],"id":39}],[{"start":{"row":3,"column":23},"end":{"row":3,"column":24},"action":"insert","lines":["a"],"id":40}],[{"start":{"row":3,"column":24},"end":{"row":3,"column":25},"action":"insert","lines":["l"],"id":41}],[{"start":{"row":3,"column":25},"end":{"row":3,"column":26},"action":"insert","lines":["l"],"id":42}],[{"start":{"row":0,"column":6},"end":{"row":0,"column":7},"action":"insert","lines":["A"],"id":43}],[{"start":{"row":0,"column":7},"end":{"row":0,"column":8},"action":"insert","lines":["p"],"id":44}],[{"start":{"row":0,"column":8},"end":{"row":0,"column":9},"action":"insert","lines":["i"],"id":45}],[{"start":{"row":0,"column":9},"end":{"row":0,"column":10},"action":"insert","lines":[":"],"id":46}],[{"start":{"row":0,"column":10},"end":{"row":0,"column":11},"action":"insert","lines":[":"],"id":47}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":4,"column":18},"end":{"row":4,"column":25},"isBackwards":true},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":{"row":7,"state":"start","mode":"ace/mode/ruby"}},"timestamp":1490324235899,"hash":"e65993c281fcf7ea154a1162d08795f481ac0f12"}