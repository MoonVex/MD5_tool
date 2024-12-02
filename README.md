# MD5_tool
这个工具由两个脚本组成，分别用于生成和验证文件的 MD5 校验值，确保文件在传输或存储过程中未被篡改或损坏。 This tool consists of two scripts designed to generate and verify the MD5 checksum of files, ensuring they are not altered or corrupted during transfer or storage.
1. 功能 / Features
1.1 生成 MD5 校验值 / Generate MD5 Checksum

    工具会读取指定文件并生成其唯一的 MD5 校验值。
    The tool reads a specified file and generates its unique MD5 checksum.
    校验值被保存到与文件同目录下的文件中，文件名格式为：<文件名>_md5.txt。
    The checksum is saved to a file in the same directory as the target file, with the format: <filename>_md5.txt.
    仅包含文件的 MD5 值，便于后续验证。
    The file contains only the MD5 checksum, making it easy for future verification.

1.2 验证 MD5 校验值 / Verify MD5 Checksum

    工具会重新计算文件的 MD5 值，并与 <文件名>_md5.txt 文件中的值进行对比。
    The tool recalculates the MD5 checksum of the file and compares it with the value stored in the <filename>_md5.txt file.
    对比结果显示文件是否匹配（未被修改或损坏）。
    The result indicates whether the file matches (unchanged or not corrupted).

2. 使用场景 / Use Cases

    文件完整性验证 / File Integrity Check：
        用于验证文件在传输（如 FTP、邮件）或存储过程中是否被意外修改。
        Used to verify if a file has been accidentally modified during transfer (e.g., FTP, email) or storage.

    安全性检查 / Security Validation：
        防止文件被恶意篡改（如被嵌入恶意代码）。
        Prevents malicious tampering with files (e.g., embedding malicious code).

    数据备份 / Data Backup：
        确保备份文件与原始文件一致。
        Ensures backup files are consistent with the original files.

3. 技术实现 / Technical Implementation
Windows 版本 / Windows Version:

    使用 certutil 工具计算 MD5 值。
    Uses the certutil tool to compute the MD5 checksum.
    脚本使用批处理语言编写，适用于 Windows 环境。
    Written in batch scripting, suitable for Windows environments.

Linux 版本 / Linux Version:

    使用 md5sum 工具计算 MD5 值。
    Uses the md5sum tool to compute the MD5 checksum.
    脚本使用 Shell 脚本编写，适用于所有主流 Linux 发行版。
    Written in shell scripting, suitable for all major Linux distributions.

4. 工具优点 / Tool Advantages

    轻量级 / Lightweight：
        无需安装额外软件，直接使用系统自带工具。
        No need for additional software; uses system-native tools.

    易用性 / Ease of Use：
        只需运行脚本并输入文件路径即可。
        Simply run the script and input the file path.

    兼容性 / Compatibility：
        支持多平台，Windows 和 Linux 均可运行（分别提供 .bat 和 .sh 版本）。
        Supports multiple platforms, compatible with both Windows and Linux (with .bat and .sh versions, respectively).

如果需要进一步定制或扩展此工具的功能，请随时告诉我！
Feel free to let me know if further customization or feature expansion is needed!
