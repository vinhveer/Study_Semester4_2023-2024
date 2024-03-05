# Cài đặt thư viện đồ họa cho Dev-C++
## Bước 1. Tải file `Graphics Header Files.zip` về và giải nén
## Bước 2. Sao chép file vào thư mục của MinGW.
### Sao chép tệp tin đầu vào
+ Sao chép tệp tin `graphics.h` và `winbgim.h` từ thư mục đã giải nén vào thư mục `include` của Dev-C++.
+ Đường dẫn thư mục: `C:\Program Files (x86)\Dev-Cpp\MinGW64\include`.
+ Nếu cài đặt tại vị trí khác, tìm đến thư mục `Dev-Cpp\MinGW64\include` là được.
### Sao chép tệp tin thư viện
Sao chép tệp tin `libbgi.a` từ thư mục đã giải nén vào thư mục `lib` của Dev-C++.
+ Đường dẫn thư mục: `C:\Program Files (x86)\Dev-Cpp\MinGW64\lib`.
+ Nếu cài đặt tại vị trí khác, tìm đến thư mục `Dev-Cpp\MinGW64\lib` là được.
## Bước 3. Cấu hình Dev-C++
+ Chọn **Tools** -> **Compiler Options**, tick chọn **Add the following commands when calling the linker**
+ Copy các biến sau vào ô nhập
```
-static-libgcc -lbgi -lgdi32 -lcomdlg32 -luuid -loleaut32 -lole32
```
+ Kết quả như hình là được

+ Chọn OK

## Bước 5. Chạy chương trình
+ Vì chương trình graphics.h chỉ hỗ trợ 32bit, nên để chạy được cần chuyển sang TDM-GCC 32bit, như hình

+ Sau khi chuyển xong, chọn một file bất kì để chạy là ok (Không cần tạo project hay gì cả, chạy như một file cpp bình thường)