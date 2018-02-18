const prestoDayum = require("presto-ui").doms;
const parseParams = require("presto-ui").helpers.web.parseParams;


function domAll(elem) {
  for (var i = 0; i < elem.children.length; i++) {
    elem.children[i] = domAll(elem.children[i]);
  }
  return prestoDayum(elem.type, elem.props, elem.children);
}

function applyProp(element, attribute) {
  var prop = {
    id: element.props.id
  }
  prop[attribute.value0] = attribute.value1.value0;
  Android.runInUI(parseParams("linearLayout", prop, "set"));
}

window.removeChild = removeChild;
window.addChild = addChild;
window.addAttribute = addAttribute;
window.removeAttribute = removeAttribute;
window.updateAttribute = updateAttribute;
window.addAttribute = addAttribute;
window.insertDom = insertDom;

function removeChild (child, parent, index) {
  console.log("removeChild");
  Android.removeView(child.props.id);
  console.log(child, parent, index);
}

function addChild (child, parent, index) {
  console.log("addChild");
  Android.addViewToParent(parent.props.id, domAll(child), index);
  console.log(child, parent, index);
}

window.__screenSubs = {};

function addAttribute (element, attribute) {
  console.log("addAttribute");
  applyProp(element, attribute);
}

function removeAttribute (element, attribute) {
  console.log("removeAttribute");
  console.log(element, attribute);
}

function updateAttribute (element, attribute) {
  console.log("updateAttribute");
  applyProp(element, attribute);
}

exports.click = function() {}
exports.change = function() {}

function insertDom(root) {
  return function(dom) {
    return function() {
      root.props.height = "match_parent";
      root.props.width = "match_parent";
      root.props.id = "GodFather";
      root.type = "relativeLayout";

      root.children.push(dom);
      dom.parentNode = root;
      window.N = root;

      Android.Render(domAll(root));
    }
  }
}
