{% from 'zookeeper/map.jinja' import zk with context %}
{% from 'zookeeper/macro.sls' import source_url with context %}
{% from 'zookeeper/macro.sls' import source_hash with context %}

zookeeper_binaries:
    archive.extracted:
        - name: {{ zk.home }}
        - if_missing: {{ zk.home }}
        - source: {{ source_url() }}
        - source_hash: {{ source_hash() }}
        - archive_format: tar
        - options: "--strip=1"
        - enforce_toplevel: False
        - user: {{ zk.user }}
        - group: {{ zk.group }}
