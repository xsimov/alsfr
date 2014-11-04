// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var position = 0;

function dragIt(event) {
  event.dataTransfer.setData("Text", event.target.id);
}

function dropIt(event) {
  var theData = event.dataTransfer.getData("Text");
  var theDraggedElement = document.getElementById(theData);
  if (event.target.nodeName === "DIV") {
    event.target.appendChild(theDraggedElement);
  } else {
    event.target.parentNode.appendChild(theDraggedElement);
  }
  event.preventDefault();
  if (event.target.id === "to") {
    setPlayerIdHiddenField(theDraggedElement.id);
  } else if (event.target.id === "from") {
    destroyPlayerIdHiddenField(theDraggedElement.id)
  };
}

function setPlayerIdHiddenField(playerId) {
  var form = document.getElementById('new_match');
  var newField = document.createElement('input');
  newField.type = "hidden";
  newField.name = "match[players][" + position + "][player_id]";
  position++;
  newField.value = playerId;
  newField.className = 'hid' + playerId;
  if (!checkIfItIsAlreadyThere(newField, form)) {
    form.appendChild(newField);
  }
}

function destroyPlayerIdHiddenField(playerId) {
  var form = document.getElementById('new_match');
  var doomedElement = document.getElementsByClassName('hid' + playerId)[0];
  form.removeChild(doomedElement);
}

function checkIfItIsAlreadyThere(element, parentOfElement) {
  var possibleCopies = document.getElementsByClassName(element.className);
  var finalDecision = false;
  for (var i in possibleCopies) {
    if (possibleCopies[i].parentNode === parentOfElement) {
      finalDecision = true;
    }
  }
  return finalDecision;
}