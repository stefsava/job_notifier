require_relative "./job_notifier/engine"
require "enumerize"
require "colorize"
require "silencer"

require 'zeitwerk'
loader = Zeitwerk::Loader.for_gem
loader.ignore("#{__dir__}/../app/models")
loader.push_dir("#{__dir__}/../app/models/job_notifier", namespace: JobNotifier)
loader.ignore("#{__dir__}/generators")
loader.setup

module JobNotifier
  extend self

  attr_writer :root_url, :silenced_log

  def root_url
    return "/" unless @root_url
    @root_url
  end

  def silenced_log
    return false unless @silenced_log
    @silenced_log
  end

  def setup
    yield self
    require "job_notifier"
  end
end
