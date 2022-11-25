import plotly.graph_objects as go

months = df3.groupby('word').mean().columns

fig = go.Figure()
fig.add_trace(go.Bar(
    x=months,
    y=df3.groupby('word').mean().loc['a'].values,
    name='testeA',
    marker_color='indianred',
    error_y=dict(type='data', array=df3.groupby('word').std().loc['a'].values)   
))
fig.add_trace(go.Bar(
    x=months,
    y=df3.groupby('word').mean().loc['b'].values,
    name='testeB'',
    marker_color='lightsalmon',
    error_y=dict(type='data', array=df3.groupby('word').std().loc['b'].values)
))

# Here we modify the tickangle of the xaxis, resulting in rotated labels.
fig.update_layout(barmode='group', xaxis_tickangle=-45,
                      title="Média das emoções dos clientes por status",
                      xaxis_title="Emoções Clientes",
                      yaxis_title="Média",
                      legend_title="Status",
                      font_family="Courier New",
                      font_color="black",
                      title_font_family="Times New Roman",
                      title_font_color="red",
                      legend_title_font_color="green",
                      font_size=18
                      # font=dict(
                      #     family="Courier New",
                      #     title_font_family="Times New Roman",
                      #     size=18,
                      #     color="black"
                      #       )
                )
fig.show()

fig.write_html("file.html")
