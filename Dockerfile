FROM pytorch/pytorch:1.9.1-cuda11.1-cudnn8-devel

RUN wget https://raw.githubusercontent.com/cyanrain7/TRPO-in-MARL/master/requirements.txt

RUN apt-get update && apt-get install -y libgl1-mesa-glx libpci-dev curl nano psmisc zip git && apt-get --fix-broken install -y

RUN conda install -y faiss-gpu scikit-learn pandas flake8 yapf isort yacs gdown future libgcc -c conda-forge

RUN pip install --upgrade pip && python -m pip install --upgrade setuptools && \
    pip install -r requirements.txt



COPY ./fonts/* /opt/conda/lib/python3.10/site-packages/matplotlib/mpl-data/fonts/ttf/
