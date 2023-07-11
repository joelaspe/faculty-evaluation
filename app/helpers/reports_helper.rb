module ReportsHelper
    def setup_report(report)
        report.courses ||= Course.new
        report
    end
end
