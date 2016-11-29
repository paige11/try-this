function Question(id, user_id, content, created_at, user) {
  this.id = id;
  this.user_id = user_id;
  this.content = content;
  this.created_at = created_at;
  this.username = user.username;
  this.format_date = () => {
    return created_at.split("T")[0];
  }
  this.format_time = () => {
    var time_string = created_at.split("T")[1];
    return time_string.match(/(\d{2}):(\d{2}):(\d{2})/)[0];
  }
  this.questionLink = () => {
    return `<a href=/questions/${id}>${content}</a>`;
  }
  this.userLink = () => {
    return ` <a href=/users/${user_id}>${this.username}</a>`;
  }
  this.format = () => {
    return "<p>" + this.questionLink() + " Submitted by " + this.userLink() + ", " + this.format_date() + ", " + this.format_time() + "</p>";
  }
}

function mostRecent() {
  $('#most-recent').empty();
  $.get('/questions/most_recent', response => {
    $('#most-recent').append("<h2>Here are the most recent questions from users:</h2>");
    response.forEach(question => {
      var q = new Question(question.id, question.user_id, question.content, question.created_at, question.user);
      $('#most-recent').append(q.format());
    });
  }).done(data => {$('#submit-question').removeAttr('disabled')});
}

function clearForm() {

}

function mostPopular() {
  $.get('/questions/most_popular', response => {
    response.forEach(question => {
      var q = new Question(question.id, question.user_id, question.content, question.created_at, question.user);
      $('#most-popular').append(q.format());
    });
  });
}

function askQuestion(e) {
  e.preventDefault();
  var formData = $(this).serialize();
  $.post('/questions', formData).done(response => {
    mostRecent();
  })
}

function questionListener() {
  $('form').on('submit', askQuestion);
}

$(document).ready(function() {
  questionListener();
  mostRecent();
  mostPopular();
});
