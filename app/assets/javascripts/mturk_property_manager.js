var MTurk = MTurk || {}
MTurk.TaskPropertyManager = function(form_selector) {

  var TARGET = $(form_selector);
  var INELIGIBLE_ASSIGNMENT_NAME = "ASSIGNMENT_ID_NOT_AVAILABLE";
  var ASSIGNMENT_ID_NAME = "assignmentId";
  var WORKER_ID_NAME = "workerId";
  var HIT_ID_NAME = "hitId";

  /**
   * This method Gets URL Parameters (GUP).
   * Method provided in the MTurk Samples and reproduced here.
   **/
  var get_url_parameter_value = function(name)
  {
    var regexS = "[\\?&]"+name+"=([^&#]*)";
    var regex = new RegExp( regexS );
    var tmpURL = window.location.href;
    var results = regex.exec( tmpURL );
    if( results == null )
      return "";
    else
      return results[1];
  }

  var populate_task_properties = function() {
    var assignment_id = get_url_parameter_value(ASSIGNMENT_ID_NAME);
    var hit_id = get_url_parameter_value(HIT_ID_NAME);
    var worker_id = get_url_parameter_value(WORKER_ID_NAME);

    TARGET.find(".assignment-id-field").val(assignment_id);
    TARGET.find(".hit-id-field").val(hit_id);
    TARGET.find(".worker-id-field").val(worker_id);
  }

  var validate_submission_eligibility = function() {
    var assignment_id = get_url_parameter_value(ASSIGNMENT_ID_NAME);
    if (assignment_id == INELIGIBLE_ASSIGNMENT_NAME) {
      TARGET.find(".submit.button").prop('disabled', true);
    }
  }

  return {
    validate_submission_eligibility : validate_submission_eligibility,
    populate_task_properties : populate_task_properties
  }
};
