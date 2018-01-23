## example


from templates/basic/outer.yaml:

```
setup: |
  GLOBALS.ecosystem = IPC.Ecosystem()

fields:
  entrance:
    onlyif: this.should_spawn
    lambda: |
      [ ecosystem.spawn("inner.yaml") for _ in range(5) ]

  should_spawn:
    random: random() > 0.9

printer: |
  for record, proc in ecosystem.gen_records():
      print(json.dumps(record))

imports:
  - json
  - plaitpy_ipc: IPC
```


from templates/basic/inner.yaml:

```
fields:
  tick:
    lambda: ecosystem.get_tick()

  id:
    lambda: ecosystem.get_pid()

  age:
    initial:
      lambda: 0
    lambda: prev.age + 1

  should_die:
    lambda: ecosystem.expire()
    onlyif: random.random() > 0.9

imports:
  - plaitpy_ipc: IPC
```


for more examples, look at the directories in `templates/`
