//Mailbox (Without Synchornization)
program main;
  mailbox mb;
  
  class tx;
    task run();
      for(int data = 0 ; data < 4; data++)
        begin
          $display("%0t - Putting data in mailbox",$time);
          mb.put(data);
        end
    endtask
  endclass
  
  class rx;
    int data;
    task run();
      repeat(4)
        begin
          mb.get(data);
          $display("%0t - Getting data from mailbox",$time);
        end
    endtask
  endclass
  
  tx tx_h;
  rx rx_h;
  
  initial
    begin
      tx_h = new();
      rx_h = new();
      mb = new();
      fork
        tx_h.run();
        rx_h.run();
      join_any
    end
  
endprogram
