### Manual Steps 
* Get the code
```
git clone https://github.com/KolliRamu2/fastiapi.git
```
* Activate virtual Enviornment  for install dependenices(for windows -python linux-python3)
```
python -m venv .venv
.venv/scripts/activate
```
* install dependencies
```
pip install -r requirements.txt
```
* Run the start up command
```
uvicorn main:app --host 0.0.0.0 --port 8000 --reload
```
