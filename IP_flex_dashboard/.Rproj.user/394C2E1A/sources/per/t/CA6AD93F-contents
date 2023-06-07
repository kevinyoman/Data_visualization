shinyServer(function(input,output){
  
  # menu 1---
  ## output untuk plot pada bagian menu 1  
  
  ## mempersiapkan sebuah output id untuk ditampilkan ke bagiaan UI 
  ## renderPlotly({}), digunakan untuk melakukan rendering visualisasi
  output$plot_1 <- renderPlotly({
    vids_count <- vids_clean %>% 
      group_by(category_id) %>% 
      summarise(count = n()) %>% 
      ungroup() %>% 
      arrange(desc(count))
    
    vids_count <- 
      vids_count %>% 
      mutate(label = glue("Category: {category_id}
                      Total Count: {count}"))
    
    plot1 <- 
      vids_count %>% 
      ggplot(mapping = aes(y = reorder(category_id, count),
                           x = count,
                           fill = count,
                           text = label)) + # tambahan parameter text
      geom_col() +
      scale_fill_gradient(low = "red",
                          high = "black") +
      labs(title = "Top YouTube Category by Count",
           x = "Total Count", 
           y = NULL) +
      theme_light() +
      theme(legend.position = "none",
            text = element_text(size = 6, face="bold"))  
    
    ggplotly(p = plot1, 
             tooltip = "text")
  })
  
  # menu 2---
  ## output untuk plot pada bagian menu 2
  
  output$plot_2 <- renderPlotly({
    
    vids_top_channel <- 
      vids_clean %>% 
      filter(category_id %in% input$input_category) %>% 
      group_by(channel_title) %>% 
      summarise(mean_views = mean(views)) %>% 
      arrange(-mean_views) %>% 
      head(10) %>% 
      mutate(label = glue("Channel Title: {channel_title}
                           Mean Views: {scales::comma(mean_views)}"))
    
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
           title = paste('Top 10 YouTube Channels', input$input_category)) +
      theme_minimal() +
      theme(legend.position = "none") +
      theme(text = element_text(size = 6, face="bold"))
    
    ggplotly(p = plot2, tooltip = "text")
    
  }
  )
  
  # menu 3---
  ## output untuk plot pada bagian menu 3
  
  output$plot_3 <- renderPlotly({
    
    vids_trend <- 
      vids_clean %>% 
      filter(category_id %in% input$input_category) %>% 
      group_by(publish_hour) %>% 
      summarise(mean_views = mean(views)) %>% 
      mutate(label = glue("Hour: {publish_hour}
                      Views: {scales::comma(mean_views, accuracy = 0.01)}"))
    
    plot3 <- 
      ggplot(data = vids_trend, mapping = aes(x = as.factor(publish_hour), 
                                              y = mean_views, 
                                              text = label))+
      geom_line(group = 1, color = "red") +
      geom_point() +
      scale_y_continuous(labels = scales::comma) +
      labs(title = paste("Viewers Activity for", input$input_category, "Video"),
           x = "Publish Hour",
           y = "Average Views") +
      theme_minimal() +
      theme(text = element_text(size = 6, face="bold"))
    
    ggplotly(plot3, tooltip = "label")
    
  }
  )
  
  ## renderDataTable({}), digunakan untuk melakukan rendering dataframe
  output$table <- renderDataTable({
    
    datatable(vids_clean,
              options = list(scrollX = TRUE))
    
  })
  
}
)