module karekok(
        input clk,  
        input rst,  
        input [31:0]sayi,  
        output reg gecerli,
        output reg tasma,
        output reg [63:0] sonuc
);
    integer i,k;
    reg [31:0] sayilar [15:0];
    reg [31:0] sayiTemp0,sayiTemp1,sayiTemp2,sayiTemp3,sayiTemp4,sayiTemp5,sayiTemp6,sayiTemp7,sayiTemp8,sayiTemp9,sayiTemp10,sayiTemp11,sayiTemp12,sayiTemp13,sayiTemp14,sayiTemp15;
  
    reg [15:0] sonuc16bit0,sonuc16bit1,sonuc16bit2,sonuc16bit3,sonuc16bit4,sonuc16bit5,sonuc16bit6,sonuc16bit7,sonuc16bit8,sonuc16bit9,sonuc16bit10,sonuc16bit11,sonuc16bit12,sonuc16bit13,sonuc16bit14,sonuc16bit15;
   
    reg signed [17:0] Remainder0,Remainder1,Remainder2,Remainder3,Remainder4,Remainder5,Remainder6,Remainder7,Remainder8,Remainder9,Remainder10,Remainder11,Remainder12,Remainder13,Remainder14,Remainder15;
    
    reg [3:0] sayacIN,sayacIN_next;
    reg [3:0]sayac0,sayac1,sayac2,sayac3,sayac4,sayac5,sayac6,sayac7,sayac8,sayac9,sayac10,sayac11,sayac12,sayac13,sayac14,sayac15;
    reg [3:0]sayac_next0,sayac_next1,sayac_next2,sayac_next3,sayac_next4,sayac_next5,sayac_next6,sayac_next7,sayac_next8,sayac_next9,sayac_next10;
    reg [3:0]sayac_next11,sayac_next12,sayac_next13,sayac_next14,sayac_next15;
    reg [17:0] ASIN1_0, ASIN1_1,ASIN1_2,ASIN1_3,ASIN1_4,ASIN1_5,ASIN1_6,ASIN1_7,ASIN1_8,ASIN1_9,ASIN1_10,ASIN1_11,ASIN1_12,ASIN1_13,ASIN1_14,ASIN1_15;
    reg [17:0] ASIN2_0, ASIN2_1,ASIN2_2,ASIN2_3,ASIN2_4,ASIN2_5,ASIN2_6,ASIN2_7,ASIN2_8,ASIN2_9,ASIN2_10,ASIN2_11,ASIN2_12,ASIN2_13,ASIN2_14,ASIN2_15;

    initial begin
        sayac0=0;sayac1=0;sayac2=0;sayac3=0;sayac4=0;sayac5=0;sayac6=0;sayac7=0;sayac8=0;sayac9=0;sayac10=0;sayac11=0;sayac12=0;sayac13=0;sayac14=0;sayac15=0;
        gecerli=0;
        sayacIN=0;sayacIN_next=0;
        Remainder0=0;Remainder1=0;Remainder2=0;Remainder3=0;Remainder4=0;Remainder5=0;Remainder6=0;Remainder7=0;Remainder8=0;Remainder9=0;Remainder10=0;Remainder11=0;Remainder12=0;Remainder13=0;Remainder14=0;Remainder15=0;
        sayiTemp0=0;sayiTemp1=0;sayiTemp2=0;sayiTemp3=0;sayiTemp4=0;sayiTemp5=0;sayiTemp6=0;sayiTemp7=0;sayiTemp8=0;sayiTemp9=0;sayiTemp10=0;sayiTemp11=0;sayiTemp12=0;sayiTemp13=0;sayiTemp14=0;sayiTemp15=0;
        sonuc16bit0=0;sonuc16bit1=0;sonuc16bit2=0;sonuc16bit3=0;sonuc16bit4=0;sonuc16bit5=0;sonuc16bit6=0;sonuc16bit7=0;sonuc16bit8=0;sonuc16bit9=0;sonuc16bit10=0;sonuc16bit11=0;sonuc16bit12=0;sonuc16bit13=0;sonuc16bit14=0;sonuc16bit15=0;
        ASIN1_0=0;ASIN1_1=0;ASIN1_2=0;ASIN1_3=0;ASIN1_4=0;ASIN1_5=0;ASIN1_6=0;ASIN1_7=0;ASIN1_8=0;ASIN1_9=0;ASIN1_10=0;ASIN1_11=0;ASIN1_12=0;ASIN1_13=0;ASIN1_14=0;ASIN1_15=0;
        ASIN2_0=0;ASIN2_1=0;ASIN2_2=0;ASIN2_3=0;ASIN2_4=0;ASIN2_5=0;ASIN2_6=0;ASIN2_7=0;ASIN2_8=0;ASIN2_9=0;ASIN2_10=0;ASIN2_11=0;ASIN2_12=0;ASIN2_13=0;ASIN2_14=0;ASIN2_15=0;
        tasma=0;
        gecerli=0;
        sayac_next0=1;sayac_next1=0;sayac_next2=0;sayac_next3=0;sayac_next4=0;sayac_next5=0;sayac_next6=0;sayac_next7=0;sayac_next8=0;sayac_next9=0;
        sayac_next10=0;sayac_next11=0;sayac_next12=0;sayac_next13=0;sayac_next14=0;sayac_next15=0;
        for(k=0;k<16;k=k+1)begin
                    sayilar[k]=0;              
        end

    end
    
   
    always @(posedge clk or posedge rst)  begin
    sayilar[sayacIN]=sayi;

        if (rst == 1) begin 
        for(k=0;k<16;k=k+1)begin
                    sayilar[k]=0;              
        end 
            gecerli <= 0;
            sonuc <= 0;
            sayiTemp0=0;sayiTemp1=0;sayiTemp2=0;sayiTemp3=0;sayiTemp4=0;sayiTemp5=0;sayiTemp6=0;sayiTemp7=0;sayiTemp8=0;sayiTemp9=0;sayiTemp10=0;sayiTemp11=0;sayiTemp12=0;sayiTemp13=0;sayiTemp14=0;sayiTemp15=0;
            ASIN1_0=0;ASIN1_1=0;ASIN1_2=0;ASIN1_3=0;ASIN1_4=0;ASIN1_5=0;ASIN1_6=0;ASIN1_7=0;ASIN1_8=0;ASIN1_9=0;ASIN1_10=0;ASIN1_11=0;ASIN1_12=0;ASIN1_13=0;ASIN1_14=0;ASIN1_15=0;
            ASIN2_0=0;ASIN2_1=0;ASIN2_2=0;ASIN2_3=0;ASIN2_4=0;ASIN2_5=0;ASIN2_6=0;ASIN2_7=0;ASIN2_8=0;ASIN2_9=0;ASIN2_10=0;ASIN2_11=0;ASIN2_12=0;ASIN2_13=0;ASIN2_14=0;ASIN2_15=0;
            Remainder0=0;Remainder1=0;Remainder2=0;Remainder3=0;Remainder4=0;Remainder5=0;Remainder6=0;Remainder7=0;Remainder8=0;Remainder9=0;Remainder10=0;Remainder11=0;Remainder12=0;Remainder13=0;Remainder14=0;Remainder15=0;
            sonuc16bit0=0;sonuc16bit1=0;sonuc16bit2=0;sonuc16bit3=0;sonuc16bit4=0;sonuc16bit5=0;sonuc16bit6=0;sonuc16bit7=0;sonuc16bit8=0;sonuc16bit9=0;sonuc16bit10=0;sonuc16bit11=0;sonuc16bit12=0;sonuc16bit13=0;sonuc16bit14=0;sonuc16bit15=0;
            sayac_next0=1;sayac_next1=0;sayac_next2=0;sayac_next3=0;sayac_next4=0;sayac_next5=0;sayac_next6=0;sayac_next7=0;sayac_next8=0;sayac_next9=0;
            sayac_next10=0;sayac_next11=0;sayac_next12=0;sayac_next13=0;sayac_next14=0;sayac_next15=0;
            sayacIN=0;                sayacIN_next=1;
        end    
        else begin 
   
            if(sayacIN == 0) begin  
                sayacIN_next=1;
                sayac_next0=1;
                sayiTemp0 = sayilar[0];  
                ASIN2_0 = {sonuc16bit0,Remainder0[17],1'b1};
                ASIN1_0 = {Remainder0[15:0], sayiTemp0[31:30]};
                sayiTemp0 = {sayiTemp0[29:0], 2'b0}; 
                if (Remainder0[17]== 0) begin
                    Remainder0 = ASIN1_0-ASIN2_0;
                end
                else begin
                    Remainder0 = ASIN1_0+ASIN2_0;
                end
                sonuc16bit0 = {sonuc16bit0[14:0], ~Remainder0[17]};
                
                if(sayac1==15)begin
                sayac_next1=0;
                ASIN2_1 = {sonuc16bit1,Remainder1[17],1'b1};
                ASIN1_1 = {Remainder1[15:0], sayiTemp1[31:30]};
                sayiTemp1 = {sayiTemp1[29:0], 2'b0}; 
                if (Remainder1[17]== 0) begin
                    Remainder1 = ASIN1_1-ASIN2_1;
                end
                else begin
                    Remainder1 = ASIN1_1+ASIN2_1;
                end
                sonuc16bit1 = {sonuc16bit1[14:0], ~Remainder1[17]};
                ASIN1_1 = 0;
                ASIN2_1 = 0;
                Remainder1 = 0;
                gecerli=1;         
                sonuc={24'b0,sonuc16bit1,24'b0};
                sonuc16bit1 = 0;
               end
   
                
                if(sayac2==14)begin
                sayac_next2=15;
                ASIN2_2 = {sonuc16bit2,Remainder2[17],1'b1};
                ASIN1_2 = {Remainder2[15:0], sayiTemp2[31:30]};
                sayiTemp2 = {sayiTemp2[29:0], 2'b0}; 
                if (Remainder2[17]== 0) begin
                    Remainder2 = ASIN1_2-ASIN2_2;
                end
                else begin
                    Remainder2 = ASIN1_2+ASIN2_2;
                end
                sonuc16bit2 = {sonuc16bit2[14:0], ~Remainder2[17]};
                end
                
                if(sayac3==13)begin
                sayac_next3=14;
                ASIN2_3 = {sonuc16bit3,Remainder3[17],1'b1};
                ASIN1_3 = {Remainder3[15:0], sayiTemp3[31:30]};
                sayiTemp3 = {sayiTemp3[29:0], 2'b0}; 
                if (Remainder3[17]== 0) begin
                    Remainder3 = ASIN1_3-ASIN2_3;
                end
                else begin
                    Remainder3 = ASIN1_3+ASIN2_3;
                end
                sonuc16bit3 = {sonuc16bit3[14:0], ~Remainder3[17]};
                end
                
                if(sayac4==12)begin
                sayac_next4=13;
                 ASIN2_4 = {sonuc16bit4,Remainder4[17],1'b1};
                ASIN1_4 = {Remainder4[15:0], sayiTemp4[31:30]};
                sayiTemp4 = {sayiTemp4[29:0], 2'b0}; 
                if (Remainder4[17]== 0) begin
                    Remainder4 = ASIN1_4-ASIN2_4;
                end
                else begin
                    Remainder4 = ASIN1_4+ASIN2_4;
                end
                sonuc16bit4 = {sonuc16bit4[14:0], ~Remainder4[17]};
                end
                
                if(sayac5==11)begin
                sayac_next5=12;
                ASIN2_5 = {sonuc16bit5,Remainder5[17],1'b1};
                ASIN1_5 = {Remainder5[15:0], sayiTemp5[31:30]};
                sayiTemp5 = {sayiTemp5[29:0], 2'b0}; 
                if (Remainder5[17]== 0) begin
                    Remainder5 = ASIN1_5-ASIN2_5;
                end
                else begin
                    Remainder5 = ASIN1_5+ASIN2_5;
                end
                sonuc16bit5 = {sonuc16bit5[14:0], ~Remainder5[17]};
                end
                
                if(sayac6==10)begin
                sayac_next6=11;
                ASIN2_6 = {sonuc16bit6,Remainder6[17],1'b1};
                ASIN1_6 = {Remainder6[15:0], sayiTemp6[31:30]};
                sayiTemp6 = {sayiTemp6[29:0], 2'b0}; 
                if (Remainder6[17]== 0) begin
                    Remainder6 = ASIN1_6-ASIN2_6;
                end
                else begin
                    Remainder6 = ASIN1_6+ASIN2_6;
                end
                sonuc16bit6 = {sonuc16bit6[14:0], ~Remainder6[17]};
                end
                
                if(sayac7==9)begin
                sayac_next7=10;
                ASIN2_7 = {sonuc16bit7,Remainder7[17],1'b1};
                ASIN1_7 = {Remainder7[15:0], sayiTemp7[31:30]};
                sayiTemp7 = {sayiTemp7[29:0], 2'b0}; 
                if (Remainder7[17]== 0) begin
                    Remainder7 = ASIN1_7-ASIN2_7;
                end
                else begin
                    Remainder7 = ASIN1_7+ASIN2_7;
                end
                sonuc16bit7 = {sonuc16bit7[14:0], ~Remainder7[17]};
                end
                
                if(sayac8==8)begin
                sayac_next8=9;
                 ASIN2_8 = {sonuc16bit8,Remainder8[17],1'b1};
                ASIN1_8 = {Remainder8[15:0], sayiTemp8[31:30]};
                sayiTemp8 = {sayiTemp8[29:0], 2'b0}; 
                if (Remainder8[17]== 0) begin
                    Remainder8 = ASIN1_8-ASIN2_8;
                end
                else begin
                    Remainder8 = ASIN1_8+ASIN2_8;
                end
                sonuc16bit8 = {sonuc16bit8[14:0], ~Remainder8[17]};
                end
                
                if(sayac9==7)begin
                sayac_next9=8;
                ASIN2_9 = {sonuc16bit9,Remainder9[17],1'b1};
                ASIN1_9 = {Remainder9[15:0], sayiTemp9[31:30]};
                sayiTemp9 = {sayiTemp9[29:0], 2'b0}; 
                if (Remainder9[17]== 0) begin
                    Remainder9 = ASIN1_9-ASIN2_9;
                end
                else begin
                    Remainder9 = ASIN1_9+ASIN2_9;
                end
                sonuc16bit9 = {sonuc16bit9[14:0], ~Remainder9[17]};
                end
                
                if(sayac10==6)begin
                sayac_next10=7;
                 ASIN2_10= {sonuc16bit10,Remainder10[17],1'b1};
                ASIN1_10 = {Remainder10[15:0], sayiTemp10[31:30]};
                sayiTemp10 = {sayiTemp10[29:0], 2'b0}; 
                if (Remainder10[17]== 0) begin
                    Remainder10 = ASIN1_10-ASIN2_10;
                end
                else begin
                    Remainder10 = ASIN1_10+ASIN2_10;
                end
                sonuc16bit10 = {sonuc16bit10[14:0], ~Remainder10[17]};
                end
                
                 if(sayac11==5)begin
                 sayac_next11=6;
                ASIN2_11= {sonuc16bit11,Remainder11[17],1'b1};
                ASIN1_11 = {Remainder11[15:0], sayiTemp11[31:30]};
                sayiTemp11 = {sayiTemp11[29:0], 2'b0}; 
                if (Remainder11[17]== 0) begin
                    Remainder11 = ASIN1_11-ASIN2_11;
                end
                else begin
                    Remainder11 = ASIN1_11+ASIN2_11;
                end
                sonuc16bit11 = {sonuc16bit11[14:0], ~Remainder11[17]};
                end
                
                 if(sayac12==4)begin
                 sayac_next12=5;
                ASIN2_12= {sonuc16bit12,Remainder12[17],1'b1};
                ASIN1_12 = {Remainder12[15:0], sayiTemp12[31:30]};
                sayiTemp12 = {sayiTemp12[29:0], 2'b0}; 
                if (Remainder12[17]== 0) begin
                    Remainder12 = ASIN1_12-ASIN2_12;
                end
                else begin
                    Remainder12 = ASIN1_12+ASIN2_12;
                end
                sonuc16bit12 = {sonuc16bit12[14:0], ~Remainder12[17]};
                end
                
                 if(sayac13==3)begin  
                 sayac_next13=4;              
                ASIN2_13= {sonuc16bit13,Remainder13[17],1'b1};
                ASIN1_13 = {Remainder13[15:0], sayiTemp13[31:30]};
                sayiTemp13 = {sayiTemp13[29:0], 2'b0}; 
                if (Remainder13[17]== 0) begin
                    Remainder13 = ASIN1_13-ASIN2_13;
                end
                else begin
                    Remainder13 = ASIN1_13+ASIN2_13;
                end
                sonuc16bit13 = {sonuc16bit13[14:0], ~Remainder13[17]};
                end
                
                 if(sayac14==2)begin
                 sayac_next14=3;
                ASIN2_14= {sonuc16bit14,Remainder14[17],1'b1};
                ASIN1_14 = {Remainder14[15:0], sayiTemp14[31:30]};
                sayiTemp14 = {sayiTemp14[29:0], 2'b0}; 
                if (Remainder14[17]== 0) begin
                    Remainder14 = ASIN1_14-ASIN2_14;
                end
                else begin
                    Remainder14 = ASIN1_14+ASIN2_14;
                end
                sonuc16bit14 = {sonuc16bit14[14:0], ~Remainder14[17]};
                end
                
                 if(sayac15==1)begin
                 sayac_next15=2;
                ASIN2_15= {sonuc16bit15,Remainder15[17],1'b1};
                ASIN1_15 = {Remainder15[15:0], sayiTemp15[31:30]};
                sayiTemp15 = {sayiTemp15[29:0], 2'b0}; 
                if (Remainder15[17]== 0) begin
                    Remainder15 = ASIN1_15-ASIN2_15;
                end
                else begin
                    Remainder15 = ASIN1_15+ASIN2_15;
                end
                sonuc16bit15 = {sonuc16bit15[14:0], ~Remainder15[17]};
                end
            end  
            
            
            if(sayacIN == 1) begin 
             
            sayacIN_next=2;
                sayiTemp1 = sayilar[1];  
                sayac_next1=1;
                ASIN2_1 = {sonuc16bit1,Remainder1[17],1'b1};
                ASIN1_1 = {Remainder1[15:0], sayiTemp1[31:30]};
                sayiTemp1 = {sayiTemp1[29:0], 2'b0}; 
                if (Remainder1[17]== 0) begin
                    Remainder1 = ASIN1_1-ASIN2_1;
                end
                else begin
                    Remainder1 = ASIN1_1+ASIN2_1;
                end
                sonuc16bit1 = {sonuc16bit1[14:0], ~Remainder1[17]};
                sayac_next0=2;
                
                ASIN2_0 = {sonuc16bit0,Remainder0[17],1'b1};
                ASIN1_0 = {Remainder0[15:0], sayiTemp0[31:30]};
                sayiTemp0 = {sayiTemp0[29:0], 2'b0}; 
                if (Remainder0[17]== 0) begin
                    Remainder0 = ASIN1_0-ASIN2_0;
                end
                else begin
                    Remainder0 = ASIN1_0+ASIN2_0;
                end
                sonuc16bit0 = {sonuc16bit0[14:0], ~Remainder0[17]};
                
                 if(sayac2==15)begin
                 sayac_next2=0;
                ASIN2_2 = {sonuc16bit2,Remainder2[17],1'b1};
                ASIN1_2 = {Remainder2[15:0], sayiTemp2[31:30]};
                sayiTemp2 = {sayiTemp2[29:0], 2'b0}; 
                if (Remainder2[17]== 0) begin
                    Remainder2 = ASIN1_2-ASIN2_2;
                end
                else begin
                    Remainder2 = ASIN1_2+ASIN2_2;
                end
                sonuc16bit2 = {sonuc16bit2[14:0], ~Remainder2[17]};
                ASIN1_2 = 0;
                ASIN2_2 = 0;
                Remainder2 = 0;
                gecerli=1;         
                sonuc={24'b0,sonuc16bit2,24'b0};
                sonuc16bit2 = 0;
                end
                
                if(sayac3==14)begin
                sayac_next3=15;
                ASIN2_3 = {sonuc16bit3,Remainder3[17],1'b1};
                ASIN1_3 = {Remainder3[15:0], sayiTemp3[31:30]};
                sayiTemp3 = {sayiTemp3[29:0], 2'b0}; 
                if (Remainder3[17]== 0) begin
                    Remainder3 = ASIN1_3-ASIN2_3;
                end
                else begin
                    Remainder3 = ASIN1_3+ASIN2_3;
                end
                sonuc16bit3 = {sonuc16bit3[14:0], ~Remainder3[17]};
                end
                
                if(sayac4==13)begin
                sayac_next4=14;
                 ASIN2_4 = {sonuc16bit4,Remainder4[17],1'b1};
                ASIN1_4 = {Remainder4[15:0], sayiTemp4[31:30]};
                sayiTemp4 = {sayiTemp4[29:0], 2'b0}; 
                if (Remainder4[17]== 0) begin
                    Remainder4 = ASIN1_4-ASIN2_4;
                end
                else begin
                    Remainder4 = ASIN1_4+ASIN2_4;
                end
                sonuc16bit4 = {sonuc16bit4[14:0], ~Remainder4[17]};
                end
                
                if(sayac5==12)begin
                sayac_next5=13;
                ASIN2_5 = {sonuc16bit5,Remainder5[17],1'b1};
                ASIN1_5 = {Remainder5[15:0], sayiTemp5[31:30]};
                sayiTemp5 = {sayiTemp5[29:0], 2'b0}; 
                if (Remainder5[17]== 0) begin
                    Remainder5 = ASIN1_5-ASIN2_5;
                end
                else begin
                    Remainder5 = ASIN1_5+ASIN2_5;
                end
                sonuc16bit5 = {sonuc16bit5[14:0], ~Remainder5[17]};
                end
                
                if(sayac6==11)begin
                sayac_next6=12;
                ASIN2_6 = {sonuc16bit6,Remainder6[17],1'b1};
                ASIN1_6 = {Remainder6[15:0], sayiTemp6[31:30]};
                sayiTemp6 = {sayiTemp6[29:0], 2'b0}; 
                if (Remainder6[17]== 0) begin
                    Remainder6 = ASIN1_6-ASIN2_6;
                end
                else begin
                    Remainder6 = ASIN1_6+ASIN2_6;
                end
                sonuc16bit6 = {sonuc16bit6[14:0], ~Remainder6[17]};
                end
                
                if(sayac7==10)begin
                sayac_next7=11;
                ASIN2_7 = {sonuc16bit7,Remainder7[17],1'b1};
                ASIN1_7 = {Remainder7[15:0], sayiTemp7[31:30]};
                sayiTemp7 = {sayiTemp7[29:0], 2'b0}; 
                if (Remainder7[17]== 0) begin
                    Remainder7 = ASIN1_7-ASIN2_7;
                end
                else begin
                    Remainder7 = ASIN1_7+ASIN2_7;
                end
                sonuc16bit7 = {sonuc16bit7[14:0], ~Remainder7[17]};
                end
                
                if(sayac8==9)begin
                sayac_next8=10;
                 ASIN2_8 = {sonuc16bit8,Remainder8[17],1'b1};
                ASIN1_8 = {Remainder8[15:0], sayiTemp8[31:30]};
                sayiTemp8 = {sayiTemp8[29:0], 2'b0}; 
                if (Remainder8[17]== 0) begin
                    Remainder8 = ASIN1_8-ASIN2_8;
                end
                else begin
                    Remainder8 = ASIN1_8+ASIN2_8;
                end
                sonuc16bit8 = {sonuc16bit8[14:0], ~Remainder8[17]};
                end
                
                if(sayac9==8)begin
                sayac_next9=9;
                ASIN2_9 = {sonuc16bit9,Remainder9[17],1'b1};
                ASIN1_9 = {Remainder9[15:0], sayiTemp9[31:30]};
                sayiTemp9 = {sayiTemp9[29:0], 2'b0}; 
                if (Remainder9[17]== 0) begin
                    Remainder9 = ASIN1_9-ASIN2_9;
                end
                else begin
                    Remainder9 = ASIN1_9+ASIN2_9;
                end
                sonuc16bit9 = {sonuc16bit9[14:0], ~Remainder9[17]};
                end
                
                if(sayac10==7)begin
                sayac_next10=8;
                 ASIN2_10= {sonuc16bit10,Remainder10[17],1'b1};
                ASIN1_10 = {Remainder10[15:0], sayiTemp10[31:30]};
                sayiTemp10 = {sayiTemp10[29:0], 2'b0}; 
                if (Remainder10[17]== 0) begin
                    Remainder10 = ASIN1_10-ASIN2_10;
                end
                else begin
                    Remainder10 = ASIN1_10+ASIN2_10;
                end
                sonuc16bit10 = {sonuc16bit10[14:0], ~Remainder10[17]};
                end
                
                 if(sayac11==6)begin
                 sayac_next11=7;
                ASIN2_11= {sonuc16bit11,Remainder11[17],1'b1};
                ASIN1_11 = {Remainder11[15:0], sayiTemp11[31:30]};
                sayiTemp11 = {sayiTemp11[29:0], 2'b0}; 
                if (Remainder11[17]== 0) begin
                    Remainder11 = ASIN1_11-ASIN2_11;
                end
                else begin
                    Remainder11 = ASIN1_11+ASIN2_11;
                end
                sonuc16bit11 = {sonuc16bit11[14:0], ~Remainder11[17]};
                end
                
                 if(sayac12==5)begin
                    sayac_next12=6;
                ASIN2_12= {sonuc16bit12,Remainder12[17],1'b1};
                ASIN1_12 = {Remainder12[15:0], sayiTemp12[31:30]};
                sayiTemp12 = {sayiTemp12[29:0], 2'b0}; 
                if (Remainder12[17]== 0) begin
                    Remainder12 = ASIN1_12-ASIN2_12;
                end
                else begin
                    Remainder12 = ASIN1_12+ASIN2_12;
                end
                sonuc16bit12 = {sonuc16bit12[14:0], ~Remainder12[17]};
                end
                
                 if(sayac13==4)begin 
                 sayac_next13=5;               
                ASIN2_13= {sonuc16bit13,Remainder13[17],1'b1};
                ASIN1_13 = {Remainder13[15:0], sayiTemp13[31:30]};
                sayiTemp13 = {sayiTemp13[29:0], 2'b0}; 
                if (Remainder13[17]== 0) begin
                    Remainder13 = ASIN1_13-ASIN2_13;
                end
                else begin
                    Remainder13 = ASIN1_13+ASIN2_13;
                end
                sonuc16bit13 = {sonuc16bit13[14:0], ~Remainder13[17]};
                end
                
                 if(sayac14==3)begin
                 sayac_next14=4;
                ASIN2_14= {sonuc16bit14,Remainder14[17],1'b1};
                ASIN1_14 = {Remainder14[15:0], sayiTemp14[31:30]};
                sayiTemp14 = {sayiTemp14[29:0], 2'b0}; 
                if (Remainder14[17]== 0) begin
                    Remainder14 = ASIN1_14-ASIN2_14;
                end
                else begin
                    Remainder14 = ASIN1_14+ASIN2_14;
                end
                sonuc16bit14 = {sonuc16bit14[14:0], ~Remainder14[17]};
                end
                
                 if(sayac15==2)begin
                 sayac_next15=3;
                ASIN2_15= {sonuc16bit15,Remainder15[17],1'b1};
                ASIN1_15 = {Remainder15[15:0], sayiTemp15[31:30]};
                sayiTemp15 = {sayiTemp15[29:0], 2'b0}; 
                if (Remainder15[17]== 0) begin
                    Remainder15 = ASIN1_15-ASIN2_15;
                end
                else begin
                    Remainder15 = ASIN1_15+ASIN2_15;
                end
                sonuc16bit15 = {sonuc16bit15[14:0], ~Remainder15[17]};
                end
                
                
            end  
            
            if(sayacIN == 2) begin  
            sayacIN_next=3;
            sayac_next0=3;
            sayac_next1=2;
            sayac_next2=1;
                sayiTemp2 = sayilar[2];  
                ASIN2_2 = {sonuc16bit2,Remainder2[17],1'b1};
                ASIN1_2 = {Remainder2[15:0], sayiTemp2[31:30]};
                sayiTemp2 = {sayiTemp2[29:0], 2'b0}; 
                if (Remainder2[17]== 0) begin
                    Remainder2 = ASIN1_2-ASIN2_2;
                end
                else begin
                    Remainder2 = ASIN1_2+ASIN2_2;
                end
                sonuc16bit2 = {sonuc16bit2[14:0], ~Remainder2[17]};
                
                ASIN2_1 = {sonuc16bit1,Remainder1[17],1'b1};
                ASIN1_1 = {Remainder1[15:0], sayiTemp1[31:30]};
                sayiTemp1 = {sayiTemp1[29:0], 2'b0}; 
                if (Remainder1[17]== 0) begin
                    Remainder1 = ASIN1_1-ASIN2_1;
                end
                else begin
                    Remainder1 = ASIN1_1+ASIN2_1;
                end
                sonuc16bit1 = {sonuc16bit1[14:0], ~Remainder1[17]};
                
                ASIN2_0 = {sonuc16bit0,Remainder0[17],1'b1};
                ASIN1_0 = {Remainder0[15:0], sayiTemp0[31:30]};
                sayiTemp0 = {sayiTemp0[29:0], 2'b0}; 
                if (Remainder0[17]== 0) begin
                    Remainder0 = ASIN1_0-ASIN2_0;
                end
                else begin
                    Remainder0 = ASIN1_0+ASIN2_0;
                end
                sonuc16bit0 = {sonuc16bit0[14:0], ~Remainder0[17]};
                
                if(sayac3==15)begin
                sayac_next3=0;
                ASIN2_3 = {sonuc16bit3,Remainder3[17],1'b1};
                ASIN1_3 = {Remainder3[15:0], sayiTemp3[31:30]};
                sayiTemp3 = {sayiTemp3[29:0], 2'b0}; 
                if (Remainder3[17]== 0) begin
                    Remainder3 = ASIN1_3-ASIN2_3;
                end
                else begin
                    Remainder3 = ASIN1_3+ASIN2_3;
                end
                sonuc16bit3 = {sonuc16bit3[14:0], ~Remainder3[17]};
                ASIN1_3 = 0;
                ASIN2_3 = 0;
                Remainder3 = 0;
                gecerli=1;         
                sonuc={24'b0,sonuc16bit3,24'b0};
                sonuc16bit3 = 0;
                end
                
                if(sayac4==14)begin
                sayac_next4=15;
                 ASIN2_4 = {sonuc16bit4,Remainder4[17],1'b1};
                ASIN1_4 = {Remainder4[15:0], sayiTemp4[31:30]};
                sayiTemp4 = {sayiTemp4[29:0], 2'b0}; 
                if (Remainder4[17]== 0) begin
                    Remainder4 = ASIN1_4-ASIN2_4;
                end
                else begin
                    Remainder4 = ASIN1_4+ASIN2_4;
                end
                sonuc16bit4 = {sonuc16bit4[14:0], ~Remainder4[17]};
                end
                
                if(sayac5==13)begin
                sayac_next5=14;
                ASIN2_5 = {sonuc16bit5,Remainder5[17],1'b1};
                ASIN1_5 = {Remainder5[15:0], sayiTemp5[31:30]};
                sayiTemp5 = {sayiTemp5[29:0], 2'b0}; 
                if (Remainder5[17]== 0) begin
                    Remainder5 = ASIN1_5-ASIN2_5;
                end
                else begin
                    Remainder5 = ASIN1_5+ASIN2_5;
                end
                sonuc16bit5 = {sonuc16bit5[14:0], ~Remainder5[17]};
                end
                
                if(sayac6==12)begin
                sayac_next6=13;
                ASIN2_6 = {sonuc16bit6,Remainder6[17],1'b1};
                ASIN1_6 = {Remainder6[15:0], sayiTemp6[31:30]};
                sayiTemp6 = {sayiTemp6[29:0], 2'b0}; 
                if (Remainder6[17]== 0) begin
                    Remainder6 = ASIN1_6-ASIN2_6;
                end
                else begin
                    Remainder6 = ASIN1_6+ASIN2_6;
                end
                sonuc16bit6 = {sonuc16bit6[14:0], ~Remainder6[17]};
                end
                
                if(sayac7==11)begin
                sayac_next7=12;
                ASIN2_7 = {sonuc16bit7,Remainder7[17],1'b1};
                ASIN1_7 = {Remainder7[15:0], sayiTemp7[31:30]};
                sayiTemp7 = {sayiTemp7[29:0], 2'b0}; 
                if (Remainder7[17]== 0) begin
                    Remainder7 = ASIN1_7-ASIN2_7;
                end
                else begin
                    Remainder7 = ASIN1_7+ASIN2_7;
                end
                sonuc16bit7 = {sonuc16bit7[14:0], ~Remainder7[17]};
                end
                
                if(sayac8==10)begin
                sayac_next8=11;
                 ASIN2_8 = {sonuc16bit8,Remainder8[17],1'b1};
                ASIN1_8 = {Remainder8[15:0], sayiTemp8[31:30]};
                sayiTemp8 = {sayiTemp8[29:0], 2'b0}; 
                if (Remainder8[17]== 0) begin
                    Remainder8 = ASIN1_8-ASIN2_8;
                end
                else begin
                    Remainder8 = ASIN1_8+ASIN2_8;
                end
                sonuc16bit8 = {sonuc16bit8[14:0], ~Remainder8[17]};
                end
                
                if(sayac9==9)begin
                sayac_next9=10;
                ASIN2_9 = {sonuc16bit9,Remainder9[17],1'b1};
                ASIN1_9 = {Remainder9[15:0], sayiTemp9[31:30]};
                sayiTemp9 = {sayiTemp9[29:0], 2'b0}; 
                if (Remainder9[17]== 0) begin
                    Remainder9 = ASIN1_9-ASIN2_9;
                end
                else begin
                    Remainder9 = ASIN1_9+ASIN2_9;
                end
                sonuc16bit9 = {sonuc16bit9[14:0], ~Remainder9[17]};
                end
                
                if(sayac10==8)begin
                sayac_next10=9;
                 ASIN2_10= {sonuc16bit10,Remainder10[17],1'b1};
                ASIN1_10 = {Remainder10[15:0], sayiTemp10[31:30]};
                sayiTemp10 = {sayiTemp10[29:0], 2'b0}; 
                if (Remainder10[17]== 0) begin
                    Remainder10 = ASIN1_10-ASIN2_10;
                end
                else begin
                    Remainder10 = ASIN1_10+ASIN2_10;
                end
                sonuc16bit10 = {sonuc16bit10[14:0], ~Remainder10[17]};
                end
                
                 if(sayac11==7)begin
                 sayac_next11=8;
                ASIN2_11= {sonuc16bit11,Remainder11[17],1'b1};
                ASIN1_11 = {Remainder11[15:0], sayiTemp11[31:30]};
                sayiTemp11 = {sayiTemp11[29:0], 2'b0}; 
                if (Remainder11[17]== 0) begin
                    Remainder11 = ASIN1_11-ASIN2_11;
                end
                else begin
                    Remainder11 = ASIN1_11+ASIN2_11;
                end
                sonuc16bit11 = {sonuc16bit11[14:0], ~Remainder11[17]};
                end
                
                 if(sayac12==6)begin
                 sayac_next12=7;
                ASIN2_12= {sonuc16bit12,Remainder12[17],1'b1};
                ASIN1_12 = {Remainder12[15:0], sayiTemp12[31:30]};
                sayiTemp12 = {sayiTemp12[29:0], 2'b0}; 
                if (Remainder12[17]== 0) begin
                    Remainder12 = ASIN1_12-ASIN2_12;
                end
                else begin
                    Remainder12 = ASIN1_12+ASIN2_12;
                end
                sonuc16bit12 = {sonuc16bit12[14:0], ~Remainder12[17]};
                end
                
                 if(sayac13==5)begin         
                 sayac_next13=6;       
                ASIN2_13= {sonuc16bit13,Remainder13[17],1'b1};
                ASIN1_13 = {Remainder13[15:0], sayiTemp13[31:30]};
                sayiTemp13 = {sayiTemp13[29:0], 2'b0}; 
                if (Remainder13[17]== 0) begin
                    Remainder13 = ASIN1_13-ASIN2_13;
                end
                else begin
                    Remainder13 = ASIN1_13+ASIN2_13;
                end
                sonuc16bit13 = {sonuc16bit13[14:0], ~Remainder13[17]};
                end
                
                 if(sayac14==4)begin
                 sayac_next14=5;
                ASIN2_14= {sonuc16bit14,Remainder14[17],1'b1};
                ASIN1_14 = {Remainder14[15:0], sayiTemp14[31:30]};
                sayiTemp14 = {sayiTemp14[29:0], 2'b0}; 
                if (Remainder14[17]== 0) begin
                    Remainder14 = ASIN1_14-ASIN2_14;
                end
                else begin
                    Remainder14 = ASIN1_14+ASIN2_14;
                end
                sonuc16bit14 = {sonuc16bit14[14:0], ~Remainder14[17]};
                end
                
                 if(sayac15==3)begin
                 sayac_next15=4;
                ASIN2_15= {sonuc16bit15,Remainder15[17],1'b1};
                ASIN1_15 = {Remainder15[15:0], sayiTemp15[31:30]};
                sayiTemp15 = {sayiTemp15[29:0], 2'b0}; 
                if (Remainder15[17]== 0) begin
                    Remainder15 = ASIN1_15-ASIN2_15;
                end
                else begin
                    Remainder15 = ASIN1_15+ASIN2_15;
                end
                sonuc16bit15 = {sonuc16bit15[14:0], ~Remainder15[17]};
                end
                
            end  
            
            
            
            
            if(sayacIN == 3) begin 
            sayacIN_next=4; 
            sayac_next0=4;
            sayac_next1=3;
            sayac_next2=2;
            sayac_next3=1;
                sayiTemp3 = sayilar[3];  
                ASIN2_2 = {sonuc16bit2,Remainder2[17],1'b1};
                ASIN1_2 = {Remainder2[15:0], sayiTemp2[31:30]};
                sayiTemp2 = {sayiTemp2[29:0], 2'b0}; 
                if (Remainder2[17]== 0) begin
                    Remainder2 = ASIN1_2-ASIN2_2;
                end
                else begin
                    Remainder2 = ASIN1_2+ASIN2_2;
                end
                sonuc16bit2 = {sonuc16bit2[14:0], ~Remainder2[17]};
                
                ASIN2_1 = {sonuc16bit1,Remainder1[17],1'b1};
                ASIN1_1 = {Remainder1[15:0], sayiTemp1[31:30]};
                sayiTemp1 = {sayiTemp1[29:0], 2'b0}; 
                if (Remainder1[17]== 0) begin
                    Remainder1 = ASIN1_1-ASIN2_1;
                end
                else begin
                    Remainder1 = ASIN1_1+ASIN2_1;
                end
                sonuc16bit1 = {sonuc16bit1[14:0], ~Remainder1[17]};
                
                ASIN2_0 = {sonuc16bit0,Remainder0[17],1'b1};
                ASIN1_0 = {Remainder0[15:0], sayiTemp0[31:30]};
                sayiTemp0 = {sayiTemp0[29:0], 2'b0}; 
                if (Remainder0[17]== 0) begin
                    Remainder0 = ASIN1_0-ASIN2_0;
                end
                else begin
                    Remainder0 = ASIN1_0+ASIN2_0;
                end
                sonuc16bit0 = {sonuc16bit0[14:0], ~Remainder0[17]};

                ASIN2_3 = {sonuc16bit3,Remainder3[17],1'b1};
                ASIN1_3 = {Remainder3[15:0], sayiTemp3[31:30]};
                sayiTemp3 = {sayiTemp3[29:0], 2'b0}; 
                if (Remainder3[17]== 0) begin
                    Remainder3 = ASIN1_3-ASIN2_3;
                end
                else begin
                    Remainder3 = ASIN1_3+ASIN2_3;
                end
                sonuc16bit3 = {sonuc16bit3[14:0], ~Remainder3[17]};
         
                
                if(sayac4==15)begin
                sayac_next4=0;
                 ASIN2_4 = {sonuc16bit4,Remainder4[17],1'b1};
                ASIN1_4 = {Remainder4[15:0], sayiTemp4[31:30]};
                sayiTemp4 = {sayiTemp4[29:0], 2'b0}; 
                if (Remainder4[17]== 0) begin
                    Remainder4 = ASIN1_4-ASIN2_4;
                end
                else begin
                    Remainder4 = ASIN1_4+ASIN2_4;
                end
                sonuc16bit4 = {sonuc16bit4[14:0], ~Remainder4[17]};
                ASIN1_4 = 0;
                ASIN2_4 = 0;
                Remainder4 = 0;
                gecerli=1;         
               sonuc={24'b0,sonuc16bit4,24'b0};
                sonuc16bit4 = 0;
                end
                
                if(sayac5==14)begin
                sayac_next5=15;
                ASIN2_5 = {sonuc16bit5,Remainder5[17],1'b1};
                ASIN1_5 = {Remainder5[15:0], sayiTemp5[31:30]};
                sayiTemp5 = {sayiTemp5[29:0], 2'b0}; 
                if (Remainder5[17]== 0) begin
                    Remainder5 = ASIN1_5-ASIN2_5;
                end
                else begin
                    Remainder5 = ASIN1_5+ASIN2_5;
                end
                sonuc16bit5 = {sonuc16bit5[14:0], ~Remainder5[17]};
                end
                
                if(sayac6==13)begin
                sayac_next6=14;
                ASIN2_6 = {sonuc16bit6,Remainder6[17],1'b1};
                ASIN1_6 = {Remainder6[15:0], sayiTemp6[31:30]};
                sayiTemp6 = {sayiTemp6[29:0], 2'b0}; 
                if (Remainder6[17]== 0) begin
                    Remainder6 = ASIN1_6-ASIN2_6;
                end
                else begin
                    Remainder6 = ASIN1_6+ASIN2_6;
                end
                sonuc16bit6 = {sonuc16bit6[14:0], ~Remainder6[17]};
                end
                
                if(sayac7==12)begin
                sayac_next7=13;
                ASIN2_7 = {sonuc16bit7,Remainder7[17],1'b1};
                ASIN1_7 = {Remainder7[15:0], sayiTemp7[31:30]};
                sayiTemp7 = {sayiTemp7[29:0], 2'b0}; 
                if (Remainder7[17]== 0) begin
                    Remainder7 = ASIN1_7-ASIN2_7;
                end
                else begin
                    Remainder7 = ASIN1_7+ASIN2_7;
                end
                sonuc16bit7 = {sonuc16bit7[14:0], ~Remainder7[17]};
                end
                
                if(sayac8==11)begin
                sayac_next8=12;
                 ASIN2_8 = {sonuc16bit8,Remainder8[17],1'b1};
                ASIN1_8 = {Remainder8[15:0], sayiTemp8[31:30]};
                sayiTemp8 = {sayiTemp8[29:0], 2'b0}; 
                if (Remainder8[17]== 0) begin
                    Remainder8 = ASIN1_8-ASIN2_8;
                end
                else begin
                    Remainder8 = ASIN1_8+ASIN2_8;
                end
                sonuc16bit8 = {sonuc16bit8[14:0], ~Remainder8[17]};
                end
                
                if(sayac9==10)begin
                sayac_next9=11;
                ASIN2_9 = {sonuc16bit9,Remainder9[17],1'b1};
                ASIN1_9 = {Remainder9[15:0], sayiTemp9[31:30]};
                sayiTemp9 = {sayiTemp9[29:0], 2'b0}; 
                if (Remainder9[17]== 0) begin
                    Remainder9 = ASIN1_9-ASIN2_9;
                end
                else begin
                    Remainder9 = ASIN1_9+ASIN2_9;
                end
                sonuc16bit9 = {sonuc16bit9[14:0], ~Remainder9[17]};
                end
                
                if(sayac10==9)begin
                sayac_next10=10;
                 ASIN2_10= {sonuc16bit10,Remainder10[17],1'b1};
                ASIN1_10 = {Remainder10[15:0], sayiTemp10[31:30]};
                sayiTemp10 = {sayiTemp10[29:0], 2'b0}; 
                if (Remainder10[17]== 0) begin
                    Remainder10 = ASIN1_10-ASIN2_10;
                end
                else begin
                    Remainder10 = ASIN1_10+ASIN2_10;
                end
                sonuc16bit10 = {sonuc16bit10[14:0], ~Remainder10[17]};
                end
                
                 if(sayac11==8)begin
                 sayac_next11=9;
                ASIN2_11= {sonuc16bit11,Remainder11[17],1'b1};
                ASIN1_11 = {Remainder11[15:0], sayiTemp11[31:30]};
                sayiTemp11 = {sayiTemp11[29:0], 2'b0}; 
                if (Remainder11[17]== 0) begin
                    Remainder11 = ASIN1_11-ASIN2_11;
                end
                else begin
                    Remainder11 = ASIN1_11+ASIN2_11;
                end
                sonuc16bit11 = {sonuc16bit11[14:0], ~Remainder11[17]};
                end
                
                 if(sayac12==7)begin
                 sayac_next12=8;
                ASIN2_12= {sonuc16bit12,Remainder12[17],1'b1};
                ASIN1_12 = {Remainder12[15:0], sayiTemp12[31:30]};
                sayiTemp12 = {sayiTemp12[29:0], 2'b0}; 
                if (Remainder12[17]== 0) begin
                    Remainder12 = ASIN1_12-ASIN2_12;
                end
                else begin
                    Remainder12 = ASIN1_12+ASIN2_12;
                end
                sonuc16bit12 = {sonuc16bit12[14:0], ~Remainder12[17]};
                end
                
                 if(sayac13==6)begin  
                 sayac_next13=7;              
                ASIN2_13= {sonuc16bit13,Remainder13[17],1'b1};
                ASIN1_13 = {Remainder13[15:0], sayiTemp13[31:30]};
                sayiTemp13 = {sayiTemp13[29:0], 2'b0}; 
                if (Remainder13[17]== 0) begin
                    Remainder13 = ASIN1_13-ASIN2_13;
                end
                else begin
                    Remainder13 = ASIN1_13+ASIN2_13;
                end
                sonuc16bit13 = {sonuc16bit13[14:0], ~Remainder13[17]};
                end
                
                 if(sayac14==5)begin
                 sayac_next14=6;
                ASIN2_14= {sonuc16bit14,Remainder14[17],1'b1};
                ASIN1_14 = {Remainder14[15:0], sayiTemp14[31:30]};
                sayiTemp14 = {sayiTemp14[29:0], 2'b0}; 
                if (Remainder14[17]== 0) begin
                    Remainder14 = ASIN1_14-ASIN2_14;
                end
                else begin
                    Remainder14 = ASIN1_14+ASIN2_14;
                end
                sonuc16bit14 = {sonuc16bit14[14:0], ~Remainder14[17]};
                end
                
                 if(sayac15==4)begin
                 sayac_next15=5;
                ASIN2_15= {sonuc16bit15,Remainder15[17],1'b1};
                ASIN1_15 = {Remainder15[15:0], sayiTemp15[31:30]};
                sayiTemp15 = {sayiTemp15[29:0], 2'b0}; 
                if (Remainder15[17]== 0) begin
                    Remainder15 = ASIN1_15-ASIN2_15;
                end
                else begin
                    Remainder15 = ASIN1_15+ASIN2_15;
                end
                sonuc16bit15 = {sonuc16bit15[14:0], ~Remainder15[17]};
                end
            end  
            
            
            
            
           if(sayacIN == 4) begin 
           sayacIN_next=5; 
           sayac_next0=5;
            sayac_next1=4;
            sayac_next2=3;
            sayac_next3=2;
            sayac_next4=1;
                sayiTemp4 = sayilar[4];  
                ASIN2_2 = {sonuc16bit2,Remainder2[17],1'b1};
                ASIN1_2 = {Remainder2[15:0], sayiTemp2[31:30]};
                sayiTemp2 = {sayiTemp2[29:0], 2'b0}; 
                if (Remainder2[17]== 0) begin
                    Remainder2 = ASIN1_2-ASIN2_2;
                end
                else begin
                    Remainder2 = ASIN1_2+ASIN2_2;
                end
                sonuc16bit2 = {sonuc16bit2[14:0], ~Remainder2[17]};
                
                ASIN2_1 = {sonuc16bit1,Remainder1[17],1'b1};
                ASIN1_1 = {Remainder1[15:0], sayiTemp1[31:30]};
                sayiTemp1 = {sayiTemp1[29:0], 2'b0}; 
                if (Remainder1[17]== 0) begin
                    Remainder1 = ASIN1_1-ASIN2_1;
                end
                else begin
                    Remainder1 = ASIN1_1+ASIN2_1;
                end
                sonuc16bit1 = {sonuc16bit1[14:0], ~Remainder1[17]};
                
                ASIN2_0 = {sonuc16bit0,Remainder0[17],1'b1};
                ASIN1_0 = {Remainder0[15:0], sayiTemp0[31:30]};
                sayiTemp0 = {sayiTemp0[29:0], 2'b0}; 
                if (Remainder0[17]== 0) begin
                    Remainder0 = ASIN1_0-ASIN2_0;
                end
                else begin
                    Remainder0 = ASIN1_0+ASIN2_0;
                end
                sonuc16bit0 = {sonuc16bit0[14:0], ~Remainder0[17]};

                ASIN2_3 = {sonuc16bit3,Remainder3[17],1'b1};
                ASIN1_3 = {Remainder3[15:0], sayiTemp3[31:30]};
                sayiTemp3 = {sayiTemp3[29:0], 2'b0}; 
                if (Remainder3[17]== 0) begin
                    Remainder3 = ASIN1_3-ASIN2_3;
                end
                else begin
                    Remainder3 = ASIN1_3+ASIN2_3;
                end
                sonuc16bit3 = {sonuc16bit3[14:0], ~Remainder3[17]};
                
                ASIN2_4 = {sonuc16bit4,Remainder4[17],1'b1};
                ASIN1_4 = {Remainder4[15:0], sayiTemp4[31:30]};
                sayiTemp4 = {sayiTemp4[29:0], 2'b0}; 
                if (Remainder4[17]== 0) begin
                    Remainder4 = ASIN1_4-ASIN2_4;
                end
                else begin
                    Remainder4 = ASIN1_4+ASIN2_4;
                end
                sonuc16bit4 = {sonuc16bit4[14:0], ~Remainder4[17]};
                
                 if(sayac5==15)begin
                 sayac_next5=0;
                ASIN2_5 = {sonuc16bit5,Remainder5[17],1'b1};
                ASIN1_5 = {Remainder5[15:0], sayiTemp5[31:30]};
                sayiTemp5 = {sayiTemp5[29:0], 2'b0}; 
                if (Remainder5[17]== 0) begin
                    Remainder5 = ASIN1_5-ASIN2_5;
                end
                else begin
                    Remainder5 = ASIN1_5+ASIN2_5;
                end
                sonuc16bit5 = {sonuc16bit5[14:0], ~Remainder5[17]};
                ASIN1_5 = 0;
                ASIN2_5 = 0;
                Remainder5 = 0;
                gecerli=1;         
                sonuc={24'b0,sonuc16bit5,24'b0};
                sonuc16bit5 = 0;
                end
                
                if(sayac6==14)begin
                sayac_next6=15;
                ASIN2_6 = {sonuc16bit6,Remainder6[17],1'b1};
                ASIN1_6 = {Remainder6[15:0], sayiTemp6[31:30]};
                sayiTemp6 = {sayiTemp6[29:0], 2'b0}; 
                if (Remainder6[17]== 0) begin
                    Remainder6 = ASIN1_6-ASIN2_6;
                end
                else begin
                    Remainder6 = ASIN1_6+ASIN2_6;
                end
                sonuc16bit6 = {sonuc16bit6[14:0], ~Remainder6[17]};
                end
                
                if(sayac7==13)begin
                sayac_next7=14;
                ASIN2_7 = {sonuc16bit7,Remainder7[17],1'b1};
                ASIN1_7 = {Remainder7[15:0], sayiTemp7[31:30]};
                sayiTemp7 = {sayiTemp7[29:0], 2'b0}; 
                if (Remainder7[17]== 0) begin
                    Remainder7 = ASIN1_7-ASIN2_7;
                end
                else begin
                    Remainder7 = ASIN1_7+ASIN2_7;
                end
                sonuc16bit7 = {sonuc16bit7[14:0], ~Remainder7[17]};
                end
                
                if(sayac8==12)begin
                sayac_next8=13;
                
                 ASIN2_8 = {sonuc16bit8,Remainder8[17],1'b1};
                ASIN1_8 = {Remainder8[15:0], sayiTemp8[31:30]};
                sayiTemp8 = {sayiTemp8[29:0], 2'b0}; 
                if (Remainder8[17]== 0) begin
                    Remainder8 = ASIN1_8-ASIN2_8;
                end
                else begin
                    Remainder8 = ASIN1_8+ASIN2_8;
                end
                sonuc16bit8 = {sonuc16bit8[14:0], ~Remainder8[17]};
                end
                
                if(sayac9==11)begin
                sayac_next9=12;
                ASIN2_9 = {sonuc16bit9,Remainder9[17],1'b1};
                ASIN1_9 = {Remainder9[15:0], sayiTemp9[31:30]};
                sayiTemp9 = {sayiTemp9[29:0], 2'b0}; 
                if (Remainder9[17]== 0) begin
                    Remainder9 = ASIN1_9-ASIN2_9;
                end
                else begin
                    Remainder9 = ASIN1_9+ASIN2_9;
                end
                sonuc16bit9 = {sonuc16bit9[14:0], ~Remainder9[17]};
                end
                
                if(sayac10==10)begin
                sayac_next10=11;
                 ASIN2_10= {sonuc16bit10,Remainder10[17],1'b1};
                ASIN1_10 = {Remainder10[15:0], sayiTemp10[31:30]};
                sayiTemp10 = {sayiTemp10[29:0], 2'b0}; 
                if (Remainder10[17]== 0) begin
                    Remainder10 = ASIN1_10-ASIN2_10;
                end
                else begin
                    Remainder10 = ASIN1_10+ASIN2_10;
                end
                sonuc16bit10 = {sonuc16bit10[14:0], ~Remainder10[17]};
                end
                
                 if(sayac11==9)begin
                  sayac_next11=10;
                ASIN2_11= {sonuc16bit11,Remainder11[17],1'b1};
                ASIN1_11 = {Remainder11[15:0], sayiTemp11[31:30]};
                sayiTemp11 = {sayiTemp11[29:0], 2'b0}; 
                if (Remainder11[17]== 0) begin
                    Remainder11 = ASIN1_11-ASIN2_11;
                end
                else begin
                    Remainder11 = ASIN1_11+ASIN2_11;
                end
                sonuc16bit11 = {sonuc16bit11[14:0], ~Remainder11[17]};
                end
                
                 if(sayac12==8)begin
                  sayac_next12=9;
                ASIN2_12= {sonuc16bit12,Remainder12[17],1'b1};
                ASIN1_12 = {Remainder12[15:0], sayiTemp12[31:30]};
                sayiTemp12 = {sayiTemp12[29:0], 2'b0}; 
                if (Remainder12[17]== 0) begin
                    Remainder12 = ASIN1_12-ASIN2_12;
                end
                else begin
                    Remainder12 = ASIN1_12+ASIN2_12;
                end
                sonuc16bit12 = {sonuc16bit12[14:0], ~Remainder12[17]};
                end
                
                 if(sayac13==7)begin 
                           sayac_next13=8;      
                ASIN2_13= {sonuc16bit13,Remainder13[17],1'b1};
                ASIN1_13 = {Remainder13[15:0], sayiTemp13[31:30]};
                sayiTemp13 = {sayiTemp13[29:0], 2'b0}; 
                if (Remainder13[17]== 0) begin
                    Remainder13 = ASIN1_13-ASIN2_13;
                end
                else begin
                    Remainder13 = ASIN1_13+ASIN2_13;
                end
                sonuc16bit13 = {sonuc16bit13[14:0], ~Remainder13[17]};
                end
                
                 if(sayac14==6)begin
                  sayac_next14=7;
                ASIN2_14= {sonuc16bit14,Remainder14[17],1'b1};
                ASIN1_14 = {Remainder14[15:0], sayiTemp14[31:30]};
                sayiTemp14 = {sayiTemp14[29:0], 2'b0}; 
                if (Remainder14[17]== 0) begin
                    Remainder14 = ASIN1_14-ASIN2_14;
                end
                else begin
                    Remainder14 = ASIN1_14+ASIN2_14;
                end
                sonuc16bit14 = {sonuc16bit14[14:0], ~Remainder14[17]};
                end
                
                 if(sayac15==5)begin
                  sayac_next15=6;
                ASIN2_15= {sonuc16bit15,Remainder15[17],1'b1};
                ASIN1_15 = {Remainder15[15:0], sayiTemp15[31:30]};
                sayiTemp15 = {sayiTemp15[29:0], 2'b0}; 
                if (Remainder15[17]== 0) begin
                    Remainder15 = ASIN1_15-ASIN2_15;
                end
                else begin
                    Remainder15 = ASIN1_15+ASIN2_15;
                end
                sonuc16bit15 = {sonuc16bit15[14:0], ~Remainder15[17]};
                end
            end   
            
            
            if(sayacIN == 5) begin  
            sayacIN_next=6;
            sayac_next0=6;
            sayac_next1=5;
            sayac_next2=4;
            sayac_next3=3;
            sayac_next4=2;
            sayac_next5=1;
                sayiTemp5 = sayilar[5];  
                ASIN2_2 = {sonuc16bit2,Remainder2[17],1'b1};
                ASIN1_2 = {Remainder2[15:0], sayiTemp2[31:30]};
                sayiTemp2 = {sayiTemp2[29:0], 2'b0}; 
                if (Remainder2[17]== 0) begin
                    Remainder2 = ASIN1_2-ASIN2_2;
                end
                else begin
                    Remainder2 = ASIN1_2+ASIN2_2;
                end
                sonuc16bit2 = {sonuc16bit2[14:0], ~Remainder2[17]};
                
                ASIN2_1 = {sonuc16bit1,Remainder1[17],1'b1};
                ASIN1_1 = {Remainder1[15:0], sayiTemp1[31:30]};
                sayiTemp1 = {sayiTemp1[29:0], 2'b0}; 
                if (Remainder1[17]== 0) begin
                    Remainder1 = ASIN1_1-ASIN2_1;
                end
                else begin
                    Remainder1 = ASIN1_1+ASIN2_1;
                end
                sonuc16bit1 = {sonuc16bit1[14:0], ~Remainder1[17]};
                
                ASIN2_0 = {sonuc16bit0,Remainder0[17],1'b1};
                ASIN1_0 = {Remainder0[15:0], sayiTemp0[31:30]};
                sayiTemp0 = {sayiTemp0[29:0], 2'b0}; 
                if (Remainder0[17]== 0) begin
                    Remainder0 = ASIN1_0-ASIN2_0;
                end
                else begin
                    Remainder0 = ASIN1_0+ASIN2_0;
                end
                sonuc16bit0 = {sonuc16bit0[14:0], ~Remainder0[17]};

                ASIN2_3 = {sonuc16bit3,Remainder3[17],1'b1};
                ASIN1_3 = {Remainder3[15:0], sayiTemp3[31:30]};
                sayiTemp3 = {sayiTemp3[29:0], 2'b0}; 
                if (Remainder3[17]== 0) begin
                    Remainder3 = ASIN1_3-ASIN2_3;
                end
                else begin
                    Remainder3 = ASIN1_3+ASIN2_3;
                end
                sonuc16bit3 = {sonuc16bit3[14:0], ~Remainder3[17]};
                
                ASIN2_4 = {sonuc16bit4,Remainder4[17],1'b1};
                ASIN1_4 = {Remainder4[15:0], sayiTemp4[31:30]};
                sayiTemp4 = {sayiTemp4[29:0], 2'b0}; 
                if (Remainder4[17]== 0) begin
                    Remainder4 = ASIN1_4-ASIN2_4;
                end
                else begin
                    Remainder4 = ASIN1_4+ASIN2_4;
                end
                sonuc16bit4 = {sonuc16bit4[14:0], ~Remainder4[17]};
                
      
                ASIN2_5 = {sonuc16bit5,Remainder5[17],1'b1};
                ASIN1_5 = {Remainder5[15:0], sayiTemp5[31:30]};
                sayiTemp5 = {sayiTemp5[29:0], 2'b0}; 
                if (Remainder5[17]== 0) begin
                    Remainder5 = ASIN1_5-ASIN2_5;
                end
                else begin
                    Remainder5 = ASIN1_5+ASIN2_5;
                end
                sonuc16bit5 = {sonuc16bit5[14:0], ~Remainder5[17]};

                if(sayac6==15)begin
                sayac_next6=0;
                ASIN2_6 = {sonuc16bit6,Remainder6[17],1'b1};
                ASIN1_6 = {Remainder6[15:0], sayiTemp6[31:30]};
                sayiTemp6 = {sayiTemp6[29:0], 2'b0}; 
                if (Remainder6[17]== 0) begin
                    Remainder6 = ASIN1_6-ASIN2_6;
                end
                else begin
                    Remainder6 = ASIN1_6+ASIN2_6;
                end
                sonuc16bit6 = {sonuc16bit6[14:0], ~Remainder6[17]};
                ASIN1_6 = 0;
                ASIN2_6 = 0;
                Remainder6 = 0;
                gecerli=1;         
               sonuc={24'b0,sonuc16bit6,24'b0};
                sonuc16bit6 = 0;
                end
                
                if(sayac7==14)begin
                sayac_next7=15;
                ASIN2_7 = {sonuc16bit7,Remainder7[17],1'b1};
                ASIN1_7 = {Remainder7[15:0], sayiTemp7[31:30]};
                sayiTemp7 = {sayiTemp7[29:0], 2'b0}; 
                if (Remainder7[17]== 0) begin
                    Remainder7 = ASIN1_7-ASIN2_7;
                end
                else begin
                    Remainder7 = ASIN1_7+ASIN2_7;
                end
                sonuc16bit7 = {sonuc16bit7[14:0], ~Remainder7[17]};
                end
                
                if(sayac8==13)begin
                sayac_next8=14;
                 ASIN2_8 = {sonuc16bit8,Remainder8[17],1'b1};
                ASIN1_8 = {Remainder8[15:0], sayiTemp8[31:30]};
                sayiTemp8 = {sayiTemp8[29:0], 2'b0}; 
                if (Remainder8[17]== 0) begin
                    Remainder8 = ASIN1_8-ASIN2_8;
                end
                else begin
                    Remainder8 = ASIN1_8+ASIN2_8;
                end
                sonuc16bit8 = {sonuc16bit8[14:0], ~Remainder8[17]};
                end
                
                if(sayac9==12)begin
                sayac_next9=13;
                ASIN2_9 = {sonuc16bit9,Remainder9[17],1'b1};
                ASIN1_9 = {Remainder9[15:0], sayiTemp9[31:30]};
                sayiTemp9 = {sayiTemp9[29:0], 2'b0}; 
                if (Remainder9[17]== 0) begin
                    Remainder9 = ASIN1_9-ASIN2_9;
                end
                else begin
                    Remainder9 = ASIN1_9+ASIN2_9;
                end
                sonuc16bit9 = {sonuc16bit9[14:0], ~Remainder9[17]};
                end
                
                if(sayac10==11)begin
                sayac_next10=12;
                 ASIN2_10= {sonuc16bit10,Remainder10[17],1'b1};
                ASIN1_10 = {Remainder10[15:0], sayiTemp10[31:30]};
                sayiTemp10 = {sayiTemp10[29:0], 2'b0}; 
                if (Remainder10[17]== 0) begin
                    Remainder10 = ASIN1_10-ASIN2_10;
                end
                else begin
                    Remainder10 = ASIN1_10+ASIN2_10;
                end
                sonuc16bit10 = {sonuc16bit10[14:0], ~Remainder10[17]};
                end
                
                 if(sayac11==10)begin
                 sayac_next11=11;
                ASIN2_11= {sonuc16bit11,Remainder11[17],1'b1};
                ASIN1_11 = {Remainder11[15:0], sayiTemp11[31:30]};
                sayiTemp11 = {sayiTemp11[29:0], 2'b0}; 
                if (Remainder11[17]== 0) begin
                    Remainder11 = ASIN1_11-ASIN2_11;
                end
                else begin
                    Remainder11 = ASIN1_11+ASIN2_11;
                end
                sonuc16bit11 = {sonuc16bit11[14:0], ~Remainder11[17]};
                end
                
                 if(sayac12==9)begin
                 sayac_next12=10;
                ASIN2_12= {sonuc16bit12,Remainder12[17],1'b1};
                ASIN1_12 = {Remainder12[15:0], sayiTemp12[31:30]};
                sayiTemp12 = {sayiTemp12[29:0], 2'b0}; 
                if (Remainder12[17]== 0) begin
                    Remainder12 = ASIN1_12-ASIN2_12;
                end
                else begin
                    Remainder12 = ASIN1_12+ASIN2_12;
                end
                sonuc16bit12 = {sonuc16bit12[14:0], ~Remainder12[17]};
                end
                
                 if(sayac13==8)begin     
                 sayac_next13=9;           
                ASIN2_13= {sonuc16bit13,Remainder13[17],1'b1};
                ASIN1_13 = {Remainder13[15:0], sayiTemp13[31:30]};
                sayiTemp13 = {sayiTemp13[29:0], 2'b0}; 
                if (Remainder13[17]== 0) begin
                    Remainder13 = ASIN1_13-ASIN2_13;
                end
                else begin
                    Remainder13 = ASIN1_13+ASIN2_13;
                end
                sonuc16bit13 = {sonuc16bit13[14:0], ~Remainder13[17]};
                end
                
                 if(sayac14==7)begin
                 sayac_next14=8;
                ASIN2_14= {sonuc16bit14,Remainder14[17],1'b1};
                ASIN1_14 = {Remainder14[15:0], sayiTemp14[31:30]};
                sayiTemp14 = {sayiTemp14[29:0], 2'b0}; 
                if (Remainder14[17]== 0) begin
                    Remainder14 = ASIN1_14-ASIN2_14;
                end
                else begin
                    Remainder14 = ASIN1_14+ASIN2_14;
                end
                sonuc16bit14 = {sonuc16bit14[14:0], ~Remainder14[17]};
                end
                
                 if(sayac15==6)begin
                 sayac_next15=7;
                ASIN2_15= {sonuc16bit15,Remainder15[17],1'b1};
                ASIN1_15 = {Remainder15[15:0], sayiTemp15[31:30]};
                sayiTemp15 = {sayiTemp15[29:0], 2'b0}; 
                if (Remainder15[17]== 0) begin
                    Remainder15 = ASIN1_15-ASIN2_15;
                end
                else begin
                    Remainder15 = ASIN1_15+ASIN2_15;
                end
                sonuc16bit15 = {sonuc16bit15[14:0], ~Remainder15[17]};
                end
            end  
            
            
            if(sayacIN == 6) begin  
            sayacIN_next=7;
            sayac_next0=7;
            sayac_next1=6;
            sayac_next2=5;
            sayac_next3=4;
            sayac_next4=3;
            sayac_next5=2;
            sayac_next6=1;
                sayiTemp6 = sayilar[6];  
                ASIN2_2 = {sonuc16bit2,Remainder2[17],1'b1};
                ASIN1_2 = {Remainder2[15:0], sayiTemp2[31:30]};
                sayiTemp2 = {sayiTemp2[29:0], 2'b0}; 
                if (Remainder2[17]== 0) begin
                    Remainder2 = ASIN1_2-ASIN2_2;
                end
                else begin
                    Remainder2 = ASIN1_2+ASIN2_2;
                end
                sonuc16bit2 = {sonuc16bit2[14:0], ~Remainder2[17]};
                
                ASIN2_1 = {sonuc16bit1,Remainder1[17],1'b1};
                ASIN1_1 = {Remainder1[15:0], sayiTemp1[31:30]};
                sayiTemp1 = {sayiTemp1[29:0], 2'b0}; 
                if (Remainder1[17]== 0) begin
                    Remainder1 = ASIN1_1-ASIN2_1;
                end
                else begin
                    Remainder1 = ASIN1_1+ASIN2_1;
                end
                sonuc16bit1 = {sonuc16bit1[14:0], ~Remainder1[17]};
                
                ASIN2_0 = {sonuc16bit0,Remainder0[17],1'b1};
                ASIN1_0 = {Remainder0[15:0], sayiTemp0[31:30]};
                sayiTemp0 = {sayiTemp0[29:0], 2'b0}; 
                if (Remainder0[17]== 0) begin
                    Remainder0 = ASIN1_0-ASIN2_0;
                end
                else begin
                    Remainder0 = ASIN1_0+ASIN2_0;
                end
                sonuc16bit0 = {sonuc16bit0[14:0], ~Remainder0[17]};

                ASIN2_3 = {sonuc16bit3,Remainder3[17],1'b1};
                ASIN1_3 = {Remainder3[15:0], sayiTemp3[31:30]};
                sayiTemp3 = {sayiTemp3[29:0], 2'b0}; 
                if (Remainder3[17]== 0) begin
                    Remainder3 = ASIN1_3-ASIN2_3;
                end
                else begin
                    Remainder3 = ASIN1_3+ASIN2_3;
                end
                sonuc16bit3 = {sonuc16bit3[14:0], ~Remainder3[17]};
                
                ASIN2_4 = {sonuc16bit4,Remainder4[17],1'b1};
                ASIN1_4 = {Remainder4[15:0], sayiTemp4[31:30]};
                sayiTemp4 = {sayiTemp4[29:0], 2'b0}; 
                if (Remainder4[17]== 0) begin
                    Remainder4 = ASIN1_4-ASIN2_4;
                end
                else begin
                    Remainder4 = ASIN1_4+ASIN2_4;
                end
                sonuc16bit4 = {sonuc16bit4[14:0], ~Remainder4[17]};
                
      
                ASIN2_5 = {sonuc16bit5,Remainder5[17],1'b1};
                ASIN1_5 = {Remainder5[15:0], sayiTemp5[31:30]};
                sayiTemp5 = {sayiTemp5[29:0], 2'b0}; 
                if (Remainder5[17]== 0) begin
                    Remainder5 = ASIN1_5-ASIN2_5;
                end
                else begin
                    Remainder5 = ASIN1_5+ASIN2_5;
                end
                sonuc16bit5 = {sonuc16bit5[14:0], ~Remainder5[17]};
                
      
                ASIN2_6 = {sonuc16bit6,Remainder6[17],1'b1};
                ASIN1_6 = {Remainder6[15:0], sayiTemp6[31:30]};
                sayiTemp6 = {sayiTemp6[29:0], 2'b0}; 
                if (Remainder6[17]== 0) begin
                    Remainder6 = ASIN1_6-ASIN2_6;
                end
                else begin
                    Remainder6 = ASIN1_6+ASIN2_6;
                end
                sonuc16bit6 = {sonuc16bit6[14:0], ~Remainder6[17]};
             
                
                if(sayac7==15)begin
                sayac_next7=0;
                ASIN2_7 = {sonuc16bit7,Remainder7[17],1'b1};
                ASIN1_7 = {Remainder7[15:0], sayiTemp7[31:30]};
                sayiTemp7 = {sayiTemp7[29:0], 2'b0}; 
                if (Remainder7[17]== 0) begin
                    Remainder7 = ASIN1_7-ASIN2_7;
                end
                else begin
                    Remainder7 = ASIN1_7+ASIN2_7;
                end
                sonuc16bit7 = {sonuc16bit7[14:0], ~Remainder7[17]};
                ASIN1_7 = 0;
                ASIN2_7 = 0;
                Remainder7 = 0;
                gecerli=1;   
               sonuc={24'b0,sonuc16bit7,24'b0};
                sonuc16bit7 = 0;
                end
                
                if(sayac8==14)begin
                sayac_next8=15;
                 ASIN2_8 = {sonuc16bit8,Remainder8[17],1'b1};
                ASIN1_8 = {Remainder8[15:0], sayiTemp8[31:30]};
                sayiTemp8 = {sayiTemp8[29:0], 2'b0}; 
                if (Remainder8[17]== 0) begin
                    Remainder8 = ASIN1_8-ASIN2_8;
                end
                else begin
                    Remainder8 = ASIN1_8+ASIN2_8;
                end
                sonuc16bit8 = {sonuc16bit8[14:0], ~Remainder8[17]};
                end
                
                if(sayac9==13)begin
                sayac_next9=14;
                ASIN2_9 = {sonuc16bit9,Remainder9[17],1'b1};
                ASIN1_9 = {Remainder9[15:0], sayiTemp9[31:30]};
                sayiTemp9 = {sayiTemp9[29:0], 2'b0}; 
                if (Remainder9[17]== 0) begin
                    Remainder9 = ASIN1_9-ASIN2_9;
                end
                else begin
                    Remainder9 = ASIN1_9+ASIN2_9;
                end
                sonuc16bit9 = {sonuc16bit9[14:0], ~Remainder9[17]};
                end
                
                if(sayac10==12)begin
                sayac_next10=13;
                 ASIN2_10= {sonuc16bit10,Remainder10[17],1'b1};
                ASIN1_10 = {Remainder10[15:0], sayiTemp10[31:30]};
                sayiTemp10 = {sayiTemp10[29:0], 2'b0}; 
                if (Remainder10[17]== 0) begin
                    Remainder10 = ASIN1_10-ASIN2_10;
                end
                else begin
                    Remainder10 = ASIN1_10+ASIN2_10;
                end
                sonuc16bit10 = {sonuc16bit10[14:0], ~Remainder10[17]};
                end
                
                 if(sayac11==11)begin
                 sayac_next11=12;
                ASIN2_11= {sonuc16bit11,Remainder11[17],1'b1};
                ASIN1_11 = {Remainder11[15:0], sayiTemp11[31:30]};
                sayiTemp11 = {sayiTemp11[29:0], 2'b0}; 
                if (Remainder11[17]== 0) begin
                    Remainder11 = ASIN1_11-ASIN2_11;
                end
                else begin
                    Remainder11 = ASIN1_11+ASIN2_11;
                end
                sonuc16bit11 = {sonuc16bit11[14:0], ~Remainder11[17]};
                end
                
                 if(sayac12==10)begin
                 sayac_next12=11;
                ASIN2_12= {sonuc16bit12,Remainder12[17],1'b1};
                ASIN1_12 = {Remainder12[15:0], sayiTemp12[31:30]};
                sayiTemp12 = {sayiTemp12[29:0], 2'b0}; 
                if (Remainder12[17]== 0) begin
                    Remainder12 = ASIN1_12-ASIN2_12;
                end
                else begin
                    Remainder12 = ASIN1_12+ASIN2_12;
                end
                sonuc16bit12 = {sonuc16bit12[14:0], ~Remainder12[17]};
                end
                
                 if(sayac13==9)begin 
                 sayac_next13=10;               
                ASIN2_13= {sonuc16bit13,Remainder13[17],1'b1};
                ASIN1_13 = {Remainder13[15:0], sayiTemp13[31:30]};
                sayiTemp13 = {sayiTemp13[29:0], 2'b0}; 
                if (Remainder13[17]== 0) begin
                    Remainder13 = ASIN1_13-ASIN2_13;
                end
                else begin
                    Remainder13 = ASIN1_13+ASIN2_13;
                end
                sonuc16bit13 = {sonuc16bit13[14:0], ~Remainder13[17]};
                end
                
                 if(sayac14==8)begin
                 sayac_next14=9;
                ASIN2_14= {sonuc16bit14,Remainder14[17],1'b1};
                ASIN1_14 = {Remainder14[15:0], sayiTemp14[31:30]};
                sayiTemp14 = {sayiTemp14[29:0], 2'b0}; 
                if (Remainder14[17]== 0) begin
                    Remainder14 = ASIN1_14-ASIN2_14;
                end
                else begin
                    Remainder14 = ASIN1_14+ASIN2_14;
                end
                sonuc16bit14 = {sonuc16bit14[14:0], ~Remainder14[17]};
                end
                
                 if(sayac15==7)begin
                 sayac_next15=8;
                ASIN2_15= {sonuc16bit15,Remainder15[17],1'b1};
                ASIN1_15 = {Remainder15[15:0], sayiTemp15[31:30]};
                sayiTemp15 = {sayiTemp15[29:0], 2'b0}; 
                if (Remainder15[17]== 0) begin
                    Remainder15 = ASIN1_15-ASIN2_15;
                end
                else begin
                    Remainder15 = ASIN1_15+ASIN2_15;
                end
                sonuc16bit15 = {sonuc16bit15[14:0], ~Remainder15[17]};
                end
            end  
            
            
            if(sayacIN == 7) begin  
            sayacIN_next=8;
            
            sayac_next0=8;
            sayac_next1=7;
            sayac_next2=6;
            sayac_next3=5;
            sayac_next4=4;
            sayac_next5=3;
            sayac_next6=2;
            sayac_next7=1;
                sayiTemp7 = sayilar[7];  
                ASIN2_2 = {sonuc16bit2,Remainder2[17],1'b1};
                ASIN1_2 = {Remainder2[15:0], sayiTemp2[31:30]};
                sayiTemp2 = {sayiTemp2[29:0], 2'b0}; 
                if (Remainder2[17]== 0) begin
                    Remainder2 = ASIN1_2-ASIN2_2;
                end
                else begin
                    Remainder2 = ASIN1_2+ASIN2_2;
                end
                sonuc16bit2 = {sonuc16bit2[14:0], ~Remainder2[17]};
                
                ASIN2_1 = {sonuc16bit1,Remainder1[17],1'b1};
                ASIN1_1 = {Remainder1[15:0], sayiTemp1[31:30]};
                sayiTemp1 = {sayiTemp1[29:0], 2'b0}; 
                if (Remainder1[17]== 0) begin
                    Remainder1 = ASIN1_1-ASIN2_1;
                end
                else begin
                    Remainder1 = ASIN1_1+ASIN2_1;
                end
                sonuc16bit1 = {sonuc16bit1[14:0], ~Remainder1[17]};
                
                ASIN2_0 = {sonuc16bit0,Remainder0[17],1'b1};
                ASIN1_0 = {Remainder0[15:0], sayiTemp0[31:30]};
                sayiTemp0 = {sayiTemp0[29:0], 2'b0}; 
                if (Remainder0[17]== 0) begin
                    Remainder0 = ASIN1_0-ASIN2_0;
                end
                else begin
                    Remainder0 = ASIN1_0+ASIN2_0;
                end
                sonuc16bit0 = {sonuc16bit0[14:0], ~Remainder0[17]};

                ASIN2_3 = {sonuc16bit3,Remainder3[17],1'b1};
                ASIN1_3 = {Remainder3[15:0], sayiTemp3[31:30]};
                sayiTemp3 = {sayiTemp3[29:0], 2'b0}; 
                if (Remainder3[17]== 0) begin
                    Remainder3 = ASIN1_3-ASIN2_3;
                end
                else begin
                    Remainder3 = ASIN1_3+ASIN2_3;
                end
                sonuc16bit3 = {sonuc16bit3[14:0], ~Remainder3[17]};
                
                ASIN2_4 = {sonuc16bit4,Remainder4[17],1'b1};
                ASIN1_4 = {Remainder4[15:0], sayiTemp4[31:30]};
                sayiTemp4 = {sayiTemp4[29:0], 2'b0}; 
                if (Remainder4[17]== 0) begin
                    Remainder4 = ASIN1_4-ASIN2_4;
                end
                else begin
                    Remainder4 = ASIN1_4+ASIN2_4;
                end
                sonuc16bit4 = {sonuc16bit4[14:0], ~Remainder4[17]};
                
      
                ASIN2_5 = {sonuc16bit5,Remainder5[17],1'b1};
                ASIN1_5 = {Remainder5[15:0], sayiTemp5[31:30]};
                sayiTemp5 = {sayiTemp5[29:0], 2'b0}; 
                if (Remainder5[17]== 0) begin
                    Remainder5 = ASIN1_5-ASIN2_5;
                end
                else begin
                    Remainder5 = ASIN1_5+ASIN2_5;
                end
                sonuc16bit5 = {sonuc16bit5[14:0], ~Remainder5[17]};
                
      
                ASIN2_6 = {sonuc16bit6,Remainder6[17],1'b1};
                ASIN1_6 = {Remainder6[15:0], sayiTemp6[31:30]};
                sayiTemp6 = {sayiTemp6[29:0], 2'b0}; 
                if (Remainder6[17]== 0) begin
                    Remainder6 = ASIN1_6-ASIN2_6;
                end
                else begin
                    Remainder6 = ASIN1_6+ASIN2_6;
                end
                sonuc16bit6 = {sonuc16bit6[14:0], ~Remainder6[17]};
             
       
                ASIN2_7 = {sonuc16bit7,Remainder7[17],1'b1};
                ASIN1_7 = {Remainder7[15:0], sayiTemp7[31:30]};
                sayiTemp7 = {sayiTemp7[29:0], 2'b0}; 
                if (Remainder7[17]== 0) begin
                    Remainder7 = ASIN1_7-ASIN2_7;
                end
                else begin
                    Remainder7 = ASIN1_7+ASIN2_7;
                end
                sonuc16bit7 = {sonuc16bit7[14:0], ~Remainder7[17]};
                
                
                if(sayac8==15)begin
                sayac_next8=0;
                 ASIN2_8 = {sonuc16bit8,Remainder8[17],1'b1};
                ASIN1_8 = {Remainder8[15:0], sayiTemp8[31:30]};
                sayiTemp8 = {sayiTemp8[29:0], 2'b0}; 
                if (Remainder8[17]== 0) begin
                    Remainder8 = ASIN1_8-ASIN2_8;
                end
                else begin
                    Remainder8 = ASIN1_8+ASIN2_8;
                end
                sonuc16bit8 = {sonuc16bit8[14:0], ~Remainder8[17]};
                ASIN1_8 = 0;
                ASIN2_8 = 0;
                Remainder8 = 0;
                gecerli=1;         
               sonuc={24'b0,sonuc16bit8,24'b0};
                sonuc16bit8 = 0;
                end
                
                if(sayac9==14)begin
                sayac_next9=15;
                ASIN2_9 = {sonuc16bit9,Remainder9[17],1'b1};
                ASIN1_9 = {Remainder9[15:0], sayiTemp9[31:30]};
                sayiTemp9 = {sayiTemp9[29:0], 2'b0}; 
                if (Remainder9[17]== 0) begin
                    Remainder9 = ASIN1_9-ASIN2_9;
                end
                else begin
                    Remainder9 = ASIN1_9+ASIN2_9;
                end
                sonuc16bit9 = {sonuc16bit9[14:0], ~Remainder9[17]};
                end
                
                if(sayac10==13)begin
                sayac_next10=14;
                 ASIN2_10= {sonuc16bit10,Remainder10[17],1'b1};
                ASIN1_10 = {Remainder10[15:0], sayiTemp10[31:30]};
                sayiTemp10 = {sayiTemp10[29:0], 2'b0}; 
                if (Remainder10[17]== 0) begin
                    Remainder10 = ASIN1_10-ASIN2_10;
                end
                else begin
                    Remainder10 = ASIN1_10+ASIN2_10;
                end
                sonuc16bit10 = {sonuc16bit10[14:0], ~Remainder10[17]};
                end
                
                 if(sayac11==12)begin
                 sayac_next11=13;
                ASIN2_11= {sonuc16bit11,Remainder11[17],1'b1};
                ASIN1_11 = {Remainder11[15:0], sayiTemp11[31:30]};
                sayiTemp11 = {sayiTemp11[29:0], 2'b0}; 
                if (Remainder11[17]== 0) begin
                    Remainder11 = ASIN1_11-ASIN2_11;
                end
                else begin
                    Remainder11 = ASIN1_11+ASIN2_11;
                end
                sonuc16bit11 = {sonuc16bit11[14:0], ~Remainder11[17]};
                end
                
                 if(sayac12==11)begin
                 sayac_next12=12;
                ASIN2_12= {sonuc16bit12,Remainder12[17],1'b1};
                ASIN1_12 = {Remainder12[15:0], sayiTemp12[31:30]};
                sayiTemp12 = {sayiTemp12[29:0], 2'b0}; 
                if (Remainder12[17]== 0) begin
                    Remainder12 = ASIN1_12-ASIN2_12;
                end
                else begin
                    Remainder12 = ASIN1_12+ASIN2_12;
                end
                sonuc16bit12 = {sonuc16bit12[14:0], ~Remainder12[17]};
                end
                
                 if(sayac13==10)begin   
                       sayac_next13=11;       
                ASIN2_13= {sonuc16bit13,Remainder13[17],1'b1};
                ASIN1_13 = {Remainder13[15:0], sayiTemp13[31:30]};
                sayiTemp13 = {sayiTemp13[29:0], 2'b0}; 
                if (Remainder13[17]== 0) begin
                    Remainder13 = ASIN1_13-ASIN2_13;
                end
                else begin
                    Remainder13 = ASIN1_13+ASIN2_13;
                end
                sonuc16bit13 = {sonuc16bit13[14:0], ~Remainder13[17]};
                end
                
                 if(sayac14==9)begin
                 sayac_next14=10;
                ASIN2_14= {sonuc16bit14,Remainder14[17],1'b1};
                ASIN1_14 = {Remainder14[15:0], sayiTemp14[31:30]};
                sayiTemp14 = {sayiTemp14[29:0], 2'b0}; 
                if (Remainder14[17]== 0) begin
                    Remainder14 = ASIN1_14-ASIN2_14;
                end
                else begin
                    Remainder14 = ASIN1_14+ASIN2_14;
                end
                sonuc16bit14 = {sonuc16bit14[14:0], ~Remainder14[17]};
                end
                
                 if(sayac15==8)begin
                 sayac_next15=9;
                ASIN2_15= {sonuc16bit15,Remainder15[17],1'b1};
                ASIN1_15 = {Remainder15[15:0], sayiTemp15[31:30]};
                sayiTemp15 = {sayiTemp15[29:0], 2'b0}; 
                if (Remainder15[17]== 0) begin
                    Remainder15 = ASIN1_15-ASIN2_15;
                end
                else begin
                    Remainder15 = ASIN1_15+ASIN2_15;
                end
                sonuc16bit15 = {sonuc16bit15[14:0], ~Remainder15[17]};
                end
            end  
            
            
            
            if(sayacIN == 8) begin  
            sayacIN_next=9;
            sayac_next0=9;
            sayac_next1=8;
            sayac_next2=7;
            sayac_next3=6;
            sayac_next4=5;
            sayac_next5=4;
            sayac_next6=3;
            sayac_next7=2;
            sayac_next8=1;
                sayiTemp8 = sayilar[8];  
                ASIN2_2 = {sonuc16bit2,Remainder2[17],1'b1};
                ASIN1_2 = {Remainder2[15:0], sayiTemp2[31:30]};
                sayiTemp2 = {sayiTemp2[29:0], 2'b0}; 
                if (Remainder2[17]== 0) begin
                    Remainder2 = ASIN1_2-ASIN2_2;
                end
                else begin
                    Remainder2 = ASIN1_2+ASIN2_2;
                end
                sonuc16bit2 = {sonuc16bit2[14:0], ~Remainder2[17]};
                
                ASIN2_1 = {sonuc16bit1,Remainder1[17],1'b1};
                ASIN1_1 = {Remainder1[15:0], sayiTemp1[31:30]};
                sayiTemp1 = {sayiTemp1[29:0], 2'b0}; 
                if (Remainder1[17]== 0) begin
                    Remainder1 = ASIN1_1-ASIN2_1;
                end
                else begin
                    Remainder1 = ASIN1_1+ASIN2_1;
                end
                sonuc16bit1 = {sonuc16bit1[14:0], ~Remainder1[17]};
                
                ASIN2_0 = {sonuc16bit0,Remainder0[17],1'b1};
                ASIN1_0 = {Remainder0[15:0], sayiTemp0[31:30]};
                sayiTemp0 = {sayiTemp0[29:0], 2'b0}; 
                if (Remainder0[17]== 0) begin
                    Remainder0 = ASIN1_0-ASIN2_0;
                end
                else begin
                    Remainder0 = ASIN1_0+ASIN2_0;
                end
                sonuc16bit0 = {sonuc16bit0[14:0], ~Remainder0[17]};

                ASIN2_3 = {sonuc16bit3,Remainder3[17],1'b1};
                ASIN1_3 = {Remainder3[15:0], sayiTemp3[31:30]};
                sayiTemp3 = {sayiTemp3[29:0], 2'b0}; 
                if (Remainder3[17]== 0) begin
                    Remainder3 = ASIN1_3-ASIN2_3;
                end
                else begin
                    Remainder3 = ASIN1_3+ASIN2_3;
                end
                sonuc16bit3 = {sonuc16bit3[14:0], ~Remainder3[17]};
                
                ASIN2_4 = {sonuc16bit4,Remainder4[17],1'b1};
                ASIN1_4 = {Remainder4[15:0], sayiTemp4[31:30]};
                sayiTemp4 = {sayiTemp4[29:0], 2'b0}; 
                if (Remainder4[17]== 0) begin
                    Remainder4 = ASIN1_4-ASIN2_4;
                end
                else begin
                    Remainder4 = ASIN1_4+ASIN2_4;
                end
                sonuc16bit4 = {sonuc16bit4[14:0], ~Remainder4[17]};
                
      
                ASIN2_5 = {sonuc16bit5,Remainder5[17],1'b1};
                ASIN1_5 = {Remainder5[15:0], sayiTemp5[31:30]};
                sayiTemp5 = {sayiTemp5[29:0], 2'b0}; 
                if (Remainder5[17]== 0) begin
                    Remainder5 = ASIN1_5-ASIN2_5;
                end
                else begin
                    Remainder5 = ASIN1_5+ASIN2_5;
                end
                sonuc16bit5 = {sonuc16bit5[14:0], ~Remainder5[17]};
                
      
                ASIN2_6 = {sonuc16bit6,Remainder6[17],1'b1};
                ASIN1_6 = {Remainder6[15:0], sayiTemp6[31:30]};
                sayiTemp6 = {sayiTemp6[29:0], 2'b0}; 
                if (Remainder6[17]== 0) begin
                    Remainder6 = ASIN1_6-ASIN2_6;
                end
                else begin
                    Remainder6 = ASIN1_6+ASIN2_6;
                end
                sonuc16bit6 = {sonuc16bit6[14:0], ~Remainder6[17]};
             
       
                ASIN2_7 = {sonuc16bit7,Remainder7[17],1'b1};
                ASIN1_7 = {Remainder7[15:0], sayiTemp7[31:30]};
                sayiTemp7 = {sayiTemp7[29:0], 2'b0}; 
                if (Remainder7[17]== 0) begin
                    Remainder7 = ASIN1_7-ASIN2_7;
                end
                else begin
                    Remainder7 = ASIN1_7+ASIN2_7;
                end
                sonuc16bit7 = {sonuc16bit7[14:0], ~Remainder7[17]};
                
                 
                 ASIN2_8 = {sonuc16bit8,Remainder8[17],1'b1};
                ASIN1_8 = {Remainder8[15:0], sayiTemp8[31:30]};
                sayiTemp8 = {sayiTemp8[29:0], 2'b0}; 
                if (Remainder8[17]== 0) begin
                    Remainder8 = ASIN1_8-ASIN2_8;
                end
                else begin
                    Remainder8 = ASIN1_8+ASIN2_8;
                end
                sonuc16bit8 = {sonuc16bit8[14:0], ~Remainder8[17]};
           
                
                if(sayac9==15)begin
                sayac_next9=0;
                ASIN2_9 = {sonuc16bit9,Remainder9[17],1'b1};
                ASIN1_9 = {Remainder9[15:0], sayiTemp9[31:30]};
                sayiTemp9 = {sayiTemp9[29:0], 2'b0}; 
                if (Remainder9[17]== 0) begin
                    Remainder9 = ASIN1_9-ASIN2_9;
                end
                else begin
                    Remainder9 = ASIN1_9+ASIN2_9;
                end
                sonuc16bit9 = {sonuc16bit9[14:0], ~Remainder9[17]};
                ASIN1_9 = 0;
                ASIN2_9 = 0;
                Remainder9 = 0;
                gecerli=1;         
               sonuc={24'b0,sonuc16bit9,24'b0};
                sonuc16bit9 = 0;
                end
                
                if(sayac10==14)begin
                sayac_next10=15;
                 ASIN2_10= {sonuc16bit10,Remainder10[17],1'b1};
                ASIN1_10 = {Remainder10[15:0], sayiTemp10[31:30]};
                sayiTemp10 = {sayiTemp10[29:0], 2'b0}; 
                if (Remainder10[17]== 0) begin
                    Remainder10 = ASIN1_10-ASIN2_10;
                end
                else begin
                    Remainder10 = ASIN1_10+ASIN2_10;
                end
                sonuc16bit10 = {sonuc16bit10[14:0], ~Remainder10[17]};
                end
                
                 if(sayac11==13)begin
                 sayac_next11=14;
                ASIN2_11= {sonuc16bit11,Remainder11[17],1'b1};
                ASIN1_11 = {Remainder11[15:0], sayiTemp11[31:30]};
                sayiTemp11 = {sayiTemp11[29:0], 2'b0}; 
                if (Remainder11[17]== 0) begin
                    Remainder11 = ASIN1_11-ASIN2_11;
                end
                else begin
                    Remainder11 = ASIN1_11+ASIN2_11;
                end
                sonuc16bit11 = {sonuc16bit11[14:0], ~Remainder11[17]};
                end
                
                 if(sayac12==12)begin
                 sayac_next12=13;
                ASIN2_12= {sonuc16bit12,Remainder12[17],1'b1};
                ASIN1_12 = {Remainder12[15:0], sayiTemp12[31:30]};
                sayiTemp12 = {sayiTemp12[29:0], 2'b0}; 
                if (Remainder12[17]== 0) begin
                    Remainder12 = ASIN1_12-ASIN2_12;
                end
                else begin
                    Remainder12 = ASIN1_12+ASIN2_12;
                end
                sonuc16bit12 = {sonuc16bit12[14:0], ~Remainder12[17]};
                end
                
                 if(sayac13==11)begin     
                 sayac_next13=12;           
                ASIN2_13= {sonuc16bit13,Remainder13[17],1'b1};
                ASIN1_13 = {Remainder13[15:0], sayiTemp13[31:30]};
                sayiTemp13 = {sayiTemp13[29:0], 2'b0}; 
                if (Remainder13[17]== 0) begin
                    Remainder13 = ASIN1_13-ASIN2_13;
                end
                else begin
                    Remainder13 = ASIN1_13+ASIN2_13;
                end
                sonuc16bit13 = {sonuc16bit13[14:0], ~Remainder13[17]};
                end
                
                 if(sayac14==10)begin
                 sayac_next14=11;
                ASIN2_14= {sonuc16bit14,Remainder14[17],1'b1};
                ASIN1_14 = {Remainder14[15:0], sayiTemp14[31:30]};
                sayiTemp14 = {sayiTemp14[29:0], 2'b0}; 
                if (Remainder14[17]== 0) begin
                    Remainder14 = ASIN1_14-ASIN2_14;
                end
                else begin
                    Remainder14 = ASIN1_14+ASIN2_14;
                end
                sonuc16bit14 = {sonuc16bit14[14:0], ~Remainder14[17]};
                end
                
                 if(sayac15==9)begin
                 sayac_next15=10;
                ASIN2_15= {sonuc16bit15,Remainder15[17],1'b1};
                ASIN1_15 = {Remainder15[15:0], sayiTemp15[31:30]};
                sayiTemp15 = {sayiTemp15[29:0], 2'b0}; 
                if (Remainder15[17]== 0) begin
                    Remainder15 = ASIN1_15-ASIN2_15;
                end
                else begin
                    Remainder15 = ASIN1_15+ASIN2_15;
                end
                sonuc16bit15 = {sonuc16bit15[14:0], ~Remainder15[17]};
                end
            end  
            
            
            
            if(sayacIN == 9) begin 
            sayacIN_next=10; 
            sayac_next0=10;
            sayac_next1=9;
            sayac_next2=8;
            sayac_next3=7;
            sayac_next4=6;
            sayac_next5=5;
            sayac_next6=4;
            sayac_next7=3;
            sayac_next8=2;
            sayac_next9=1;
                sayiTemp9 = sayilar[9];  
                ASIN2_2 = {sonuc16bit2,Remainder2[17],1'b1};
                ASIN1_2 = {Remainder2[15:0], sayiTemp2[31:30]};
                sayiTemp2 = {sayiTemp2[29:0], 2'b0}; 
                if (Remainder2[17]== 0) begin
                    Remainder2 = ASIN1_2-ASIN2_2;
                end
                else begin
                    Remainder2 = ASIN1_2+ASIN2_2;
                end
                sonuc16bit2 = {sonuc16bit2[14:0], ~Remainder2[17]};
                
                ASIN2_1 = {sonuc16bit1,Remainder1[17],1'b1};
                ASIN1_1 = {Remainder1[15:0], sayiTemp1[31:30]};
                sayiTemp1 = {sayiTemp1[29:0], 2'b0}; 
                if (Remainder1[17]== 0) begin
                    Remainder1 = ASIN1_1-ASIN2_1;
                end
                else begin
                    Remainder1 = ASIN1_1+ASIN2_1;
                end
                sonuc16bit1 = {sonuc16bit1[14:0], ~Remainder1[17]};
                
                ASIN2_0 = {sonuc16bit0,Remainder0[17],1'b1};
                ASIN1_0 = {Remainder0[15:0], sayiTemp0[31:30]};
                sayiTemp0 = {sayiTemp0[29:0], 2'b0}; 
                if (Remainder0[17]== 0) begin
                    Remainder0 = ASIN1_0-ASIN2_0;
                end
                else begin
                    Remainder0 = ASIN1_0+ASIN2_0;
                end
                sonuc16bit0 = {sonuc16bit0[14:0], ~Remainder0[17]};

                ASIN2_3 = {sonuc16bit3,Remainder3[17],1'b1};
                ASIN1_3 = {Remainder3[15:0], sayiTemp3[31:30]};
                sayiTemp3 = {sayiTemp3[29:0], 2'b0}; 
                if (Remainder3[17]== 0) begin
                    Remainder3 = ASIN1_3-ASIN2_3;
                end
                else begin
                    Remainder3 = ASIN1_3+ASIN2_3;
                end
                sonuc16bit3 = {sonuc16bit3[14:0], ~Remainder3[17]};
                
                ASIN2_4 = {sonuc16bit4,Remainder4[17],1'b1};
                ASIN1_4 = {Remainder4[15:0], sayiTemp4[31:30]};
                sayiTemp4 = {sayiTemp4[29:0], 2'b0}; 
                if (Remainder4[17]== 0) begin
                    Remainder4 = ASIN1_4-ASIN2_4;
                end
                else begin
                    Remainder4 = ASIN1_4+ASIN2_4;
                end
                sonuc16bit4 = {sonuc16bit4[14:0], ~Remainder4[17]};
                
      
                ASIN2_5 = {sonuc16bit5,Remainder5[17],1'b1};
                ASIN1_5 = {Remainder5[15:0], sayiTemp5[31:30]};
                sayiTemp5 = {sayiTemp5[29:0], 2'b0}; 
                if (Remainder5[17]== 0) begin
                    Remainder5 = ASIN1_5-ASIN2_5;
                end
                else begin
                    Remainder5 = ASIN1_5+ASIN2_5;
                end
                sonuc16bit5 = {sonuc16bit5[14:0], ~Remainder5[17]};
                
      
                ASIN2_6 = {sonuc16bit6,Remainder6[17],1'b1};
                ASIN1_6 = {Remainder6[15:0], sayiTemp6[31:30]};
                sayiTemp6 = {sayiTemp6[29:0], 2'b0}; 
                if (Remainder6[17]== 0) begin
                    Remainder6 = ASIN1_6-ASIN2_6;
                end
                else begin
                    Remainder6 = ASIN1_6+ASIN2_6;
                end
                sonuc16bit6 = {sonuc16bit6[14:0], ~Remainder6[17]};
             
       
                ASIN2_7 = {sonuc16bit7,Remainder7[17],1'b1};
                ASIN1_7 = {Remainder7[15:0], sayiTemp7[31:30]};
                sayiTemp7 = {sayiTemp7[29:0], 2'b0}; 
                if (Remainder7[17]== 0) begin
                    Remainder7 = ASIN1_7-ASIN2_7;
                end
                else begin
                    Remainder7 = ASIN1_7+ASIN2_7;
                end
                sonuc16bit7 = {sonuc16bit7[14:0], ~Remainder7[17]};
                
                 
                 ASIN2_8 = {sonuc16bit8,Remainder8[17],1'b1};
                ASIN1_8 = {Remainder8[15:0], sayiTemp8[31:30]};
                sayiTemp8 = {sayiTemp8[29:0], 2'b0}; 
                if (Remainder8[17]== 0) begin
                    Remainder8 = ASIN1_8-ASIN2_8;
                end
                else begin
                    Remainder8 = ASIN1_8+ASIN2_8;
                end
                sonuc16bit8 = {sonuc16bit8[14:0], ~Remainder8[17]};
           
                
             
                ASIN2_9 = {sonuc16bit9,Remainder9[17],1'b1};
                ASIN1_9 = {Remainder9[15:0], sayiTemp9[31:30]};
                sayiTemp9 = {sayiTemp9[29:0], 2'b0}; 
                if (Remainder9[17]== 0) begin
                    Remainder9 = ASIN1_9-ASIN2_9;
                end
                else begin
                    Remainder9 = ASIN1_9+ASIN2_9;
                end
                sonuc16bit9 = {sonuc16bit9[14:0], ~Remainder9[17]};
        
                
                if(sayac10==15)begin
                sayac_next10=0;
                 ASIN2_10= {sonuc16bit10,Remainder10[17],1'b1};
                ASIN1_10 = {Remainder10[15:0], sayiTemp10[31:30]};
                sayiTemp10 = {sayiTemp10[29:0], 2'b0}; 
                if (Remainder10[17]== 0) begin
                    Remainder10 = ASIN1_10-ASIN2_10;
                end
                else begin
                    Remainder10 = ASIN1_10+ASIN2_10;
                end
                sonuc16bit10 = {sonuc16bit10[14:0], ~Remainder10[17]};
                ASIN1_10 = 0;
                ASIN2_10 = 0;
                Remainder10 = 0;
                gecerli=1;         
               sonuc={24'b0,sonuc16bit10,24'b0};
                sonuc16bit10 = 0;
                end
                
                 if(sayac11==14)begin
                 sayac_next11=15;
                ASIN2_11= {sonuc16bit11,Remainder11[17],1'b1};
                ASIN1_11 = {Remainder11[15:0], sayiTemp11[31:30]};
                sayiTemp11 = {sayiTemp11[29:0], 2'b0}; 
                if (Remainder11[17]== 0) begin
                    Remainder11 = ASIN1_11-ASIN2_11;
                end
                else begin
                    Remainder11 = ASIN1_11+ASIN2_11;
                end
                sonuc16bit11 = {sonuc16bit11[14:0], ~Remainder11[17]};
                end
                
                 if(sayac12==13)begin
                 sayac_next12=14;
                ASIN2_12= {sonuc16bit12,Remainder12[17],1'b1};
                ASIN1_12 = {Remainder12[15:0], sayiTemp12[31:30]};
                sayiTemp12 = {sayiTemp12[29:0], 2'b0}; 
                if (Remainder12[17]== 0) begin
                    Remainder12 = ASIN1_12-ASIN2_12;
                end
                else begin
                    Remainder12 = ASIN1_12+ASIN2_12;
                end
                sonuc16bit12 = {sonuc16bit12[14:0], ~Remainder12[17]};
                end
                
                 if(sayac13==12)begin   
                 sayac_next13=13;             
                ASIN2_13= {sonuc16bit13,Remainder13[17],1'b1};
                ASIN1_13 = {Remainder13[15:0], sayiTemp13[31:30]};
                sayiTemp13 = {sayiTemp13[29:0], 2'b0}; 
                if (Remainder13[17]== 0) begin
                    Remainder13 = ASIN1_13-ASIN2_13;
                end
                else begin
                    Remainder13 = ASIN1_13+ASIN2_13;
                end
                sonuc16bit13 = {sonuc16bit13[14:0], ~Remainder13[17]};
                end
                
                 if(sayac14==11)begin
                 sayac_next14=12;
                ASIN2_14= {sonuc16bit14,Remainder14[17],1'b1};
                ASIN1_14 = {Remainder14[15:0], sayiTemp14[31:30]};
                sayiTemp14 = {sayiTemp14[29:0], 2'b0}; 
                if (Remainder14[17]== 0) begin
                    Remainder14 = ASIN1_14-ASIN2_14;
                end
                else begin
                    Remainder14 = ASIN1_14+ASIN2_14;
                end
                sonuc16bit14 = {sonuc16bit14[14:0], ~Remainder14[17]};
                end
                
                 if(sayac15==10)begin
                 sayac_next15=11;
                ASIN2_15= {sonuc16bit15,Remainder15[17],1'b1};
                ASIN1_15 = {Remainder15[15:0], sayiTemp15[31:30]};
                sayiTemp15 = {sayiTemp15[29:0], 2'b0}; 
                if (Remainder15[17]== 0) begin
                    Remainder15 = ASIN1_15-ASIN2_15;
                end
                else begin
                    Remainder15 = ASIN1_15+ASIN2_15;
                end
                sonuc16bit15 = {sonuc16bit15[14:0], ~Remainder15[17]};
                end
                
            end  
            
            if(sayacIN == 10) begin  
                sayiTemp10 = sayilar[10];  
              sayacIN_next=11;
            sayac_next0=11;
            sayac_next1=10;
            sayac_next2=9;
            sayac_next3=8;
            sayac_next4=7;
            sayac_next5=6;
            sayac_next6=5;
            sayac_next7=4;
            sayac_next8=3;
            sayac_next9=2;
            sayac_next10=1;
                ASIN2_2 = {sonuc16bit2,Remainder2[17],1'b1};
                ASIN1_2 = {Remainder2[15:0], sayiTemp2[31:30]};
                sayiTemp2 = {sayiTemp2[29:0], 2'b0}; 
                if (Remainder2[17]== 0) begin
                    Remainder2 = ASIN1_2-ASIN2_2;
                end
                else begin
                    Remainder2 = ASIN1_2+ASIN2_2;
                end
                sonuc16bit2 = {sonuc16bit2[14:0], ~Remainder2[17]};
                
                ASIN2_1 = {sonuc16bit1,Remainder1[17],1'b1};
                ASIN1_1 = {Remainder1[15:0], sayiTemp1[31:30]};
                sayiTemp1 = {sayiTemp1[29:0], 2'b0}; 
                if (Remainder1[17]== 0) begin
                    Remainder1 = ASIN1_1-ASIN2_1;
                end
                else begin
                    Remainder1 = ASIN1_1+ASIN2_1;
                end
                sonuc16bit1 = {sonuc16bit1[14:0], ~Remainder1[17]};
                
                ASIN2_0 = {sonuc16bit0,Remainder0[17],1'b1};
                ASIN1_0 = {Remainder0[15:0], sayiTemp0[31:30]};
                sayiTemp0 = {sayiTemp0[29:0], 2'b0}; 
                if (Remainder0[17]== 0) begin
                    Remainder0 = ASIN1_0-ASIN2_0;
                end
                else begin
                    Remainder0 = ASIN1_0+ASIN2_0;
                end
                sonuc16bit0 = {sonuc16bit0[14:0], ~Remainder0[17]};

                ASIN2_3 = {sonuc16bit3,Remainder3[17],1'b1};
                ASIN1_3 = {Remainder3[15:0], sayiTemp3[31:30]};
                sayiTemp3 = {sayiTemp3[29:0], 2'b0}; 
                if (Remainder3[17]== 0) begin
                    Remainder3 = ASIN1_3-ASIN2_3;
                end
                else begin
                    Remainder3 = ASIN1_3+ASIN2_3;
                end
                sonuc16bit3 = {sonuc16bit3[14:0], ~Remainder3[17]};
                
                ASIN2_4 = {sonuc16bit4,Remainder4[17],1'b1};
                ASIN1_4 = {Remainder4[15:0], sayiTemp4[31:30]};
                sayiTemp4 = {sayiTemp4[29:0], 2'b0}; 
                if (Remainder4[17]== 0) begin
                    Remainder4 = ASIN1_4-ASIN2_4;
                end
                else begin
                    Remainder4 = ASIN1_4+ASIN2_4;
                end
                sonuc16bit4 = {sonuc16bit4[14:0], ~Remainder4[17]};
                
      
                ASIN2_5 = {sonuc16bit5,Remainder5[17],1'b1};
                ASIN1_5 = {Remainder5[15:0], sayiTemp5[31:30]};
                sayiTemp5 = {sayiTemp5[29:0], 2'b0}; 
                if (Remainder5[17]== 0) begin
                    Remainder5 = ASIN1_5-ASIN2_5;
                end
                else begin
                    Remainder5 = ASIN1_5+ASIN2_5;
                end
                sonuc16bit5 = {sonuc16bit5[14:0], ~Remainder5[17]};
                
      
                ASIN2_6 = {sonuc16bit6,Remainder6[17],1'b1};
                ASIN1_6 = {Remainder6[15:0], sayiTemp6[31:30]};
                sayiTemp6 = {sayiTemp6[29:0], 2'b0}; 
                if (Remainder6[17]== 0) begin
                    Remainder6 = ASIN1_6-ASIN2_6;
                end
                else begin
                    Remainder6 = ASIN1_6+ASIN2_6;
                end
                sonuc16bit6 = {sonuc16bit6[14:0], ~Remainder6[17]};
             
       
                ASIN2_7 = {sonuc16bit7,Remainder7[17],1'b1};
                ASIN1_7 = {Remainder7[15:0], sayiTemp7[31:30]};
                sayiTemp7 = {sayiTemp7[29:0], 2'b0}; 
                if (Remainder7[17]== 0) begin
                    Remainder7 = ASIN1_7-ASIN2_7;
                end
                else begin
                    Remainder7 = ASIN1_7+ASIN2_7;
                end
                sonuc16bit7 = {sonuc16bit7[14:0], ~Remainder7[17]};
                
                 
                 ASIN2_8 = {sonuc16bit8,Remainder8[17],1'b1};
                ASIN1_8 = {Remainder8[15:0], sayiTemp8[31:30]};
                sayiTemp8 = {sayiTemp8[29:0], 2'b0}; 
                if (Remainder8[17]== 0) begin
                    Remainder8 = ASIN1_8-ASIN2_8;
                end
                else begin
                    Remainder8 = ASIN1_8+ASIN2_8;
                end
                sonuc16bit8 = {sonuc16bit8[14:0], ~Remainder8[17]};
           
                
             
                ASIN2_9 = {sonuc16bit9,Remainder9[17],1'b1};
                ASIN1_9 = {Remainder9[15:0], sayiTemp9[31:30]};
                sayiTemp9 = {sayiTemp9[29:0], 2'b0}; 
                if (Remainder9[17]== 0) begin
                    Remainder9 = ASIN1_9-ASIN2_9;
                end
                else begin
                    Remainder9 = ASIN1_9+ASIN2_9;
                end
                sonuc16bit9 = {sonuc16bit9[14:0], ~Remainder9[17]};
        
                 ASIN2_10= {sonuc16bit10,Remainder10[17],1'b1};
                ASIN1_10 = {Remainder10[15:0], sayiTemp10[31:30]};
                sayiTemp10 = {sayiTemp10[29:0], 2'b0}; 
                if (Remainder10[17]== 0) begin
                    Remainder10 = ASIN1_10-ASIN2_10;
                end
                else begin
                    Remainder10 = ASIN1_10+ASIN2_10;
                end
                sonuc16bit10 = {sonuc16bit10[14:0], ~Remainder10[17]};
           
                
                 if(sayac11==15)begin
                 sayac_next11=0;
                ASIN2_11= {sonuc16bit11,Remainder11[17],1'b1};
                ASIN1_11 = {Remainder11[15:0], sayiTemp11[31:30]};
                sayiTemp11 = {sayiTemp11[29:0], 2'b0}; 
                if (Remainder11[17]== 0) begin
                    Remainder11 = ASIN1_11-ASIN2_11;
                end
                else begin
                    Remainder11 = ASIN1_11+ASIN2_11;
                end
                sonuc16bit11 = {sonuc16bit11[14:0], ~Remainder11[17]};
                ASIN1_11 = 0;
                ASIN2_11 = 0;
                Remainder11 = 0;
                gecerli=1;         
                sonuc={24'b0,sonuc16bit11,24'b0};
                sonuc16bit11 = 0;
                end
                
                 if(sayac12==14)begin
                 sayac_next12=15;
                ASIN2_12= {sonuc16bit12,Remainder12[17],1'b1};
                ASIN1_12 = {Remainder12[15:0], sayiTemp12[31:30]};
                sayiTemp12 = {sayiTemp12[29:0], 2'b0}; 
                if (Remainder12[17]== 0) begin
                    Remainder12 = ASIN1_12-ASIN2_12;
                end
                else begin
                    Remainder12 = ASIN1_12+ASIN2_12;
                end
                sonuc16bit12 = {sonuc16bit12[14:0], ~Remainder12[17]};
                end
                
                 if(sayac13==13)begin  
                 sayac_next13=14;              
                ASIN2_13= {sonuc16bit13,Remainder13[17],1'b1};
                ASIN1_13 = {Remainder13[15:0], sayiTemp13[31:30]};
                sayiTemp13 = {sayiTemp13[29:0], 2'b0}; 
                if (Remainder13[17]== 0) begin
                    Remainder13 = ASIN1_13-ASIN2_13;
                end
                else begin
                    Remainder13 = ASIN1_13+ASIN2_13;
                end
                sonuc16bit13 = {sonuc16bit13[14:0], ~Remainder13[17]};
                end
                
                 if(sayac14==12)begin
                 sayac_next14=13;
                ASIN2_14= {sonuc16bit14,Remainder14[17],1'b1};
                ASIN1_14 = {Remainder14[15:0], sayiTemp14[31:30]};
                sayiTemp14 = {sayiTemp14[29:0], 2'b0}; 
                if (Remainder14[17]== 0) begin
                    Remainder14 = ASIN1_14-ASIN2_14;
                end
                else begin
                    Remainder14 = ASIN1_14+ASIN2_14;
                end
                sonuc16bit14 = {sonuc16bit14[14:0], ~Remainder14[17]};
                end
                
                 if(sayac15==11)begin
                 sayac_next15=12;
                ASIN2_15= {sonuc16bit15,Remainder15[17],1'b1};
                ASIN1_15 = {Remainder15[15:0], sayiTemp15[31:30]};
                sayiTemp15 = {sayiTemp15[29:0], 2'b0}; 
                if (Remainder15[17]== 0) begin
                    Remainder15 = ASIN1_15-ASIN2_15;
                end
                else begin
                    Remainder15 = ASIN1_15+ASIN2_15;
                end
                sonuc16bit15 = {sonuc16bit15[14:0], ~Remainder15[17]};
                end
            end  
            
            
            
            if(sayacIN == 11) begin 
            sayacIN_next=12; 
            sayac_next0=12;
            sayac_next1=11;
            sayac_next2=10;
            sayac_next3=9;
            sayac_next4=8;
            sayac_next5=7;
            sayac_next6=6;
            sayac_next7=5;
            sayac_next8=4;
            sayac_next9=3;
            sayac_next10=2;
            sayac_next11=1;
                sayiTemp11 = sayilar[11];  
                 ASIN2_2 = {sonuc16bit2,Remainder2[17],1'b1};
                ASIN1_2 = {Remainder2[15:0], sayiTemp2[31:30]};
                sayiTemp2 = {sayiTemp2[29:0], 2'b0}; 
                if (Remainder2[17]== 0) begin
                    Remainder2 = ASIN1_2-ASIN2_2;
                end
                else begin
                    Remainder2 = ASIN1_2+ASIN2_2;
                end
                sonuc16bit2 = {sonuc16bit2[14:0], ~Remainder2[17]};
                
                ASIN2_1 = {sonuc16bit1,Remainder1[17],1'b1};
                ASIN1_1 = {Remainder1[15:0], sayiTemp1[31:30]};
                sayiTemp1 = {sayiTemp1[29:0], 2'b0}; 
                if (Remainder1[17]== 0) begin
                    Remainder1 = ASIN1_1-ASIN2_1;
                end
                else begin
                    Remainder1 = ASIN1_1+ASIN2_1;
                end
                sonuc16bit1 = {sonuc16bit1[14:0], ~Remainder1[17]};
                
                ASIN2_0 = {sonuc16bit0,Remainder0[17],1'b1};
                ASIN1_0 = {Remainder0[15:0], sayiTemp0[31:30]};
                sayiTemp0 = {sayiTemp0[29:0], 2'b0}; 
                if (Remainder0[17]== 0) begin
                    Remainder0 = ASIN1_0-ASIN2_0;
                end
                else begin
                    Remainder0 = ASIN1_0+ASIN2_0;
                end
                sonuc16bit0 = {sonuc16bit0[14:0], ~Remainder0[17]};

                ASIN2_3 = {sonuc16bit3,Remainder3[17],1'b1};
                ASIN1_3 = {Remainder3[15:0], sayiTemp3[31:30]};
                sayiTemp3 = {sayiTemp3[29:0], 2'b0}; 
                if (Remainder3[17]== 0) begin
                    Remainder3 = ASIN1_3-ASIN2_3;
                end
                else begin
                    Remainder3 = ASIN1_3+ASIN2_3;
                end
                sonuc16bit3 = {sonuc16bit3[14:0], ~Remainder3[17]};
                
                ASIN2_4 = {sonuc16bit4,Remainder4[17],1'b1};
                ASIN1_4 = {Remainder4[15:0], sayiTemp4[31:30]};
                sayiTemp4 = {sayiTemp4[29:0], 2'b0}; 
                if (Remainder4[17]== 0) begin
                    Remainder4 = ASIN1_4-ASIN2_4;
                end
                else begin
                    Remainder4 = ASIN1_4+ASIN2_4;
                end
                sonuc16bit4 = {sonuc16bit4[14:0], ~Remainder4[17]};
                
      
                ASIN2_5 = {sonuc16bit5,Remainder5[17],1'b1};
                ASIN1_5 = {Remainder5[15:0], sayiTemp5[31:30]};
                sayiTemp5 = {sayiTemp5[29:0], 2'b0}; 
                if (Remainder5[17]== 0) begin
                    Remainder5 = ASIN1_5-ASIN2_5;
                end
                else begin
                    Remainder5 = ASIN1_5+ASIN2_5;
                end
                sonuc16bit5 = {sonuc16bit5[14:0], ~Remainder5[17]};
                
      
                ASIN2_6 = {sonuc16bit6,Remainder6[17],1'b1};
                ASIN1_6 = {Remainder6[15:0], sayiTemp6[31:30]};
                sayiTemp6 = {sayiTemp6[29:0], 2'b0}; 
                if (Remainder6[17]== 0) begin
                    Remainder6 = ASIN1_6-ASIN2_6;
                end
                else begin
                    Remainder6 = ASIN1_6+ASIN2_6;
                end
                sonuc16bit6 = {sonuc16bit6[14:0], ~Remainder6[17]};
             
       
                ASIN2_7 = {sonuc16bit7,Remainder7[17],1'b1};
                ASIN1_7 = {Remainder7[15:0], sayiTemp7[31:30]};
                sayiTemp7 = {sayiTemp7[29:0], 2'b0}; 
                if (Remainder7[17]== 0) begin
                    Remainder7 = ASIN1_7-ASIN2_7;
                end
                else begin
                    Remainder7 = ASIN1_7+ASIN2_7;
                end
                sonuc16bit7 = {sonuc16bit7[14:0], ~Remainder7[17]};
                
                 
                 ASIN2_8 = {sonuc16bit8,Remainder8[17],1'b1};
                ASIN1_8 = {Remainder8[15:0], sayiTemp8[31:30]};
                sayiTemp8 = {sayiTemp8[29:0], 2'b0}; 
                if (Remainder8[17]== 0) begin
                    Remainder8 = ASIN1_8-ASIN2_8;
                end
                else begin
                    Remainder8 = ASIN1_8+ASIN2_8;
                end
                sonuc16bit8 = {sonuc16bit8[14:0], ~Remainder8[17]};
           
                
             
                ASIN2_9 = {sonuc16bit9,Remainder9[17],1'b1};
                ASIN1_9 = {Remainder9[15:0], sayiTemp9[31:30]};
                sayiTemp9 = {sayiTemp9[29:0], 2'b0}; 
                if (Remainder9[17]== 0) begin
                    Remainder9 = ASIN1_9-ASIN2_9;
                end
                else begin
                    Remainder9 = ASIN1_9+ASIN2_9;
                end
                sonuc16bit9 = {sonuc16bit9[14:0], ~Remainder9[17]};
        
                 ASIN2_10= {sonuc16bit10,Remainder10[17],1'b1};
                ASIN1_10 = {Remainder10[15:0], sayiTemp10[31:30]};
                sayiTemp10 = {sayiTemp10[29:0], 2'b0}; 
                if (Remainder10[17]== 0) begin
                    Remainder10 = ASIN1_10-ASIN2_10;
                end
                else begin
                    Remainder10 = ASIN1_10+ASIN2_10;
                end
                sonuc16bit10 = {sonuc16bit10[14:0], ~Remainder10[17]};
           
                ASIN2_11= {sonuc16bit11,Remainder11[17],1'b1};
                ASIN1_11 = {Remainder11[15:0], sayiTemp11[31:30]};
                sayiTemp11 = {sayiTemp11[29:0], 2'b0}; 
                if (Remainder11[17]== 0) begin
                    Remainder11 = ASIN1_11-ASIN2_11;
                end
                else begin
                    Remainder11 = ASIN1_11+ASIN2_11;
                end
                sonuc16bit11 = {sonuc16bit11[14:0], ~Remainder11[17]};
            
                
                 if(sayac12==15)begin
                 sayac_next12=0;
                ASIN2_12= {sonuc16bit12,Remainder12[17],1'b1};
                ASIN1_12 = {Remainder12[15:0], sayiTemp12[31:30]};
                sayiTemp12 = {sayiTemp12[29:0], 2'b0}; 
                if (Remainder12[17]== 0) begin
                    Remainder12 = ASIN1_12-ASIN2_12;
                end
                else begin
                    Remainder12 = ASIN1_12+ASIN2_12;
                end
                sonuc16bit12 = {sonuc16bit12[14:0], ~Remainder12[17]};
                ASIN1_12 = 0;
                ASIN2_12 = 0;
                Remainder12 = 0;
                gecerli=1;         
               sonuc={24'b0,sonuc16bit12,24'b0};
                sonuc16bit12 = 0;
                end
                
                 if(sayac13==14)begin    
                 sayac_next13=15;            
                ASIN2_13= {sonuc16bit13,Remainder13[17],1'b1};
                ASIN1_13 = {Remainder13[15:0], sayiTemp13[31:30]};
                sayiTemp13 = {sayiTemp13[29:0], 2'b0}; 
                if (Remainder13[17]== 0) begin
                    Remainder13 = ASIN1_13-ASIN2_13;
                end
                else begin
                    Remainder13 = ASIN1_13+ASIN2_13;
                end
                sonuc16bit13 = {sonuc16bit13[14:0], ~Remainder13[17]};
                end
                
                 if(sayac14==13)begin
                 sayac_next14=14;
                ASIN2_14= {sonuc16bit14,Remainder14[17],1'b1};
                ASIN1_14 = {Remainder14[15:0], sayiTemp14[31:30]};
                sayiTemp14 = {sayiTemp14[29:0], 2'b0}; 
                if (Remainder14[17]== 0) begin
                    Remainder14 = ASIN1_14-ASIN2_14;
                end
                else begin
                    Remainder14 = ASIN1_14+ASIN2_14;
                end
                sonuc16bit14 = {sonuc16bit14[14:0], ~Remainder14[17]};
                end
                
                 if(sayac15==12)begin
                 sayac_next15=13;
                ASIN2_15= {sonuc16bit15,Remainder15[17],1'b1};
                ASIN1_15 = {Remainder15[15:0], sayiTemp15[31:30]};
                sayiTemp15 = {sayiTemp15[29:0], 2'b0}; 
                if (Remainder15[17]== 0) begin
                    Remainder15 = ASIN1_15-ASIN2_15;
                end
                else begin
                    Remainder15 = ASIN1_15+ASIN2_15;
                end
                sonuc16bit15 = {sonuc16bit15[14:0], ~Remainder15[17]};
                end
            end  
            
            
            
            
            
            
            if(sayacIN == 12) begin  
            sayacIN_next=13;
             sayac_next0=13;
            sayac_next1=12;
            sayac_next2=11;
            sayac_next3=10;
            sayac_next4=9;
            sayac_next5=8;
            sayac_next6=7;
            sayac_next7=6;
            sayac_next8=5;
            sayac_next9=4;
            sayac_next10=3;
            sayac_next11=2;
            sayac_next12=1;
                sayiTemp12 = sayilar[12];  
                ASIN2_2 = {sonuc16bit2,Remainder2[17],1'b1};
                ASIN1_2 = {Remainder2[15:0], sayiTemp2[31:30]};
                sayiTemp2 = {sayiTemp2[29:0], 2'b0}; 
                if (Remainder2[17]== 0) begin
                    Remainder2 = ASIN1_2-ASIN2_2;
                end
                else begin
                    Remainder2 = ASIN1_2+ASIN2_2;
                end
                sonuc16bit2 = {sonuc16bit2[14:0], ~Remainder2[17]};
                
                ASIN2_1 = {sonuc16bit1,Remainder1[17],1'b1};
                ASIN1_1 = {Remainder1[15:0], sayiTemp1[31:30]};
                sayiTemp1 = {sayiTemp1[29:0], 2'b0}; 
                if (Remainder1[17]== 0) begin
                    Remainder1 = ASIN1_1-ASIN2_1;
                end
                else begin
                    Remainder1 = ASIN1_1+ASIN2_1;
                end
                sonuc16bit1 = {sonuc16bit1[14:0], ~Remainder1[17]};
                
                ASIN2_0 = {sonuc16bit0,Remainder0[17],1'b1};
                ASIN1_0 = {Remainder0[15:0], sayiTemp0[31:30]};
                sayiTemp0 = {sayiTemp0[29:0], 2'b0}; 
                if (Remainder0[17]== 0) begin
                    Remainder0 = ASIN1_0-ASIN2_0;
                end
                else begin
                    Remainder0 = ASIN1_0+ASIN2_0;
                end
                sonuc16bit0 = {sonuc16bit0[14:0], ~Remainder0[17]};

                ASIN2_3 = {sonuc16bit3,Remainder3[17],1'b1};
                ASIN1_3 = {Remainder3[15:0], sayiTemp3[31:30]};
                sayiTemp3 = {sayiTemp3[29:0], 2'b0}; 
                if (Remainder3[17]== 0) begin
                    Remainder3 = ASIN1_3-ASIN2_3;
                end
                else begin
                    Remainder3 = ASIN1_3+ASIN2_3;
                end
                sonuc16bit3 = {sonuc16bit3[14:0], ~Remainder3[17]};
                
                ASIN2_4 = {sonuc16bit4,Remainder4[17],1'b1};
                ASIN1_4 = {Remainder4[15:0], sayiTemp4[31:30]};
                sayiTemp4 = {sayiTemp4[29:0], 2'b0}; 
                if (Remainder4[17]== 0) begin
                    Remainder4 = ASIN1_4-ASIN2_4;
                end
                else begin
                    Remainder4 = ASIN1_4+ASIN2_4;
                end
                sonuc16bit4 = {sonuc16bit4[14:0], ~Remainder4[17]};
                
      
                ASIN2_5 = {sonuc16bit5,Remainder5[17],1'b1};
                ASIN1_5 = {Remainder5[15:0], sayiTemp5[31:30]};
                sayiTemp5 = {sayiTemp5[29:0], 2'b0}; 
                if (Remainder5[17]== 0) begin
                    Remainder5 = ASIN1_5-ASIN2_5;
                end
                else begin
                    Remainder5 = ASIN1_5+ASIN2_5;
                end
                sonuc16bit5 = {sonuc16bit5[14:0], ~Remainder5[17]};
                
      
                ASIN2_6 = {sonuc16bit6,Remainder6[17],1'b1};
                ASIN1_6 = {Remainder6[15:0], sayiTemp6[31:30]};
                sayiTemp6 = {sayiTemp6[29:0], 2'b0}; 
                if (Remainder6[17]== 0) begin
                    Remainder6 = ASIN1_6-ASIN2_6;
                end
                else begin
                    Remainder6 = ASIN1_6+ASIN2_6;
                end
                sonuc16bit6 = {sonuc16bit6[14:0], ~Remainder6[17]};
             
       
                ASIN2_7 = {sonuc16bit7,Remainder7[17],1'b1};
                ASIN1_7 = {Remainder7[15:0], sayiTemp7[31:30]};
                sayiTemp7 = {sayiTemp7[29:0], 2'b0}; 
                if (Remainder7[17]== 0) begin
                    Remainder7 = ASIN1_7-ASIN2_7;
                end
                else begin
                    Remainder7 = ASIN1_7+ASIN2_7;
                end
                sonuc16bit7 = {sonuc16bit7[14:0], ~Remainder7[17]};
                
                 
                 ASIN2_8 = {sonuc16bit8,Remainder8[17],1'b1};
                ASIN1_8 = {Remainder8[15:0], sayiTemp8[31:30]};
                sayiTemp8 = {sayiTemp8[29:0], 2'b0}; 
                if (Remainder8[17]== 0) begin
                    Remainder8 = ASIN1_8-ASIN2_8;
                end
                else begin
                    Remainder8 = ASIN1_8+ASIN2_8;
                end
                sonuc16bit8 = {sonuc16bit8[14:0], ~Remainder8[17]};
           
                
             
                ASIN2_9 = {sonuc16bit9,Remainder9[17],1'b1};
                ASIN1_9 = {Remainder9[15:0], sayiTemp9[31:30]};
                sayiTemp9 = {sayiTemp9[29:0], 2'b0}; 
                if (Remainder9[17]== 0) begin
                    Remainder9 = ASIN1_9-ASIN2_9;
                end
                else begin
                    Remainder9 = ASIN1_9+ASIN2_9;
                end
                sonuc16bit9 = {sonuc16bit9[14:0], ~Remainder9[17]};
        
                 ASIN2_10= {sonuc16bit10,Remainder10[17],1'b1};
                ASIN1_10 = {Remainder10[15:0], sayiTemp10[31:30]};
                sayiTemp10 = {sayiTemp10[29:0], 2'b0}; 
                if (Remainder10[17]== 0) begin
                    Remainder10 = ASIN1_10-ASIN2_10;
                end
                else begin
                    Remainder10 = ASIN1_10+ASIN2_10;
                end
                sonuc16bit10 = {sonuc16bit10[14:0], ~Remainder10[17]};
           
                ASIN2_11= {sonuc16bit11,Remainder11[17],1'b1};
                ASIN1_11 = {Remainder11[15:0], sayiTemp11[31:30]};
                sayiTemp11 = {sayiTemp11[29:0], 2'b0}; 
                if (Remainder11[17]== 0) begin
                    Remainder11 = ASIN1_11-ASIN2_11;
                end
                else begin
                    Remainder11 = ASIN1_11+ASIN2_11;
                end
                sonuc16bit11 = {sonuc16bit11[14:0], ~Remainder11[17]};
            
 
                ASIN2_12= {sonuc16bit12,Remainder12[17],1'b1};
                ASIN1_12 = {Remainder12[15:0], sayiTemp12[31:30]};
                sayiTemp12 = {sayiTemp12[29:0], 2'b0}; 
                if (Remainder12[17]== 0) begin
                    Remainder12 = ASIN1_12-ASIN2_12;
                end
                else begin
                    Remainder12 = ASIN1_12+ASIN2_12;
                end
                sonuc16bit12 = {sonuc16bit12[14:0], ~Remainder12[17]};
             
                
                 if(sayac13==15)begin 
                 sayac_next13=0;               
                ASIN2_13= {sonuc16bit13,Remainder13[17],1'b1};
                ASIN1_13 = {Remainder13[15:0], sayiTemp13[31:30]};
                sayiTemp13 = {sayiTemp13[29:0], 2'b0}; 
                if (Remainder13[17]== 0) begin
                    Remainder13 = ASIN1_13-ASIN2_13;
                end
                else begin
                    Remainder13 = ASIN1_13+ASIN2_13;
                end
                sonuc16bit13 = {sonuc16bit13[14:0], ~Remainder13[17]};
                ASIN1_13 = 0;
                ASIN2_13 = 0;
                Remainder13 = 0;
                gecerli=1;         
                sonuc={24'b0,sonuc16bit13,24'b0};
                sonuc16bit13 = 0;
                end
                
                 if(sayac14==14)begin
                 sayac_next14=15;
                ASIN2_14= {sonuc16bit14,Remainder14[17],1'b1};
                ASIN1_14 = {Remainder14[15:0], sayiTemp14[31:30]};
                sayiTemp14 = {sayiTemp14[29:0], 2'b0}; 
                if (Remainder14[17]== 0) begin
                    Remainder14 = ASIN1_14-ASIN2_14;
                end
                else begin
                    Remainder14 = ASIN1_14+ASIN2_14;
                end
                sonuc16bit14 = {sonuc16bit14[14:0], ~Remainder14[17]};
                end
                
                 if(sayac15==13)begin
                 sayac_next15=14;
                ASIN2_15= {sonuc16bit15,Remainder15[17],1'b1};
                ASIN1_15 = {Remainder15[15:0], sayiTemp15[31:30]};
                sayiTemp15 = {sayiTemp15[29:0], 2'b0}; 
                if (Remainder15[17]== 0) begin
                    Remainder15 = ASIN1_15-ASIN2_15;
                end
                else begin
                    Remainder15 = ASIN1_15+ASIN2_15;
                end
                sonuc16bit15 = {sonuc16bit15[14:0], ~Remainder15[17]};
                end
            end  
            if(sayacIN == 13) begin  
            sayacIN_next=14;
            sayac_next0=14;
            sayac_next1=13;
            sayac_next2=12;
            sayac_next3=11;
            sayac_next4=10;
            sayac_next5=9;
            sayac_next6=8;
            sayac_next7=7;
            sayac_next8=6;
            sayac_next9=5;
            sayac_next10=4;
            sayac_next11=3;
            sayac_next12=2;
            sayac_next13=1;
                sayiTemp13 = sayilar[13];  
                ASIN2_2 = {sonuc16bit2,Remainder2[17],1'b1};
                ASIN1_2 = {Remainder2[15:0], sayiTemp2[31:30]};
                sayiTemp2 = {sayiTemp2[29:0], 2'b0}; 
                if (Remainder2[17]== 0) begin
                    Remainder2 = ASIN1_2-ASIN2_2;
                end
                else begin
                    Remainder2 = ASIN1_2+ASIN2_2;
                end
                sonuc16bit2 = {sonuc16bit2[14:0], ~Remainder2[17]};
                
                ASIN2_1 = {sonuc16bit1,Remainder1[17],1'b1};
                ASIN1_1 = {Remainder1[15:0], sayiTemp1[31:30]};
                sayiTemp1 = {sayiTemp1[29:0], 2'b0}; 
                if (Remainder1[17]== 0) begin
                    Remainder1 = ASIN1_1-ASIN2_1;
                end
                else begin
                    Remainder1 = ASIN1_1+ASIN2_1;
                end
                sonuc16bit1 = {sonuc16bit1[14:0], ~Remainder1[17]};
                
                ASIN2_0 = {sonuc16bit0,Remainder0[17],1'b1};
                ASIN1_0 = {Remainder0[15:0], sayiTemp0[31:30]};
                sayiTemp0 = {sayiTemp0[29:0], 2'b0}; 
                if (Remainder0[17]== 0) begin
                    Remainder0 = ASIN1_0-ASIN2_0;
                end
                else begin
                    Remainder0 = ASIN1_0+ASIN2_0;
                end
                sonuc16bit0 = {sonuc16bit0[14:0], ~Remainder0[17]};

                ASIN2_3 = {sonuc16bit3,Remainder3[17],1'b1};
                ASIN1_3 = {Remainder3[15:0], sayiTemp3[31:30]};
                sayiTemp3 = {sayiTemp3[29:0], 2'b0}; 
                if (Remainder3[17]== 0) begin
                    Remainder3 = ASIN1_3-ASIN2_3;
                end
                else begin
                    Remainder3 = ASIN1_3+ASIN2_3;
                end
                sonuc16bit3 = {sonuc16bit3[14:0], ~Remainder3[17]};
                
                ASIN2_4 = {sonuc16bit4,Remainder4[17],1'b1};
                ASIN1_4 = {Remainder4[15:0], sayiTemp4[31:30]};
                sayiTemp4 = {sayiTemp4[29:0], 2'b0}; 
                if (Remainder4[17]== 0) begin
                    Remainder4 = ASIN1_4-ASIN2_4;
                end
                else begin
                    Remainder4 = ASIN1_4+ASIN2_4;
                end
                sonuc16bit4 = {sonuc16bit4[14:0], ~Remainder4[17]};
                
      
                ASIN2_5 = {sonuc16bit5,Remainder5[17],1'b1};
                ASIN1_5 = {Remainder5[15:0], sayiTemp5[31:30]};
                sayiTemp5 = {sayiTemp5[29:0], 2'b0}; 
                if (Remainder5[17]== 0) begin
                    Remainder5 = ASIN1_5-ASIN2_5;
                end
                else begin
                    Remainder5 = ASIN1_5+ASIN2_5;
                end
                sonuc16bit5 = {sonuc16bit5[14:0], ~Remainder5[17]};
                
      
                ASIN2_6 = {sonuc16bit6,Remainder6[17],1'b1};
                ASIN1_6 = {Remainder6[15:0], sayiTemp6[31:30]};
                sayiTemp6 = {sayiTemp6[29:0], 2'b0}; 
                if (Remainder6[17]== 0) begin
                    Remainder6 = ASIN1_6-ASIN2_6;
                end
                else begin
                    Remainder6 = ASIN1_6+ASIN2_6;
                end
                sonuc16bit6 = {sonuc16bit6[14:0], ~Remainder6[17]};
             
       
                ASIN2_7 = {sonuc16bit7,Remainder7[17],1'b1};
                ASIN1_7 = {Remainder7[15:0], sayiTemp7[31:30]};
                sayiTemp7 = {sayiTemp7[29:0], 2'b0}; 
                if (Remainder7[17]== 0) begin
                    Remainder7 = ASIN1_7-ASIN2_7;
                end
                else begin
                    Remainder7 = ASIN1_7+ASIN2_7;
                end
                sonuc16bit7 = {sonuc16bit7[14:0], ~Remainder7[17]};
                
                 
                 ASIN2_8 = {sonuc16bit8,Remainder8[17],1'b1};
                ASIN1_8 = {Remainder8[15:0], sayiTemp8[31:30]};
                sayiTemp8 = {sayiTemp8[29:0], 2'b0}; 
                if (Remainder8[17]== 0) begin
                    Remainder8 = ASIN1_8-ASIN2_8;
                end
                else begin
                    Remainder8 = ASIN1_8+ASIN2_8;
                end
                sonuc16bit8 = {sonuc16bit8[14:0], ~Remainder8[17]};
           
                
             
                ASIN2_9 = {sonuc16bit9,Remainder9[17],1'b1};
                ASIN1_9 = {Remainder9[15:0], sayiTemp9[31:30]};
                sayiTemp9 = {sayiTemp9[29:0], 2'b0}; 
                if (Remainder9[17]== 0) begin
                    Remainder9 = ASIN1_9-ASIN2_9;
                end
                else begin
                    Remainder9 = ASIN1_9+ASIN2_9;
                end
                sonuc16bit9 = {sonuc16bit9[14:0], ~Remainder9[17]};
        
                 ASIN2_10= {sonuc16bit10,Remainder10[17],1'b1};
                ASIN1_10 = {Remainder10[15:0], sayiTemp10[31:30]};
                sayiTemp10 = {sayiTemp10[29:0], 2'b0}; 
                if (Remainder10[17]== 0) begin
                    Remainder10 = ASIN1_10-ASIN2_10;
                end
                else begin
                    Remainder10 = ASIN1_10+ASIN2_10;
                end
                sonuc16bit10 = {sonuc16bit10[14:0], ~Remainder10[17]};
           
                ASIN2_11= {sonuc16bit11,Remainder11[17],1'b1};
                ASIN1_11 = {Remainder11[15:0], sayiTemp11[31:30]};
                sayiTemp11 = {sayiTemp11[29:0], 2'b0}; 
                if (Remainder11[17]== 0) begin
                    Remainder11 = ASIN1_11-ASIN2_11;
                end
                else begin
                    Remainder11 = ASIN1_11+ASIN2_11;
                end
                sonuc16bit11 = {sonuc16bit11[14:0], ~Remainder11[17]};
            
 
                ASIN2_12= {sonuc16bit12,Remainder12[17],1'b1};
                ASIN1_12 = {Remainder12[15:0], sayiTemp12[31:30]};
                sayiTemp12 = {sayiTemp12[29:0], 2'b0}; 
                if (Remainder12[17]== 0) begin
                    Remainder12 = ASIN1_12-ASIN2_12;
                end
                else begin
                    Remainder12 = ASIN1_12+ASIN2_12;
                end
                sonuc16bit12 = {sonuc16bit12[14:0], ~Remainder12[17]};
             
                        
                ASIN2_13= {sonuc16bit13,Remainder13[17],1'b1};
                ASIN1_13 = {Remainder13[15:0], sayiTemp13[31:30]};
                sayiTemp13 = {sayiTemp13[29:0], 2'b0}; 
                if (Remainder13[17]== 0) begin
                    Remainder13 = ASIN1_13-ASIN2_13;
                end
                else begin
                    Remainder13 = ASIN1_13+ASIN2_13;
                end
                sonuc16bit13 = {sonuc16bit13[14:0], ~Remainder13[17]};
      
                
                 if(sayac14==15)begin
                 sayac_next14=0;
                ASIN2_14= {sonuc16bit14,Remainder14[17],1'b1};
                ASIN1_14 = {Remainder14[15:0], sayiTemp14[31:30]};
                sayiTemp14 = {sayiTemp14[29:0], 2'b0}; 
                if (Remainder14[17]== 0) begin
                    Remainder14 = ASIN1_14-ASIN2_14;
                end
                else begin
                    Remainder14 = ASIN1_14+ASIN2_14;
                end
                sonuc16bit14 = {sonuc16bit14[14:0], ~Remainder14[17]};
                ASIN1_14 = 0;
                ASIN2_14 = 0;
                Remainder14 = 0;
                gecerli=1;         
                sonuc={24'b0,sonuc16bit14,24'b0};
                sonuc16bit14 = 0;
                end
                
                 if(sayac15==14)begin
                 sayac_next15=15;
                ASIN2_15= {sonuc16bit15,Remainder15[17],1'b1};
                ASIN1_15 = {Remainder15[15:0], sayiTemp15[31:30]};
                sayiTemp15 = {sayiTemp15[29:0], 2'b0}; 
                if (Remainder15[17]== 0) begin
                    Remainder15 = ASIN1_15-ASIN2_15;
                end
                else begin
                    Remainder15 = ASIN1_15+ASIN2_15;
                end
                sonuc16bit15 = {sonuc16bit15[14:0], ~Remainder15[17]};
                end
            end  
            
            
            
            if(sayacIN == 14) begin  
                sayiTemp14 = sayilar[14];  
                sayacIN_next=15;
                sayac_next0=15;
            sayac_next1=14;
            sayac_next2=13;
            sayac_next3=12;
            sayac_next4=11;
            sayac_next5=10;
            sayac_next6=9;
            sayac_next7=8;
            sayac_next8=7;
            sayac_next9=6;
            sayac_next10=5;
            sayac_next11=4;
            sayac_next12=3;
            sayac_next13=2;
            sayac_next14=1;
                ASIN2_2 = {sonuc16bit2,Remainder2[17],1'b1};
                ASIN1_2 = {Remainder2[15:0], sayiTemp2[31:30]};
                sayiTemp2 = {sayiTemp2[29:0], 2'b0}; 
                if (Remainder2[17]== 0) begin
                    Remainder2 = ASIN1_2-ASIN2_2;
                end
                else begin
                    Remainder2 = ASIN1_2+ASIN2_2;
                end
                sonuc16bit2 = {sonuc16bit2[14:0], ~Remainder2[17]};
                
                ASIN2_1 = {sonuc16bit1,Remainder1[17],1'b1};
                ASIN1_1 = {Remainder1[15:0], sayiTemp1[31:30]};
                sayiTemp1 = {sayiTemp1[29:0], 2'b0}; 
                if (Remainder1[17]== 0) begin
                    Remainder1 = ASIN1_1-ASIN2_1;
                end
                else begin
                    Remainder1 = ASIN1_1+ASIN2_1;
                end
                sonuc16bit1 = {sonuc16bit1[14:0], ~Remainder1[17]};
                
                ASIN2_0 = {sonuc16bit0,Remainder0[17],1'b1};
                ASIN1_0 = {Remainder0[15:0], sayiTemp0[31:30]};
                sayiTemp0 = {sayiTemp0[29:0], 2'b0}; 
                if (Remainder0[17]== 0) begin
                    Remainder0 = ASIN1_0-ASIN2_0;
                end
                else begin
                    Remainder0 = ASIN1_0+ASIN2_0;
                end
                sonuc16bit0 = {sonuc16bit0[14:0], ~Remainder0[17]};

                ASIN2_3 = {sonuc16bit3,Remainder3[17],1'b1};
                ASIN1_3 = {Remainder3[15:0], sayiTemp3[31:30]};
                sayiTemp3 = {sayiTemp3[29:0], 2'b0}; 
                if (Remainder3[17]== 0) begin
                    Remainder3 = ASIN1_3-ASIN2_3;
                end
                else begin
                    Remainder3 = ASIN1_3+ASIN2_3;
                end
                sonuc16bit3 = {sonuc16bit3[14:0], ~Remainder3[17]};
                
                ASIN2_4 = {sonuc16bit4,Remainder4[17],1'b1};
                ASIN1_4 = {Remainder4[15:0], sayiTemp4[31:30]};
                sayiTemp4 = {sayiTemp4[29:0], 2'b0}; 
                if (Remainder4[17]== 0) begin
                    Remainder4 = ASIN1_4-ASIN2_4;
                end
                else begin
                    Remainder4 = ASIN1_4+ASIN2_4;
                end
                sonuc16bit4 = {sonuc16bit4[14:0], ~Remainder4[17]};
                
      
                ASIN2_5 = {sonuc16bit5,Remainder5[17],1'b1};
                ASIN1_5 = {Remainder5[15:0], sayiTemp5[31:30]};
                sayiTemp5 = {sayiTemp5[29:0], 2'b0}; 
                if (Remainder5[17]== 0) begin
                    Remainder5 = ASIN1_5-ASIN2_5;
                end
                else begin
                    Remainder5 = ASIN1_5+ASIN2_5;
                end
                sonuc16bit5 = {sonuc16bit5[14:0], ~Remainder5[17]};
                
      
                ASIN2_6 = {sonuc16bit6,Remainder6[17],1'b1};
                ASIN1_6 = {Remainder6[15:0], sayiTemp6[31:30]};
                sayiTemp6 = {sayiTemp6[29:0], 2'b0}; 
                if (Remainder6[17]== 0) begin
                    Remainder6 = ASIN1_6-ASIN2_6;
                end
                else begin
                    Remainder6 = ASIN1_6+ASIN2_6;
                end
                sonuc16bit6 = {sonuc16bit6[14:0], ~Remainder6[17]};
             
       
                ASIN2_7 = {sonuc16bit7,Remainder7[17],1'b1};
                ASIN1_7 = {Remainder7[15:0], sayiTemp7[31:30]};
                sayiTemp7 = {sayiTemp7[29:0], 2'b0}; 
                if (Remainder7[17]== 0) begin
                    Remainder7 = ASIN1_7-ASIN2_7;
                end
                else begin
                    Remainder7 = ASIN1_7+ASIN2_7;
                end
                sonuc16bit7 = {sonuc16bit7[14:0], ~Remainder7[17]};
                
                 
                 ASIN2_8 = {sonuc16bit8,Remainder8[17],1'b1};
                ASIN1_8 = {Remainder8[15:0], sayiTemp8[31:30]};
                sayiTemp8 = {sayiTemp8[29:0], 2'b0}; 
                if (Remainder8[17]== 0) begin
                    Remainder8 = ASIN1_8-ASIN2_8;
                end
                else begin
                    Remainder8 = ASIN1_8+ASIN2_8;
                end
                sonuc16bit8 = {sonuc16bit8[14:0], ~Remainder8[17]};
           
                
             
                ASIN2_9 = {sonuc16bit9,Remainder9[17],1'b1};
                ASIN1_9 = {Remainder9[15:0], sayiTemp9[31:30]};
                sayiTemp9 = {sayiTemp9[29:0], 2'b0}; 
                if (Remainder9[17]== 0) begin
                    Remainder9 = ASIN1_9-ASIN2_9;
                end
                else begin
                    Remainder9 = ASIN1_9+ASIN2_9;
                end
                sonuc16bit9 = {sonuc16bit9[14:0], ~Remainder9[17]};
        
                 ASIN2_10= {sonuc16bit10,Remainder10[17],1'b1};
                ASIN1_10 = {Remainder10[15:0], sayiTemp10[31:30]};
                sayiTemp10 = {sayiTemp10[29:0], 2'b0}; 
                if (Remainder10[17]== 0) begin
                    Remainder10 = ASIN1_10-ASIN2_10;
                end
                else begin
                    Remainder10 = ASIN1_10+ASIN2_10;
                end
                sonuc16bit10 = {sonuc16bit10[14:0], ~Remainder10[17]};
           
                ASIN2_11= {sonuc16bit11,Remainder11[17],1'b1};
                ASIN1_11 = {Remainder11[15:0], sayiTemp11[31:30]};
                sayiTemp11 = {sayiTemp11[29:0], 2'b0}; 
                if (Remainder11[17]== 0) begin
                    Remainder11 = ASIN1_11-ASIN2_11;
                end
                else begin
                    Remainder11 = ASIN1_11+ASIN2_11;
                end
                sonuc16bit11 = {sonuc16bit11[14:0], ~Remainder11[17]};
            
 
                ASIN2_12= {sonuc16bit12,Remainder12[17],1'b1};
                ASIN1_12 = {Remainder12[15:0], sayiTemp12[31:30]};
                sayiTemp12 = {sayiTemp12[29:0], 2'b0}; 
                if (Remainder12[17]== 0) begin
                    Remainder12 = ASIN1_12-ASIN2_12;
                end
                else begin
                    Remainder12 = ASIN1_12+ASIN2_12;
                end
                sonuc16bit12 = {sonuc16bit12[14:0], ~Remainder12[17]};
             
                        
                ASIN2_13= {sonuc16bit13,Remainder13[17],1'b1};
                ASIN1_13 = {Remainder13[15:0], sayiTemp13[31:30]};
                sayiTemp13 = {sayiTemp13[29:0], 2'b0}; 
                if (Remainder13[17]== 0) begin
                    Remainder13 = ASIN1_13-ASIN2_13;
                end
                else begin
                    Remainder13 = ASIN1_13+ASIN2_13;
                end
                sonuc16bit13 = {sonuc16bit13[14:0], ~Remainder13[17]};
      
                ASIN2_14= {sonuc16bit14,Remainder14[17],1'b1};
                ASIN1_14 = {Remainder14[15:0], sayiTemp14[31:30]};
                sayiTemp14 = {sayiTemp14[29:0], 2'b0}; 
                if (Remainder14[17]== 0) begin
                    Remainder14 = ASIN1_14-ASIN2_14;
                end
                else begin
                    Remainder14 = ASIN1_14+ASIN2_14;
                end
                sonuc16bit14 = {sonuc16bit14[14:0], ~Remainder14[17]};
                
                
                 if(sayac15==15)begin
                 sayac_next15=0;
                ASIN2_15= {sonuc16bit15,Remainder15[17],1'b1};
                ASIN1_15 = {Remainder15[15:0], sayiTemp15[31:30]};
                sayiTemp15 = {sayiTemp15[29:0], 2'b0}; 
                if (Remainder15[17]== 0) begin
                    Remainder15 = ASIN1_15-ASIN2_15;
                end
                else begin
                    Remainder15 = ASIN1_15+ASIN2_15;
                end
                sonuc16bit15 = {sonuc16bit15[14:0], ~Remainder15[17]};
                ASIN1_15 = 0;
                ASIN2_15 = 0;
                Remainder15 = 0;
                gecerli=1;         
                sonuc={24'b0,sonuc16bit15,24'b0};
                sonuc16bit15 = 0;
                end
            end  
            
            
            
            if(sayacIN == 15) begin  
                sayacIN_next=0;
                 sayac_next0=0;
            sayac_next1=15;
            sayac_next2=14;
            sayac_next3=13;
            sayac_next4=12;
            sayac_next5=11;
            sayac_next6=10;
            sayac_next7=9;
            sayac_next8=8;
            sayac_next9=7;
            sayac_next10=6;
            sayac_next11=5;
            sayac_next12=4;
            sayac_next13=3;
            sayac_next14=2;
            sayac_next15=1;
                sayiTemp15 = sayilar[15];  
                ASIN2_2 = {sonuc16bit2,Remainder2[17],1'b1};
                ASIN1_2 = {Remainder2[15:0], sayiTemp2[31:30]};
                sayiTemp2 = {sayiTemp2[29:0], 2'b0}; 
                if (Remainder2[17]== 0) begin
                    Remainder2 = ASIN1_2-ASIN2_2;
                end
                else begin
                    Remainder2 = ASIN1_2+ASIN2_2;
                end
                sonuc16bit2 = {sonuc16bit2[14:0], ~Remainder2[17]};
                
                ASIN2_1 = {sonuc16bit1,Remainder1[17],1'b1};
                ASIN1_1 = {Remainder1[15:0], sayiTemp1[31:30]};
                sayiTemp1 = {sayiTemp1[29:0], 2'b0}; 
                if (Remainder1[17]== 0) begin
                    Remainder1 = ASIN1_1-ASIN2_1;
                end
                else begin
                    Remainder1 = ASIN1_1+ASIN2_1;
                end
                sonuc16bit1 = {sonuc16bit1[14:0], ~Remainder1[17]};
                
                ASIN2_0 = {sonuc16bit0,Remainder0[17],1'b1};
                ASIN1_0 = {Remainder0[15:0], sayiTemp0[31:30]};
                sayiTemp0 = {sayiTemp0[29:0], 2'b0}; 
                if (Remainder0[17]== 0) begin
                    Remainder0 = ASIN1_0-ASIN2_0;
                end
                else begin
                    Remainder0 = ASIN1_0+ASIN2_0;
                end
                sonuc16bit0 = {sonuc16bit0[14:0], ~Remainder0[17]};

                ASIN2_3 = {sonuc16bit3,Remainder3[17],1'b1};
                ASIN1_3 = {Remainder3[15:0], sayiTemp3[31:30]};
                sayiTemp3 = {sayiTemp3[29:0], 2'b0}; 
                if (Remainder3[17]== 0) begin
                    Remainder3 = ASIN1_3-ASIN2_3;
                end
                else begin
                    Remainder3 = ASIN1_3+ASIN2_3;
                end
                sonuc16bit3 = {sonuc16bit3[14:0], ~Remainder3[17]};
                
                ASIN2_4 = {sonuc16bit4,Remainder4[17],1'b1};
                ASIN1_4 = {Remainder4[15:0], sayiTemp4[31:30]};
                sayiTemp4 = {sayiTemp4[29:0], 2'b0}; 
                if (Remainder4[17]== 0) begin
                    Remainder4 = ASIN1_4-ASIN2_4;
                end
                else begin
                    Remainder4 = ASIN1_4+ASIN2_4;
                end
                sonuc16bit4 = {sonuc16bit4[14:0], ~Remainder4[17]};
                
      
                ASIN2_5 = {sonuc16bit5,Remainder5[17],1'b1};
                ASIN1_5 = {Remainder5[15:0], sayiTemp5[31:30]};
                sayiTemp5 = {sayiTemp5[29:0], 2'b0}; 
                if (Remainder5[17]== 0) begin
                    Remainder5 = ASIN1_5-ASIN2_5;
                end
                else begin
                    Remainder5 = ASIN1_5+ASIN2_5;
                end
                sonuc16bit5 = {sonuc16bit5[14:0], ~Remainder5[17]};
                
      
                ASIN2_6 = {sonuc16bit6,Remainder6[17],1'b1};
                ASIN1_6 = {Remainder6[15:0], sayiTemp6[31:30]};
                sayiTemp6 = {sayiTemp6[29:0], 2'b0}; 
                if (Remainder6[17]== 0) begin
                    Remainder6 = ASIN1_6-ASIN2_6;
                end
                else begin
                    Remainder6 = ASIN1_6+ASIN2_6;
                end
                sonuc16bit6 = {sonuc16bit6[14:0], ~Remainder6[17]};
             
       
                ASIN2_7 = {sonuc16bit7,Remainder7[17],1'b1};
                ASIN1_7 = {Remainder7[15:0], sayiTemp7[31:30]};
                sayiTemp7 = {sayiTemp7[29:0], 2'b0}; 
                if (Remainder7[17]== 0) begin
                    Remainder7 = ASIN1_7-ASIN2_7;
                end
                else begin
                    Remainder7 = ASIN1_7+ASIN2_7;
                end
                sonuc16bit7 = {sonuc16bit7[14:0], ~Remainder7[17]};
                
                 
                 ASIN2_8 = {sonuc16bit8,Remainder8[17],1'b1};
                ASIN1_8 = {Remainder8[15:0], sayiTemp8[31:30]};
                sayiTemp8 = {sayiTemp8[29:0], 2'b0}; 
                if (Remainder8[17]== 0) begin
                    Remainder8 = ASIN1_8-ASIN2_8;
                end
                else begin
                    Remainder8 = ASIN1_8+ASIN2_8;
                end
                sonuc16bit8 = {sonuc16bit8[14:0], ~Remainder8[17]};
           
                
             
                ASIN2_9 = {sonuc16bit9,Remainder9[17],1'b1};
                ASIN1_9 = {Remainder9[15:0], sayiTemp9[31:30]};
                sayiTemp9 = {sayiTemp9[29:0], 2'b0}; 
                if (Remainder9[17]== 0) begin
                    Remainder9 = ASIN1_9-ASIN2_9;
                end
                else begin
                    Remainder9 = ASIN1_9+ASIN2_9;
                end
                sonuc16bit9 = {sonuc16bit9[14:0], ~Remainder9[17]};
        
                 ASIN2_10= {sonuc16bit10,Remainder10[17],1'b1};
                ASIN1_10 = {Remainder10[15:0], sayiTemp10[31:30]};
                sayiTemp10 = {sayiTemp10[29:0], 2'b0}; 
                if (Remainder10[17]== 0) begin
                    Remainder10 = ASIN1_10-ASIN2_10;
                end
                else begin
                    Remainder10 = ASIN1_10+ASIN2_10;
                end
                sonuc16bit10 = {sonuc16bit10[14:0], ~Remainder10[17]};
           
                ASIN2_11= {sonuc16bit11,Remainder11[17],1'b1};
                ASIN1_11 = {Remainder11[15:0], sayiTemp11[31:30]};
                sayiTemp11 = {sayiTemp11[29:0], 2'b0}; 
                if (Remainder11[17]== 0) begin
                    Remainder11 = ASIN1_11-ASIN2_11;
                end
                else begin
                    Remainder11 = ASIN1_11+ASIN2_11;
                end
                sonuc16bit11 = {sonuc16bit11[14:0], ~Remainder11[17]};
            
 
                ASIN2_12= {sonuc16bit12,Remainder12[17],1'b1};
                ASIN1_12 = {Remainder12[15:0], sayiTemp12[31:30]};
                sayiTemp12 = {sayiTemp12[29:0], 2'b0}; 
                if (Remainder12[17]== 0) begin
                    Remainder12 = ASIN1_12-ASIN2_12;
                end
                else begin
                    Remainder12 = ASIN1_12+ASIN2_12;
                end
                sonuc16bit12 = {sonuc16bit12[14:0], ~Remainder12[17]};
             
                        
                ASIN2_13= {sonuc16bit13,Remainder13[17],1'b1};
                ASIN1_13 = {Remainder13[15:0], sayiTemp13[31:30]};
                sayiTemp13 = {sayiTemp13[29:0], 2'b0}; 
                if (Remainder13[17]== 0) begin
                    Remainder13 = ASIN1_13-ASIN2_13;
                end
                else begin
                    Remainder13 = ASIN1_13+ASIN2_13;
                end
                sonuc16bit13 = {sonuc16bit13[14:0], ~Remainder13[17]};
      
                ASIN2_14= {sonuc16bit14,Remainder14[17],1'b1};
                ASIN1_14 = {Remainder14[15:0], sayiTemp14[31:30]};
                sayiTemp14 = {sayiTemp14[29:0], 2'b0}; 
                if (Remainder14[17]== 0) begin
                    Remainder14 = ASIN1_14-ASIN2_14;
                end
                else begin
                    Remainder14 = ASIN1_14+ASIN2_14;
                end
                sonuc16bit14 = {sonuc16bit14[14:0], ~Remainder14[17]};
                
              
                ASIN2_15= {sonuc16bit15,Remainder15[17],1'b1};
                ASIN1_15 = {Remainder15[15:0], sayiTemp15[31:30]};
                sayiTemp15 = {sayiTemp15[29:0], 2'b0}; 
                if (Remainder15[17]== 0) begin
                    Remainder15 = ASIN1_15-ASIN2_15;
                end
                else begin
                    Remainder15 = ASIN1_15+ASIN2_15;
                end
                sonuc16bit15 = {sonuc16bit15[14:0], ~Remainder15[17]};
                
                ASIN1_0 = 0;
                ASIN2_0 = 0;
                Remainder0 = 0;
                gecerli=1;   
                sonuc={24'b0,sonuc16bit0,24'b0};
                sonuc16bit0 = 0;
            end  
           

           
       end  
    

    
        sayacIN<=sayacIN_next;
        sayac0<=sayac_next0;
        sayac1<=sayac_next1;
        sayac2<=sayac_next2;
        sayac3<=sayac_next3;
        sayac4<=sayac_next4;
        sayac5<=sayac_next5;
        sayac6<=sayac_next6;
        sayac7<=sayac_next7;
        sayac8<=sayac_next8;
        sayac9<=sayac_next9;
        sayac10<=sayac_next10;
        sayac11<=sayac_next11;
        sayac12<=sayac_next12;
        sayac13<=sayac_next13;
        sayac14<=sayac_next14;
        sayac15<=sayac_next15;
        
    end
endmodule








/*module karekok(
        input clk,  
        input rst,  
        input [31:0]sayi,  
        output reg gecerli, 
        output reg [15:0] sonuc
);
    reg signed [17:0] Remainder=0;
    integer i=0;
    reg [31:0] sayiTemp=0;
    reg [15:0] sonuc16bit=0;
    reg [17:0] ASIN1=0,ASIN2=0;
   always @(posedge clk or posedge rst)  begin
        if (rst == 1) begin  
            gecerli <= 0;
            sonuc <= 0;
            i = 0;
            sayiTemp = 0;
            ASIN1 = 0;
            ASIN2 = 0;
            Remainder = 0;
            sonuc16bit = 0;
        end    
        else begin 
            if(i == 0) begin  
                sayiTemp = sayi;
                gecerli <= 0;   
                i = i+1;   
            end
            else if(i < 16) begin 
                i = i+1;  
            end
            
            ASIN2 = {sonuc16bit,Remainder[17],1'b1};
            ASIN1 = {Remainder[15:0], sayiTemp[31:30]};
            sayiTemp = {sayiTemp[29:0], 2'b0}; 
            if ( Remainder[17] == 1)   
                Remainder = ASIN1 + ASIN2;
            else
                Remainder = ASIN1 - ASIN2;
            sonuc16bit = {sonuc16bit[14:0], ~Remainder[17]};
            if(i == 16) begin    
                gecerli <= 1;   
                i = 0; 
            //    sonuc <= {24'b0,sonuc16bit,24'b0}; 
              sonuc<=sonuc16bit;
                ASIN1 = 0;
                ASIN2 = 0;
                Remainder = 0;
                sonuc16bit = 0;
               
            end
        end    
    end
endmodule*/