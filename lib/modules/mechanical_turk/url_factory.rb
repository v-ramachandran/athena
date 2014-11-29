module MechanicalTurk
  module URLFactory

    WORKER_SANDBOX_SUBMISSION_URL_PREFIX =
      "https://workersandbox.mturk.com/mturk/externalSubmit"
    WORKER_SUBMISSION_URL_PREFIX =
      "https://mturk.com/mturk/externalSubmit"

    def construct_task_submission_url assignment_id, worker_id, hit_id, is_sandbox=true, **params
      url_prefix = is_sandbox ? WORKER_SANDBOX_SUBMISSION_URL_PREFIX : WORKER_SUBMISSION_URL_PREFIX
      query_params = {assignmentId: assignment_id, workerId: worker_id,
        hit_id: hit_id}.merge params
      return "#{url_prefix}?#{query_params.to_query}"
    end
  end
end
