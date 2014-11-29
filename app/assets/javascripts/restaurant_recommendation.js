$(function() {
  var form_time_manager = Time.FormTimeManager(".time-tracked");
  form_time_manager.update_elapsed_time_presubmission();

  var mturk_property_manager = MTurk.TaskPropertyManager(".recommendation-form");
  mturk_property_manager.populate_task_properties();
  mturk_property_manager.validate_submission_eligibility();

  var negative_suggest_manager = NegativeSuggest.InputManager(3);
  negative_suggest_manager.refresh_blacklist_items();
  negative_suggest_manager.deny_blacklisted_items(".form-container");
});
