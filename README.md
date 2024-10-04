# Convolution Layer

Thiết kế verilog của lớp Convolution

## Mô tả

Gồm các bộ phận: file thiết kế, testbench, code python dùng để tạo các file .txt kiểm tra

## Getting Started

### Thiết kế

File mmu.v
Sơ đồ thiết kế: https://docs.google.com/presentation/d/1WV2lelt7a6oAOMkrWYnCnxCloGz66vAD/edit#slide=id.g2dd98016deb_0_6
Gồm 5x5 bộ nhân và nhiều bộ cộng song song
Các bộ nhân và cộng đang sử dụng data dạng fixed point 32 bit, lấy tại bit 16

### Testbench

File conv_tb.v
Chịu trách nhiệm nạp dữ liệu vào theo đúng thứ tự để nhân ma trận
Sử dụng các file .mem chứa các dữ liệu số fixed point để nạp vào bộ nhân, các file này được tạo bởi python

### Python

Folder float2fixed
Được tạo hoàn toàn bởi ChatGPT, mục đích là nhanh chóng tạo các file input output có các giá trị ngẫu nhiên để kiểm tra kết quả từ thiết kế

