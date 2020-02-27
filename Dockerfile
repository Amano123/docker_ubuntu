FROM ubuntu:latest
# 誰が作ったかは入れておきましょう
MAINTAINER tester

# 各環境変数を設定
ENV USER tester
ENV HOME /home/${USER}
ENV SHELL /bin/bash

# 一般ユーザーアカウントを追加
RUN useradd -m ${USER}
# 一般ユーザーにsudo権限を付与
RUN gpasswd -a ${USER} sudo
# 一般ユーザーのパスワード設定
RUN echo "${USER}:test_pass" | chpasswd
# ログインシェルを指定（アカウント情報の作成）
RUN sed -i.bak "s#${HOME}:#${HOME}:${SHELL}#" /etc/passwd
USER tester
