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
})

// $("#sortable").sortable();
// $("#sortable").disableSelection();
//
// countTodos();
//
// // all done btn
// $("#checkAll").click(function(){
//     AllDone();
// });
//
// //create todo
// $('.add-todo').on('keypress',function (e) {
//       e.preventDefault
//       if (e.which == 13) {
//            if($(this).val() != ''){
//            var todo = $(this).val();
//             createTodo(todo);
//             countTodos();
//            }else{
//                // some validation
//            }
//       }
// });
// // mark task as done
// $('.todolist').on('change','#sortable li input[type="checkbox"]',function(){
//     if($(this).prop('checked')){
//         var doneItem = $(this).parent().parent().find('label').text();
//         $(this).parent().parent().parent().addClass('remove');
//         done(doneItem);
//         countTodos();
//     }
// });
//
// //delete done task from "already done"
// $('.todolist').on('click','.remove-item',function(){
//     removeItem(this);
// });
//
// // count tasks
// function countTodos(){
//     var count = $("#sortable li").length;
//     $('.count-todos').html(count);
// }
//
// //create task
// function createTodo(text){
//     var markup = '<li class="ui-state-default"><div class="checkbox"><label><input type="checkbox" value="" />'+ text +'</label></div></li>';
//     $('#sortable').append(markup);
//     $('.add-todo').val('');
// }
//
// //mark task as done
// function done(doneItem){
//     var done = doneItem;
//     var markup = '<li>'+ done +'<button class="btn btn-default btn-xs pull-right  remove-item"><span class="glyphicon glyphicon-remove"></span></button></li>';
//     $('#done-items').append(markup);
//     $('.remove').remove();
// }
//
// //mark all tasks as done
// function AllDone(){
//     var myArray = [];
//
//     $('#sortable li').each( function() {
//          myArray.push($(this).text());
//     });
//
//     // add to done
//     for (i = 0; i < myArray.length; i++) {
//         $('#done-items').append('<li>' + myArray[i] + '<button class="btn btn-default btn-xs pull-right  remove-item"><span class="glyphicon glyphicon-remove"></span></button></li>');
//     }
//
//     // myArray
//     $('#sortable li').remove();
//     countTodos();
// }
//
// //remove done task from list
// function removeItem(element){
//     $(element).parent().remove();
// }
