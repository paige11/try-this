function nextCategory() {
  $(".js-next").on("click", function(e) {
    e.preventDefault();
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/categories/" + nextId + "/category_data", function(data) {
      $('.cat-q').empty();
      $('.categoryName')[0].textContent = data.name;
      data.questions.forEach(question => {
        var q = new Question(question.id, question.user_id, question.content, question.created_at, question.user)
        $('.cat-q').append(q.format())
      })
      $(".js-next").attr("data-id", data["id"]);
    })
  });
}

function currentQuestions() {
  currentId = parseInt($(".js-next").attr("data-id"));
  if (!isNaN(currentId)) {
    $.get("/categories/" + currentId + "/category_data", function(data) {
      $('.cat-q').empty();
      $('.categoryName')[0].textContent = data.name;
      data.questions.forEach(question => {
        var q = new Question(question.id, question.user_id, question.content, question.created_at, question.user)
        $('.cat-q').append(q.format())
      });
    });
  }
}

$(document).on('turbolinks:load', function() {
  nextCategory();
  currentQuestions();
});
