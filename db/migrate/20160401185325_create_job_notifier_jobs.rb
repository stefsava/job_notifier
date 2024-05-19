class CreateJobNotifierJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :job_notifier_jobs do |t|
      t.string :identifier, index: true
      t.string :job_id, index: true
      t.string :status
      t.string :job_class
      t.text :result
      t.boolean :notified, default: false

      t.timestamps null: false
    end
  end
end
