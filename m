From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the jc_docs tree
Date: Mon, 8 Oct 2018 18:38:40 +1100
Message-ID: <20181008183840.70ebfe94@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/cT8Q5sJ6rIu7PqIRl4d=SqV"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mike Rapoport <rppt@linux.vnet.ibm.com>, David Hildenbrand <david@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/cT8Q5sJ6rIu7PqIRl4d=SqV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got conflicts in:

  Documentation/memory-hotplug.txt
  Documentation/admin-guide/mm/memory-hotplug.rst

between commits:

  6bf53999a3a2 ("docs: move memory hotplug description into admin-guide/mm")
  98cee6742c80 ("docs/vm: split memory hotplug notifier description to Docu=
mentation/core-api")

from the jc_docs tree and patch:

  "memory-hotplug.txt: add some details about locking internals"

from the akpm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/admin-guide/mm/memory-hotplug.rst
index 0b9c83effaa4,ce4faa5530fa..000000000000
--- a/Documentation/admin-guide/mm/memory-hotplug.rst
+++ b/Documentation/admin-guide/mm/memory-hotplug.rst
@@@ -413,6 -413,128 +413,46 @@@ Need more implementation yet...
   - Notification completion of remove works by OS to firmware.
   - Guard from remove if not yet.
 =20
 -Memory hotplug event notifier
 -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
 -
 -Hotplugging events are sent to a notification queue.
 -
 -There are six types of notification defined in include/linux/memory.h:
 -
 -MEM_GOING_ONLINE
 -  Generated before new memory becomes available in order to be able to
 -  prepare subsystems to handle memory. The page allocator is still unable
 -  to allocate from the new memory.
 -
 -MEM_CANCEL_ONLINE
 -  Generated if MEMORY_GOING_ONLINE fails.
 -
 -MEM_ONLINE
 -  Generated when memory has successfully brought online. The callback may
 -  allocate pages from the new memory.
 -
 -MEM_GOING_OFFLINE
 -  Generated to begin the process of offlining memory. Allocations are no
 -  longer possible from the memory but some of the memory to be offlined
 -  is still in use. The callback can be used to free memory known to a
 -  subsystem from the indicated memory block.
 -
 -MEM_CANCEL_OFFLINE
 -  Generated if MEMORY_GOING_OFFLINE fails. Memory is available again from
 -  the memory block that we attempted to offline.
 -
 -MEM_OFFLINE
 -  Generated after offlining memory is complete.
 -
 -A callback routine can be registered by calling::
 -
 -  hotplug_memory_notifier(callback_func, priority)
 -
 -Callback functions with higher values of priority are called before callb=
ack
 -functions with lower values.
 -
 -A callback function must have the following prototype::
 -
 -  int callback_func(
 -    struct notifier_block *self, unsigned long action, void *arg);
 -
 -The first argument of the callback function (self) is a pointer to the bl=
ock
 -of the notifier chain that points to the callback function itself.
 -The second argument (action) is one of the event types described above.
 -The third argument (arg) passes a pointer of struct memory_notify::
 -
 -	struct memory_notify {
 -		unsigned long start_pfn;
 -		unsigned long nr_pages;
 -		int status_change_nid_normal;
 -		int status_change_nid_high;
 -		int status_change_nid;
 -	}
 -
 -- start_pfn is start_pfn of online/offline memory.
 -- nr_pages is # of pages of online/offline memory.
 -- status_change_nid_normal is set node id when N_NORMAL_MEMORY of nodemask
 -  is (will be) set/clear, if this is -1, then nodemask status is not chan=
ged.
 -- status_change_nid_high is set node id when N_HIGH_MEMORY of nodemask
 -  is (will be) set/clear, if this is -1, then nodemask status is not chan=
ged.
 -- status_change_nid is set node id when N_MEMORY of nodemask is (will be)
 -  set/clear. It means a new(memoryless) node gets new memory by online an=
d a
 -  node loses all memory. If this is -1, then nodemask status is not chang=
ed.
 -
 -  If status_changed_nid* >=3D 0, callback should create/discard structure=
s for the
 -  node if necessary.
 -
 -The callback routine shall return one of the values
 -NOTIFY_DONE, NOTIFY_OK, NOTIFY_BAD, NOTIFY_STOP
 -defined in include/linux/notifier.h
 -
 -NOTIFY_DONE and NOTIFY_OK have no effect on the further processing.
 -
 -NOTIFY_BAD is used as response to the MEM_GOING_ONLINE, MEM_GOING_OFFLINE,
 -MEM_ONLINE, or MEM_OFFLINE action to cancel hotplugging. It stops
 -further processing of the notification queue.
 -
 -NOTIFY_STOP stops further processing of the notification queue.
 -
+=20
+ Locking Internals
+ =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+=20
+ When adding/removing memory that uses memory block devices (i.e. ordinary=
 RAM),
+ the device_hotplug_lock should be held to:
+=20
+ - synchronize against online/offline requests (e.g. via sysfs). This way,=
 memory
+   block devices can only be accessed (.online/.state attributes) by user
+   space once memory has been fully added. And when removing memory, we
+   know nobody is in critical sections.
+ - synchronize against CPU hotplug and similar (e.g. relevant for ACPI and=
 PPC)
+=20
+ Especially, there is a possible lock inversion that is avoided using
+ device_hotplug_lock when adding memory and user space tries to online that
+ memory faster than expected:
+=20
+ - device_online() will first take the device_lock(), followed by
+   mem_hotplug_lock
+ - add_memory_resource() will first take the mem_hotplug_lock, followed by
+   the device_lock() (while creating the devices, during bus_add_device()).
+=20
+ As the device is visible to user space before taking the device_lock(), t=
his
+ can result in a lock inversion.
+=20
+ onlining/offlining of memory should be done via device_online()/
+ device_offline() - to make sure it is properly synchronized to actions
+ via sysfs. Holding device_hotplug_lock is advised (to e.g. protect online=
_type)
+=20
+ When adding/removing/onlining/offlining memory or adding/removing
+ heterogeneous/device memory, we should always hold the mem_hotplug_lock in
+ write mode to serialise memory hotplug (e.g. access to global/zone
+ variables).
+=20
+ In addition, mem_hotplug_lock (in contrast to device_hotplug_lock) in read
+ mode allows for a quite efficient get_online_mems/put_online_mems
+ implementation, so code accessing memory can protect from that memory
+ vanishing.
+=20
+=20
  Future Work
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 =20

--Sig_/cT8Q5sJ6rIu7PqIRl4d=SqV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu7CYAACgkQAVBC80lX
0GwLawf9EGMcFekreJJfJZZuSIltJNYWLjT4ee2x9acMAuhqgXnuCu5LFFF5aKgA
cux0YLFTHAv7ZUOOiPQPFF7viJ480MA7HBnhVLG9dtO9Ea/1NPryzyjwOdpGY+wV
5eIYZpozFnP6cYnlxK98u+qL2MtBXZGEZ7Hzd9u9ym5rLZRKsQIatB765WNZ7AvU
bdzEaogFCBsgLkI5eZGhh1Ppg4xIx2IEcO6Bdc8YqTT1HBYax5mBS2FShUo1i/8T
xvKNzmaGEDwvcN+w5T+w4YxcWq+DKXM5d01GOZMoi2UqQjAKHXWMQP/9KsGkbMY4
sbFytZ2tBLfkdrAc/N50hm28JHubVQ==
=Y3WG
-----END PGP SIGNATURE-----

--Sig_/cT8Q5sJ6rIu7PqIRl4d=SqV--
