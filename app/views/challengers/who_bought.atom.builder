atom_feed do |feed|
  feed.title "Who bought #{@challenger.title}"

  latest_order = @challenger.orders.sort_by(&:updated_at).last
  feed.updated( latest_order && latest_order.updated_at )

  @challenger.orders.each do |order|
    feed.entry(order) do |entry|
      entry.title "Order #{order.id}"
      entry.summary type: 'xhtml' do |xhtml|
        xhtml.p "Shipped to #{order.email}"

        xhtml.table do
          xhtml.tr do
            xhtml.th 'Challenger'
            xhtml.th 'Quantity'

          end
          order.line_items.each do |item|
            xhtml.tr do
              xhtml.td item.challenger.title
              xhtml.td item.quantity
 
            end
          end
          xhtml.tr do
            xhtml.th 'total', colspan: 2
          end
        end
      end
      entry.author do |author|
        author.name order.name
        author.email order.email
      end
    end
  end
  
end
