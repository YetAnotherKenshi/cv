FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    texlive-fonts-recommended \
    texlive-latex-extra \
    texlive-fonts-extra \
    dvipng \
    texlive-base \
    texlive-pictures \
    texlive-lang-cyrillic \
    texlive-science \
    cm-super \
    texlive-xetex \
    texlive-latex-extra \
    biber

COPY cv resume/cv

WORKDIR resume/cv

CMD ["sh", "-c", "xelatex resume.tex && biber resume && xelatex resume.tex && xelatex resume.tex"]