var socket = io.connect('http://localhost:1337');

var form = document.querySelector('form'),
    pre = document.querySelector('pre'),
    logMessage = function(message, inbound){
      var m = document.createElement('code');
      m.appendChild(document.createTextNode((inbound ? "< " : "> ") + message ))
      pre.appendChild(m);
    }

form.addEventListener('submit', function(e){
  e.preventDefault();
  socket.emit('message', {content:form.content.value,time:(new Date).getTime()});
  logMessage(form.content.value, false);
  form.content.value = "";
})

socket.on('connect', function(){
  logMessage('# connected');
})
socket.on('user connected', function(){
  logMessage('# User connected', true);
});
  
socket.on('user disconnected', function(){
  logMessage('# User disconnected', true);
})
  
socket.on('message', function(message){
  logMessage(message.content, true);
});
  
socket.on('disconnect', function(){
  logMessage('# Disconnected from server');
});


