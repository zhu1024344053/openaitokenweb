# 使用 Python 官方镜像作为基础镜像
FROM python:3.9.6-slim-bullseye

# 将工作目录设置为 /app
WORKDIR /app

# 将当前目录下的所有文件复制到 /app 目录下
COPY ./app /app

# 将 requirements.txt 复制到 /app 目录下
COPY requirements.txt /app

# 安装依赖包
RUN pip install --no-cache-dir -r requirements.txt -i https://pypi.douban.com/simple
RUN pip install --no-cache-dir requests[socks]
# 设置环境变量，这里假设你的Flask应用程序文件名为app.py
ENV FLASK_APP=app.py

# 声明暴露的端口号
EXPOSE 5000

# 运行 Python HTTP 服务器
CMD ["flask", "run", "--host=0.0.0.0"]
