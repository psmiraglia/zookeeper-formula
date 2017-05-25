{% from 'zookeeper/map.jinja' import zk with context %}

{{ zk.home }}/conf/zoo.cfg:
    file.managed:
        - source: salt://zookeeper/templates/zoo.cfg.jinja
        - template: jinja
        - user: {{ zk.user }}
        - group: {{ zk.group }}
        - mode: 0664
        - context:
            config: {{ zk.config }}

