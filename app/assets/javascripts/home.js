class Question {
  constructor(id, user_id, content, created_at, user) {
    this.id = id;
    this.user_id = user_id;
    this.content = content;
    this.created_at = created_at;
    this.username = user.username;
  }

  formatDate() {
    return this.created_at.split("T")[0];
  }

  formatTime() {
    var time_string = this.created_at.split("T")[1];
    return time_string.match(/(\d{2}):(\d{2}):(\d{2})/)[0];
  }

  questionLink() {
    return `<a href=/questions/${this.id}>${this.content}</a>`;
  }

  userLink() {
    return ` <a href=/users/${this.user_id}>${this.username}</a>`;
  }

  format() {
    return "<h4><details id='q" + this.id + "'><summary>" + this.questionLink() + "<div class='submitted-by'>Submitted by " + this.userLink() + ", " + this.formatDate() + ", " + this.formatTime() + "</div></h4></summary></details>";
  }
}

class Solution {
  constructor(id, question_id, content, votes, contributor) {
    this.id = id;
    this.question_id = question_id;
    this.content = content;
    this.votes = votes;
    this.contributor = contributor;
  }

  format() {
    return `<p class="round-box"><a href='/users/${this.contributor.id}'>${this.contributor.username}</a> says: ${this.content}</p>`
  }
}

function mostRecent() {
  $('#most-recent').empty();
  $.get('/questions/most_recent', response => {
    $('#most-recent').append("<h2>Here are the most recent questions from users:</h2>");
    response.forEach(question => {
      var q = new Question(question.id, question.user_id, question.content, question.created_at, question.user);
      $('#most-recent').append(q.format());
      question.solutions.forEach(solution => {
        var s = new Solution(solution.id, solution.question_id, solution.content, solution.votes, solution.contributor);
        $(`#most-recent #q${q.id}`).append(s.format());
      })
    });
  }).done(data => {$('#submit-question').removeAttr('disabled')});
}

function clearForm() {
  $('form')[0].reset();
}

function mostPopular() {
  $('#most-popular').empty();
  $.get('/questions/most_popular', response => {
    $('#most-popular').append("<h2>Here are the most popular questions (by number of votes):</h2>");
    response.forEach(question => {
      var q = new Question(question.id, question.user_id, question.content, question.created_at, question.user);
      $('#most-popular').append(q.format());
      question.solutions.forEach(solution => {
        var s = new Solution(solution.id, solution.question_id, solution.content, solution.votes, solution.contributor);
        $(`#most-popular #q${q.id}`).append(s.format());  
      })
    });
  });
}

function askQuestion(e) {
  e.preventDefault();
  var formData = $(this).serialize();
  $.ajax({
    url: '/questions',
    dataType: 'json',
    type: 'post',
    data: formData,
    success: mostRecent,
    error: xhr => displayErrors(xhr)
  })
  clearForm();
}

function displayErrors(xhr) {
  var errors = $.parseJSON(xhr.responseText).errors;
  $('.new_question').prepend("<h4 class='error'>" + errors + "</h4>");
  $('#submit-question').removeAttr('disabled');
}

function questionListener() {
  $('.new_question').on('submit', askQuestion);
}

$(document).on('turbolinks:load', function() {
  questionListener();
  mostRecent();
  mostPopular();
});
