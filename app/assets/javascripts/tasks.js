// Ajax new task
$(document).on('ajax:success', '#new_task', function(event, xhr, status, error) {
  $("#task_error").html("");
  $("#new_task").get(0).reset();
}).on('ajax:error', '#new_task', function(event, xhr, status, error) {
  console.log("errooooo");
});


// Open input to edit task body
$(document).on('click', '.edit-item', function(event) {
  event.preventDefault();
  var task = $(this).closest(".checkbox").find(".body-space");

  if(task.hasClass("editable-task")){
    task.removeClass("editable-task")
  } else {
    $(".editable-task").removeClass("editable-task");
    task.addClass("editable-task")
  }
});

// submit update finished
$(document).on('click', 'form .finished-task', function(event) {
  $(this).closest('form').submit();
});

//ajax submit destroy task
$(document).on('ajax:success', '.remove-item', function(event, xhr, status, data) {
  $(this).closest('li').remove();
});
