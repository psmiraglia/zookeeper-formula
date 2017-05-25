{% from 'zookeeper/map.jinja' import zk with context %}

delete_systemd_unit:
    service.dead:
        - name: {{ zk.service }}
        - enable: False

    file.absent:
        - name: /etc/systemd/system/{{ zk.service }}.service

    module.run:
        - name: service.systemctl_reload
        - onchanges:
            - file: delete_systemd_unit

delete_zookeeper_user:
    user.absent:
        - name: {{ zk.user }}

delete_zookeeper_group:
    group.absent:
        - name: {{ zk.group }}
        - require:
            - user: delete_zookeeper_user

delete_zookeeper_dirs:
    file.absent:
        - names:
            - {{ zk.home }}
            - /var/lib/{{ zk.user }}
            - {{ zk.config.get('dataDir') }}
