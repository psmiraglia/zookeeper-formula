{% from 'zookeeper/map.jinja' import zk with context %}

create_zookeeper_group:
    group.present:
        - name: {{ zk.group }}
        - system: True

create_zookeeper_user:
    user.present:
        - name: {{ zk.user }}
        - groups:
        - {{ zk.group }}
        - fullname: Zookeeper User
        - shell: /bin/false
        - empty_password: True
        - system: True
        - home: /var/lib/{{ zk.user }}
        - require:
        - group: create_zookeeper_group
