FROM python-3.8.5-buster

COPY . /gitautomation
WORKDIR /gitautomation

# Install deps

RUN python -m pip install --upgrade pip
RUN pip install -r requirements.txt

# Installl git
RUN apt-get update && apt-get install git=1:2.20.1-2+deb10u3 -y --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /gitautomation/tests

CMD ["pytest", "-vv"]