=========
zookeeper
=========

Install and configure a Zookeeper.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``zookeeper``
-------------

It executes ``user``, ``binaries`` and ``config`` states.

``zookeeper.user``
------------------

Creates the Zookeeper user and group by reading from ``zookeeper:user`` and
``zookeeper:group``.

``zookeeper.binaries``
----------------------

Install the Zookeeper binaries (at version ``zookeeper:version``) from
official tarball downloaded from ``zookeeper:mirror``.

``zookeeper.config``
--------------------

Configure Zookeeper by reading from ``zookeeper:config`` pillar key.

``zookeeper.service``
---------------------

Setup the Systemd unit for Zookeeper named ``zookeeper:service``.

``zookeeper.purge``
-------------------

Purge the environment created by this formula.

References
==========

-  `Apache Zookeeper <https://zookeeper.apache.org/>`__
-  `Salt Formulas <https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`__
