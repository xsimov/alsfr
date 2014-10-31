// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var position = 0;

function dragIt(event) {
  event.dataTransfer.setData("Text", event.target.id);
}

function dropIt(event) {
  var theData = event.dataTransfer.getData("Text");
  var theDraggedElement = document.getElementById(theData);
  event.target.appendChild(theDraggedElement);
  event.preventDefault();
  if (event.target.id === "to") {
    setPlayerIdHiddenField(theDraggedElement.id);
  }
}

function setPlayerIdHiddenField(playerId) {
  var form = document.getElementById('new_match');
  var newField = document.createElement('input');
  newField.type = "hidden";
  newField.name = "match[players][" + position + "][player_id]";
  position++;
  newField.value = playerId;
  form.appendChild(newField);
}