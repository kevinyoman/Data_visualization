shinyServer(function(input, output) {
  output$plot_1 <- renderPlotly({
    # Prosesing data untuk plot 1
    vids_count <- 
      vids_clean %>% 
      group_by(category_id) %>% 
      summarise(freq = n()) %>% 
      arrange(-freq) %>% 
      mutate(label = glue("Category: {category_id}
                      Freq: {freq}"))
    
    # Pembuatan visual statis
    plot1 <- 
      ggplot(data = vids_count, mapping = aes(x = freq, 
                                              y = reorder(category_id, freq),
                                              text = label)) +
      geom_col(mapping = aes(fill = freq)) +
      scale_fill_gradient(low = "red", high = "black") +
      labs(title = 'Trending Categories on Youtube US 2017' ,
           x = 'Video Count',
           y = NULL) +
      theme_minimal() +
      theme(legend.position = "none") 
    
    # Visual interaktif kita
    
    ggplotly(plot1, tooltip = "text")
  })
  
  # menu 2---
  ## output untuk plot pada bagian menu 2
  output$plot_2 <- renderPlotly({
    vids_top_channel <- 
      vids_clean %>% 
      filter(category_id %in% input$sel_category) %>% 
      group_by(channel_title) %>% 
      summarise(mean_views = mean(views)) %>% 
      arrange(-mean_views) %>% 
      head(10) %>% 
      mutate(label = glue("Channel Title: {channel_title}
                      Mean Views: {scales::comma(mean_views)}"))
    
    # Pembuatan visual
    plot2 <- 
      ggplot(data = vids_top_channel, mapping = aes(x = mean_views, 
                                                    y = channel_title,
                                                    color = mean_views,
                                                    text = label)) +
      geom_segment(mapping = aes(x = 0, xend = mean_views, 
                                 y = reorder(channel_title, mean_views), yend = channel_title)) +
      geom_point() +
      scale_color_gradient(low = "red", high = "black") +
      scale_x_continuous(labels = label_number(big.mark = ".")) +
      labs(x = 'Mean Views',
           y = NULL,
           title = paste('Top 10 YouTube Channels in ',input$sel_category)
      ) +
      theme_minimal() +
      theme(legend.position = "none") +
      theme(text = element_text(size = 6, face="bold"))
    
    # Pembuatan visual interaktif
    ggplotly(p = plot2, tooltip = "text")
  })
  
  # menu 2---
  ## output untuk plot pada bagian kanan menu 2
  output$plot_3 <- renderPlotly({
    # Persiapan data
    vids_trend <- 
      vids_clean %>% 
      filter(category_id %in% input$sel_category) %>% 
      group_by(publish_hour) %>% 
      summarise(mean_views = mean(views)) %>% 
      mutate(label = glue("Hour: {publish_hour}
                      Views: {scales::comma(mean_views, accuracy = 0.01)}"))
    
    # Visual Statis
    plot3 <- 
      ggplot(data = vids_trend, mapping = aes(x = as.factor(publish_hour), 
                                              y = mean_views, 
                                              text = label))+
      geom_line(group = 1, color = "red") +
      geom_point() +
      scale_y_continuous(labels = scales::comma) +
      labs(title = paste("Viewers Activity for",input$sel_category,"Videos"),
           x = "Publish Hour",
           y = "Average Views") +
      theme_minimal()+
      theme(text = element_text(size = 6, face="bold"))
    
    # Visual interaktif
    ggplotly(p = plot3, tooltip = "text")
  })
  
  # menu 3
  output$table <- renderDataTable({
    
    datatable(vids_clean,
              options = list(scrollY = TRUE))
    
  })
  
})
