
# Fungsi dashboardPage() diperuntuhkan untuk membuat ketiga bagian pada Shiny
dashboardPage(skin = "red",
              
              # Fungsi dashboardHeader() adalah bagian untuk membuat header
              dashboardHeader(title = "YouTube Analysis"),
              
              # Fungsi dashboardSidebar() adalah bagian untuk membuat sidebar
              dashboardSidebar(
                
                #sidebarMenu adalah fungsi untuk membuat bagian menu disamping
                sidebarMenu(
                  
                  #menutItem adalah fungsi untuk membuat kolom tab menu dibagian menu samping
                  menuItem(
                    text = "Menu 1", # text adalah parameter untuk memberikan Nama menu
                    tabName = "menu_1", # tabName adalah parameter memberikan identifikasi yang mewakliki bagian menu tersebut
                    icon = icon("video")), # icon adalah parameter untuk memberikan lambang pada menu tersebut
                  
                  menuItem(text = "Menu 2",
                           tabName = "menu_2",
                           icon = icon("youtube")),
                  
                  menuItem(text = "Menu 3",
                           tabName = "menu_3",
                           icon = icon("table"))
                )
              ),
              
              # Fungsi dashboardBody() adalah bagian untuk membuat isi body
              dashboardBody(
                
                # Fungsi tabItems() adalah fungsi untuk mengumupulkan semua isi dari body pada setiap menu
                tabItems(
                  # --------- HALAMAN PERTAMA: MENU 1
                  tabItem(
                    tabName = "menu_1", # tabeName adalah parameter untuk memberi tahu bagian Menu mana yang ingin kita isi atau masukan data
                    
                    # fluiRow() adalah sebuah fungsi untuk membuat layout dengan orientasi baris
                    fluidRow(
                      
                      # infoBox() adalah sebuah fungsi untuk membuat box yang berisikan informasi
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
                    
                    # --------- BAR PLOT 1
                    fluidRow(
                      
                      # box() adalah fungsi yang digunakan untuk membuat sebuah box yang dapat menambung sebuah plot
                      box(width = 12, # mengatur ukuran dari box
                          title = "Trending Categories on YouTube US 2017",
                          
                          # plotlyOutput() adalah fungsi untuk menampilkan plot yang sudah dibuat dibagian server
                          plotlyOutput(outputId = "plot_1")
                      )
                    )
                  ),
                  
                  # --------- HALAMAN KEDUA: CHANNELS
                  tabItem(
                    tabName = "menu_2",
                    
                    # --------- INPUT
                    fluidRow(
                      box(
                        width = 12,
                        
                        # selecInput() adalah fungsi untuk memilih salah satu category youtube
                        selectInput(inputId = "input_category", # input Id adalah Id atau dari fungsi selectInput
                                    label = "Choose Video Category", # label adalah parameter untuk memberikan nama dari selectInput
                                    choices = unique(vids_clean$category_id)) # choices adalah parameter untuk memberikan pilihan category apa saja yang bisa dipilih
                      )
                    ),
                    
                    # --------- PLOT
                    fluidRow(
                      
                      # Plot 2 (kiri)
                      box(
                        plotlyOutput(outputId = "plot_2")
                      ),
                      
                      # Plot 3 (kanan)
                      box(
                        plotlyOutput(outputId = "plot_3")
                      )
                    )
                  ),
                  
                  # --------- HALAMAN KETIGA: DATA
                  tabItem(
                    tabName = "menu_3",
                    
                    # dataTableOutput() adalah fungsi untuk menampilkan dataframe yang sudah kita persiapkan di server
                    DT::dataTableOutput(outputId = "table")
                  )
                  
                )
                
              )
)