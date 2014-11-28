var Time = Time || {}
Time.FormTimeManager = function(form_selector) {

  var TARGET = $(form_selector);
  var START_TIME = (new Date).getTime();
  var ELAPSED_TIME_FIELD = TARGET.find(".completion-time-field");
  var SUBMISSION_TIME_FIELD = TARGET.find(".entry-time-field");
  var SUBMIT_BUTTON = TARGET.find(".submit-button");

  var update_elapsed_time_presubmission = function() {
    TARGET.on("submit", function(event) {
      var current_time = (new Date).getTime();
      ELAPSED_TIME_FIELD.val(current_time - START_TIME);
      SUBMISSION_TIME_FIELD.val(current_time);
    });
  };

  return {
    update_elapsed_time_presubmission : update_elapsed_time_presubmission
  };
};
