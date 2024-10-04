# Convolution Layer

Thiết kế verilog của lớp Convolution

## Mô tả

Gồm các bộ phận: file thiết kế, testbench, code python dùng để tạo các file .txt kiểm tra


### Thiết kế

File mmu.v

Sơ đồ thiết kế: https://docs.google.com/presentation/d/1WV2lelt7a6oAOMkrWYnCnxCloGz66vAD/edit#slide=id.g2dd98016deb_0_6

Gồm 5x5 bộ nhân và nhiều bộ cộng song song

Các bộ nhân và cộng đang sử dụng data dạng fixed point 32 bit, lấy tại bit 16

```
for (n = 0; n < NUM_FILTER; n = n+1) begin
            weight0 <= weightArray[25*n+0];
            ...                                    
            weight24 <= weightArray[25*n+24];
            
            bias <= biasArray[n];
```
Mỗi khi nạp một Filter mới để tính convolution thì thay toàn bộ 5*5=25 giá trị weight của filter cần tính vào. Bias được nạp vào chung với Filter
```
            for (x = 0; x < OUT_ROW; x = x+1) begin
                for (y = 0; y < OUT_COL; y = y+1) begin
                #1
                    input0 <= imageArray[(x * 32) + y +  0];
                    input1 <= imageArray[(x * 32) + y +  1];
                    input2 <= imageArray[(x * 32) + y +  2];
                    input3 <= imageArray[(x * 32) + y +  3];
                    input4 <= imageArray[(x * 32) + y +  4];
                    ...
                    input20 <= imageArray[((x+4) * 32) + y +  0];
                    input21 <= imageArray[((x+4) * 32) + y +  1];
                    input22 <= imageArray[((x+4) * 32) + y +  2];
                    input23 <= imageArray[((x+4) * 32) + y +  3];
                    input24 <= imageArray[((x+4) * 32) + y +  4];
                end
            end
        end
```
Giải thích ý nghĩa của cụm: imageArray[((x+OFFSET) * INPUT_SIZE) + y + OFFSET]

1. x là index cho số HÀNG, y là index cho số CỘT
2. INPUT_SIZE là kích thước của đầu vào, ở đây kích thước input là 32*32 vì vậy INPUT_SIZE = 32
3. OFFSET là tương quan vị trí của điểm pixel cần nạp so với vị trí x hoặc y đang xét

### Testbench

File conv_tb.v

Chịu trách nhiệm nạp dữ liệu vào theo đúng thứ tự để nhân ma trận

Sử dụng các file .mem chứa các dữ liệu số fixed point để nạp vào bộ nhân, các file này được tạo bởi python

### Python

Folder float2fixed

Được tạo hoàn toàn bởi ChatGPT, mục đích là nhanh chóng tạo các file input output có các giá trị ngẫu nhiên để kiểm tra kết quả từ thiết kế

