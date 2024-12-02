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

使用方法 / Usage Guide
1. 生成 MD5 校验值 / Generate MD5 Checksum

    运行脚本 / Run the Script
        Windows: 双击 get_md5.bat 或在命令提示符中运行。
        Windows: Double-click get_md5.bat or run it in the Command Prompt.
        Linux: 在终端中运行 get_md5.sh。
        Linux: Run get_md5.sh in the terminal.

    输入目标文件路径 / Enter the File Path
    当脚本提示 Enter the file path 时，输入目标文件的完整路径或相对路径（例如 C:\example.txt 或 /home/user/example.txt）。
    When prompted with Enter the file path, provide the full or relative path to the target file (e.g., C:\example.txt or /home/user/example.txt).

    查看生成的 MD5 文件 / Check the Generated MD5 File
    脚本会在目标文件的同目录下生成一个文件，文件名为 <文件名>_md5.txt，内容仅包含该文件的 MD5 校验值。
    The script will generate a file in the same directory as the target file, named <filename>_md5.txt, containing only the MD5 checksum.

    示例 / Example:
    输入文件 example.txt 的路径后，生成文件 example_md5.txt，内容如下：
    After providing the path to example.txt, it generates example_md5.txt with the following content:

    3a5a0aa88f0e07723caf0178923fa9e8

2. 验证 MD5 校验值 / Verify MD5 Checksum

    运行脚本 / Run the Script
        Windows: 双击 compare_md5.bat 或在命令提示符中运行。
        Windows: Double-click compare_md5.bat or run it in the Command Prompt.
        Linux: 在终端中运行 compare_md5.sh。
        Linux: Run compare_md5.sh in the terminal.

    输入目标文件路径 / Enter the File Path
    当脚本提示 Enter the file path 时，输入需要验证的文件路径（例如 C:\example.txt 或 /home/user/example.txt）。
    When prompted with Enter the file path, provide the path to the file you want to verify (e.g., C:\example.txt or /home/user/example.txt).

    查看验证结果 / Check the Verification Result
    脚本会计算文件的当前 MD5 值，并与同目录下 <文件名>_md5.txt 文件中的值进行对比。
    The script calculates the current MD5 checksum of the file and compares it with the value stored in <filename>_md5.txt in the same directory.

        验证成功 / Verification Success: 如果 MD5 匹配，脚本会显示以下信息：
        If the MD5 matches, the script will display:

MD5 match!

验证失败 / Verification Failure: 如果 MD5 不匹配，脚本会显示以下信息，包括当前 MD5 和存储的 MD5：
If the MD5 does not match, it will display the following, including the current and stored MD5:

        MD5 does not match!
        Current MD5: 3a5a0aa88f0e07723caf0178923fa9e8
        Stored MD5: d41d8cd98f00b204e9800998ecf8427e

3. 注意事项 / Notes

    文件路径 / File Path:
        Windows 路径格式：C:\example.txt
        Windows Path Format: C:\example.txt
        Linux 路径格式：/home/user/example.txt
        Linux Path Format: /home/user/example.txt

    文件名自动生成 / Auto-generated File Name:
        生成的 MD5 文件与目标文件同目录，文件名格式为 <文件名>_md5.txt。
        The generated MD5 file is in the same directory as the target file, with the format <filename>_md5.txt.

    多文件支持 / Multi-file Support:
        若需批量处理，可在脚本基础上扩展循环功能。
        For batch processing, the script can be extended with looping functionality.
   
如果需要进一步定制或扩展此工具的功能，请随时告诉我！
Feel free to let me know if further customization or feature expansion is needed!
