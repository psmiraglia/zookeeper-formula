{%- macro source_url() -%}
{%- set v= salt['pillar.get']('zookeeper:version', '3.4.10') -%}
{%- set m = salt['pillar.get']('zookeeper:mirror', 'http://archive.apache.org/dist') -%}
{{ m }}/zookeeper/zookeeper-{{ v }}/zookeeper-{{ v }}.tar.gz
{%- endmacro -%}

{%- macro source_hash() -%}
{{ source_url() }}.sha1
{%- endmacro -%}
