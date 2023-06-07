# Fungsi dashboardPage() diperuntuhkan untuk membuat ketiga bagian pada Shiny
dashboardPage(skin = 'yellow',
              
              # Fungsi dashboardHeader() adalah bagian untuk membuat header
              dashboardHeader(title=span(tagList(icon("youtube"),"Youtube Analysis interactive plot")),titleWidth = '600px'),
              # dashboardHeader(title = tags$img(src="youtube=logo.png", height='60',width='60', 'youtube')),
              
              # Fungsi dashboardSidebar() adalah bagian untuk membuat sidebar
              dashboardSidebar(
                sidebarMenu(
                  menuItem(
                    text='Main Page',
                    tabName='menu_1',
                    icon=icon('house')
                  ),
                  menuItem(
                    text='Plot Analysis',
                    tabName='menu_2',
                    icon=icon('chart-line')
                  ),
                  menuItem(
                    text='Database',
                    tabName='menu_3',
                    icon=icon('table')
                  )
                )
              ),
              
              # Fungsi dashboardBody() adalah bagian untuk membuat isi body
              dashboardBody(
                tabItems(
                  # --- menu_1
                  tabItem(
                    tabName = 'menu_1',
                    fluidRow(
                      infoBox(title = "TOTAL UNIQUE VIDEOS", 
                              value = length(unique(vids_clean$title)), # Untuk mengeluarkan value tertentu
                              icon = icon("video"), 
                              color = "red"),
                      infoBox(title = "TOTAL UNIQUE CHANNELS", 
                              value =length(unique(vids_clean$channel_title)), 
                              icon = icon("headset"), 
                              color = "black"),
                      
                      infoBox(title = "CATEGORIES", 
                              value = length(unique(vids_clean$category_id)), 
                              icon = icon("youtube"), 
                              color = "red")
                    ),
                    fluidRow(
                      box( width=12, plotlyOutput(outputId="plot_1") )  
                    )
                  ),
                  
                  # --- menu_2
                  tabItem(
                    tabName = 'menu_2',
                    fluidRow(
                      box(
                        width = 12,
                        selectInput(
                            inputId='sel_category',
                            label='Please select Category',
                            choices = unique(vids_clean$category_id))
                      )
                    ),
                    fluidRow(
                      box( width = 6, plotlyOutput(outputId="plot_2") ),
                      box( width = 6, plotlyOutput(outputId="plot_3") )
                    )
                  ),
                  
                  # --- menu_3
                  tabItem(
                    tabName = 'menu_3',  
                    dataTableOutput(outputId = "table") 
                  )
                )
              )
)