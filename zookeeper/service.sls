{% from 'zookeeper/map.jinja' import zk with context %}

zookeeper_systemd_unit:
    file.managed:
        - name: /etc/systemd/system/{{ zk.service }}.service
        - source: salt://zookeeper/templates/service.jinja
        - template: jinja
        - context:
            zk: {{ zk }}

    module.run:
        - name: service.systemctl_reload
        - onchanges:
            - file: zookeeper_systemd_unit

zookeeper_enabled:
    service.enabled:
        - name: {{ zk.service }}
        - watch:
            - module: zookeeper_systemd_unit

