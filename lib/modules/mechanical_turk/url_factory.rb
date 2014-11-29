module MechanicalTurk
  module URLFactory

    WORKER_SUBMISSION_URL_PREFIX =
      "https://mturk.com/mturk/externalSubmit"

    def construct_task_submission_url assignment_id, worker_id, hit_id, **params
      query_params = {assignmentId: assignment_id, workerId: worker_id,
        hit_id: hit_id}.merge params
      return "#{WORKER_SUBMISSION_URL_PREFIX}?#{query_params.to_query}"
    end
  end
end
