class ReportPdf < Prawn::Document
  def initialize(person,report,courses)
    super()
    @person = person
    @report = report
    @courses = courses
    header
    text_content
    #table_content
  end

  def header
    #This inserts an image in the pdf file and sets the size of the image
    #image "#{Rails.root}/app/assets/images/header.png", width: 530, height: 150
  end

  def text_content
    # The cursor for inserting content starts on the top left of the page. Here we move it down a little to create more space between the text and the image inserted above
    #x_position = cursor - 50
    y_position = cursor - 40

    # The bounding_box takes the x and y coordinates for positioning its content and some options to style it
    bounding_box([120, y_position], :width => 270, :height => 30) do
      text "Annual Faculty Activity Report", size: 13, style: :bold, :align => :center
      text "University of New Mexico", size: 12, :align => :center
    end
    bounding_box([0, cursor - 50], :width => 270, :height => 60) do
      text "<b><i><u>CALENDAR YEAR:</u></i></b>   #{@report.report_year}", :size => 12, :inline_format => true
      text "<b><i><u>FACULTY NAME:</u></i></b>   #{@person.first_name} #{@person.last_name}",:size => 12, :inline_format => true
      text "<b><i><u>RANK:</u></i></b>   #{@report.rank}",:size => 12, :inline_format => true
      text "<b><i><u>DEPARTMENT:</u></i></b>   #{@report.department}",:size => 12, :inline_format => true
    end

    if publication_rows.count > 1
      start_new_page if cursor < 50
      bounding_box([0, cursor - 20], :width => 270, :height => 160) do
        text "<b><i><u>SCHOLARSHIP</u></i></b>", :size => 12, :inline_format => true
        text "<i>PUBLICATIONS: </i>", :size => 12, :inline_format => true
        #text "<i>Classes Taught</i>", :size => 12, :inline_format => true

        table(publication_rows, :width => 500) do
          row(0).font_style = :bold
          self.header = true
          self.row_colors = ['DDDDDD', 'FFFFFF']
          self.column_widths = [45, 335, 60, 60]
        end
      end
    end

    if course_rows.count > 1
      start_new_page if cursor < 50
      bounding_box([0, cursor - 20], :width => 270, :height => 160) do
        text "<b><i><u>TEACHING</u></i></b>", :size => 12, :inline_format => true

        table(course_rows, :width => 440) do
          row(0).font_style = :bold
          self.header = true
          self.row_colors = ['DDDDDD', 'FFFFFF']
          self.column_widths = [45, 100, 180, 65, 50]
        end
      end
    end

    if pservice_rows.count > 1
      start_new_page if cursor < 50
      bounding_box([0, cursor - 20], :width => 270, :height => 160) do
        text "<b><i><u>PROFESSIONAL SERVICES</u></i></b>", :size => 12, :inline_format => true

        table(pservice_rows, :width => 415) do
          row(0).font_style = :bold
          self.header = true
          self.row_colors = ['DDDDDD', 'FFFFFF']
          self.column_widths = [45, 100, 270]
        end
      end
    end

    if uservice_rows.count > 1
      start_new_page if cursor < 50
      bounding_box([0, cursor - 20], :width => 270, :height => 160) do
        text "<b><i><u>UNIVERSITY SERVICES</u></i></b>", :size => 12, :inline_format => true

        table(uservice_rows, :width => 415) do
          row(0).font_style = :bold
          self.header = true
          self.row_colors = ['DDDDDD', 'FFFFFF']
          self.column_widths = [45, 100, 270]
        end
      end
    end

    if oservice_rows.count > 1
      start_new_page if cursor < 50
      bounding_box([0, cursor - 20], :width => 270, :height => 160) do
        text "<b><i><u>OUTREACH ACTIVITIES</u></i></b>", :size => 12, :inline_format => true
        table(oservice_rows, :width => 415) do
          row(0).font_style = :bold
          self.header = true
          self.row_colors = ['DDDDDD', 'FFFFFF']
          self.column_widths = [45, 100, 270]
        end
      end
   end


   if grant_rows.count > 1
    start_new_page if cursor < 50
    bounding_box([0, cursor - 20], :width => 270, :height => 160) do
      text "<b><i><u>RESEARCH SUPPORT</u></i></b>", :size => 12, :inline_format => true
      text "<i>GRANTS: </i>", :size => 12, :inline_format => true
      table(grant_rows, :width => 515) do
        row(0).font_style = :bold
        self.header = true
        self.row_colors = ['DDDDDD', 'FFFFFF']
        self.column_widths = [45, 150, 100, 80, 80, 60]
      end
    end
  end
end

  def publication_rows
    [['Sl. No','Title', 'Pages', 'Year']] +
    @report.publications.map.with_index(1) do |publication,index|
      [index, publication.title, publication.pages, publication.year_published]
    end
  end

  def course_rows
      [['Sl. No','Course Number', 'Course Title', 'Semester', 'Taught']] +
      @courses.map.with_index(1) do |course,index|
        [index, course.course_number, course.course_title, course.semester, course.taught ? 'yes' : 'no']
      end
  end

  def pservice_rows
    [['Sl. No','Activity', 'Description']] +
    @report.professional_services.map.with_index(1) do |professional_service,index|
      [index, professional_service.title, professional_service.description]
    end
  end

  def uservice_rows
    [['Sl. No','Position', 'Description']] +
    @report.university_services.map.with_index(1) do |university_service,index|
      [index, university_service.position, university_service.description]
    end
  end

  def oservice_rows
    [['Sl. No','Activity', 'Description']] +
    @report.outreach_activities.map.with_index(1) do |outreach_activity,index|
      [index, outreach_activity.name, outreach_activity.description]
    end
  end

  def grant_rows
    [['Sl. No','Title', 'Duration', 'Total Funding ($)', 'UNM Portion ($)', 'Status']] +
    @report.grants.map.with_index(1) do |grant,index|
      [index, grant.title, grant.duration, grant.total_funding.to_i, grant.unm_portion.to_i, grant.status ? 'Active' : 'Not Active' ]
    end
  end

end
