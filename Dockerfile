FROM python:alpine3.17
WORKDIR /code
COPY ./requirements.txt ./requirements.txt
RUN pip install -r ./requirements.txt
COPY ./server.py ./server.py
ENV db_name="MYDB"
COPY ./entrypoint.sh ./entrypoint.sh
ENTRYPOINT [ "/code/entrypoint.sh" ]
CMD ["python", "./server.py"]
