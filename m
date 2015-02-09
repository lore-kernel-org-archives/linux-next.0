From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the pm tree
Date: Mon, 9 Feb 2015 13:26:42 +1100
Message-ID: <20150209132642.0d61b6ed@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/z1g+Zviz9pkwepjS67Oah3d"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47331 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758814AbbBIC0x (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 8 Feb 2015 21:26:53 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Jiang Liu <jiang.liu@linux.intel.com>

--Sig_/z1g+Zviz9pkwepjS67Oah3d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rafael,

After merging the pm tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from drivers/of/of_pci.c:1:0:
drivers/of/of_pci.c: In function 'of_pci_get_host_bridge_resources':
include/linux/list.h:447:43: error: dereferencing pointer to incomplete type
  for (pos =3D list_first_entry(head, typeof(*pos), member); \
                                           ^
include/linux/kernel.h:799:18: note: in definition of macro 'container_of'
  const typeof( ((type *)0)->member ) *__mptr =3D (ptr); \
                  ^
include/linux/list.h:363:2: note: in expansion of macro 'list_entry'
  list_entry((ptr)->next, type, member)
  ^
include/linux/list.h:447:13: note: in expansion of macro 'list_first_entry'
  for (pos =3D list_first_entry(head, typeof(*pos), member); \
             ^
drivers/of/of_pci.c:229:2: note: in expansion of macro 'list_for_each_entry'
  list_for_each_entry(window, resources, list)
  ^
include/linux/kernel.h:799:48: warning: initialization from incompatible po=
inter type
  const typeof( ((type *)0)->member ) *__mptr =3D (ptr); \
                                                ^
include/linux/list.h:352:2: note: in expansion of macro 'container_of'
  container_of(ptr, type, member)
  ^
include/linux/list.h:363:2: note: in expansion of macro 'list_entry'
  list_entry((ptr)->next, type, member)
  ^
include/linux/list.h:447:13: note: in expansion of macro 'list_first_entry'
  for (pos =3D list_first_entry(head, typeof(*pos), member); \
             ^
drivers/of/of_pci.c:229:2: note: in expansion of macro 'list_for_each_entry'
  list_for_each_entry(window, resources, list)
  ^
include/linux/list.h:447:43: error: dereferencing pointer to incomplete type
  for (pos =3D list_first_entry(head, typeof(*pos), member); \
                                           ^
include/linux/kernel.h:800:3: note: in definition of macro 'container_of'
  (type *)( (char *)__mptr - offsetof(type,member) );})
   ^
include/linux/list.h:363:2: note: in expansion of macro 'list_entry'
  list_entry((ptr)->next, type, member)
  ^
include/linux/list.h:447:13: note: in expansion of macro 'list_first_entry'
  for (pos =3D list_first_entry(head, typeof(*pos), member); \
             ^
drivers/of/of_pci.c:229:2: note: in expansion of macro 'list_for_each_entry'
  list_for_each_entry(window, resources, list)
  ^
In file included from include/linux/compiler-gcc.h:106:0,
                 from include/linux/compiler.h:54,
                 from include/linux/linkage.h:4,
                 from include/linux/kernel.h:6,
                 from drivers/of/of_pci.c:1:
include/linux/list.h:447:43: error: dereferencing pointer to incomplete type
  for (pos =3D list_first_entry(head, typeof(*pos), member); \
                                           ^
include/linux/compiler-gcc4.h:14:53: note: in definition of macro '__compil=
er_offsetof'
 #define __compiler_offsetof(a,b) __builtin_offsetof(a,b)
                                                     ^
include/linux/kernel.h:800:29: note: in expansion of macro 'offsetof'
  (type *)( (char *)__mptr - offsetof(type,member) );})
                             ^
include/linux/list.h:352:2: note: in expansion of macro 'container_of'
  container_of(ptr, type, member)
  ^
include/linux/list.h:363:2: note: in expansion of macro 'list_entry'
  list_entry((ptr)->next, type, member)
  ^
include/linux/list.h:447:13: note: in expansion of macro 'list_first_entry'
  for (pos =3D list_first_entry(head, typeof(*pos), member); \
             ^
drivers/of/of_pci.c:229:2: note: in expansion of macro 'list_for_each_entry'
  list_for_each_entry(window, resources, list)
  ^
In file included from include/linux/kobject.h:20:0,
                 from include/linux/of.h:21,
                 from drivers/of/of_pci.c:3:
include/linux/list.h:448:11: error: dereferencing pointer to incomplete type
       &pos->member !=3D (head);     \
           ^
drivers/of/of_pci.c:229:2: note: in expansion of macro 'list_for_each_entry'
  list_for_each_entry(window, resources, list)
  ^
In file included from drivers/of/of_pci.c:1:0:
include/linux/list.h:393:40: error: dereferencing pointer to incomplete type
  list_entry((pos)->member.next, typeof(*(pos)), member)
                                        ^
include/linux/kernel.h:799:18: note: in definition of macro 'container_of'
  const typeof( ((type *)0)->member ) *__mptr =3D (ptr); \
                  ^
include/linux/list.h:393:2: note: in expansion of macro 'list_entry'
  list_entry((pos)->member.next, typeof(*(pos)), member)
  ^
include/linux/list.h:449:13: note: in expansion of macro 'list_next_entry'
       pos =3D list_next_entry(pos, member))
             ^
drivers/of/of_pci.c:229:2: note: in expansion of macro 'list_for_each_entry'
  list_for_each_entry(window, resources, list)
  ^
include/linux/list.h:393:18: error: dereferencing pointer to incomplete type
  list_entry((pos)->member.next, typeof(*(pos)), member)
                  ^
include/linux/kernel.h:799:49: note: in definition of macro 'container_of'
  const typeof( ((type *)0)->member ) *__mptr =3D (ptr); \
                                                 ^
include/linux/list.h:393:2: note: in expansion of macro 'list_entry'
  list_entry((pos)->member.next, typeof(*(pos)), member)
  ^
include/linux/list.h:449:13: note: in expansion of macro 'list_next_entry'
       pos =3D list_next_entry(pos, member))
             ^
drivers/of/of_pci.c:229:2: note: in expansion of macro 'list_for_each_entry'
  list_for_each_entry(window, resources, list)
  ^
include/linux/list.h:393:40: error: dereferencing pointer to incomplete type
  list_entry((pos)->member.next, typeof(*(pos)), member)
                                        ^
include/linux/kernel.h:800:3: note: in definition of macro 'container_of'
  (type *)( (char *)__mptr - offsetof(type,member) );})
   ^
include/linux/list.h:393:2: note: in expansion of macro 'list_entry'
  list_entry((pos)->member.next, typeof(*(pos)), member)
  ^
include/linux/list.h:449:13: note: in expansion of macro 'list_next_entry'
       pos =3D list_next_entry(pos, member))
             ^
drivers/of/of_pci.c:229:2: note: in expansion of macro 'list_for_each_entry'
  list_for_each_entry(window, resources, list)
  ^
In file included from include/linux/compiler-gcc.h:106:0,
                 from include/linux/compiler.h:54,
                 from include/linux/linkage.h:4,
                 from include/linux/kernel.h:6,
                 from drivers/of/of_pci.c:1:
include/linux/list.h:393:40: error: dereferencing pointer to incomplete type
  list_entry((pos)->member.next, typeof(*(pos)), member)
                                        ^
include/linux/compiler-gcc4.h:14:53: note: in definition of macro '__compil=
er_offsetof'
 #define __compiler_offsetof(a,b) __builtin_offsetof(a,b)
                                                     ^
include/linux/kernel.h:800:29: note: in expansion of macro 'offsetof'
  (type *)( (char *)__mptr - offsetof(type,member) );})
                             ^
include/linux/list.h:352:2: note: in expansion of macro 'container_of'
  container_of(ptr, type, member)
  ^
include/linux/list.h:393:2: note: in expansion of macro 'list_entry'
  list_entry((pos)->member.next, typeof(*(pos)), member)
  ^
include/linux/list.h:449:13: note: in expansion of macro 'list_next_entry'
       pos =3D list_next_entry(pos, member))
             ^
drivers/of/of_pci.c:229:2: note: in expansion of macro 'list_for_each_entry'
  list_for_each_entry(window, resources, list)
  ^
drivers/of/of_pci.c:230:15: error: dereferencing pointer to incomplete type
   kfree(window->res);
               ^

Caused by commit 14d76b68f281 ("PCI: Use common resource list
management code instead of private implementation") interacting with
commit d2be00c0fb5a ("of/pci: Free resources on failure in
of_pci_get_host_bridge_resources()") from the pci tree.

I applied the following merge fix patch (which may need more work?).
Someone needs to remember to tell Linus about this fix (or similar)
when these trees get merged.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 9 Feb 2015 13:08:24 +1100
Subject: [PATCH] of/pci: fix up for "PCI: Use common resource list manageme=
nt
 code instead of private implementation"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/of/of_pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/of/of_pci.c b/drivers/of/of_pci.c
index 60dc36c865b5..110fece2ff53 100644
--- a/drivers/of/of_pci.c
+++ b/drivers/of/of_pci.c
@@ -140,7 +140,7 @@ int of_pci_get_host_bridge_resources(struct device_node=
 *dev,
 			unsigned char busno, unsigned char bus_max,
 			struct list_head *resources, resource_size_t *io_base)
 {
-	struct pci_host_bridge_window *window;
+	struct resource_entry *window;
 	struct resource *res;
 	struct resource *bus_range;
 	struct of_pci_range range;
@@ -226,7 +226,7 @@ int of_pci_get_host_bridge_resources(struct device_node=
 *dev,
 conversion_failed:
 	kfree(res);
 parse_failed:
-	list_for_each_entry(window, resources, list)
+	resource_list_for_each_entry(window, resources)
 		kfree(window->res);
 	pci_free_resource_list(resources);
 	kfree(bus_range);
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/z1g+Zviz9pkwepjS67Oah3d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU2BrrAAoJEMDTa8Ir7ZwVfwcP/25N83zOCsxb3LPhOZlxrlFm
HI+lChUqjYa4zmmrHpydBLAWpu9snMd3Zh8dQYJcudy+82Dng/+NUDuyfeOB5rgg
l9zc+Crd2wueJC1zNoadjeqta9X6RE01/w3jq1cDC0vb+BqrV00GpyilH6Civz6Z
b0gulgK4CLAyIWkg3KfrHAelgQaHH9638g+kXh9xk7K6rYFX3POHE26Kpu1EUzZ1
xbeKPQ+Pk+8VrY/MFm6jgZl2GL5RePXNsDUGTBc20mC5C+6EhRT/VIig3IJbdTSC
AaolaakhkQ88wtbpbnxbUOI+DLcnMK1DDP8LA7WmeIXdNcwyPAFjWt7y+R6eLkzL
4KS0PqJkGiQeEsr/MVv9dz5hQvH4B3KbUizBN2rTgq4eilEYk5m0vkqroGl1k/Js
rWJOpj0v3tuaNfBJPdYwOQdu3Av9m1Q5h5JWmH+dW7PvP6HIGvphI/pW95e9YiBm
j1Tcbq46V5LYUgjzBWUuvx5WeO60cxI4yFtun1fdVAaa2JTYydhHqo8vAJhVzRjF
ndd2vu15UFNAVHu14MMOxW6I9QHt0/OEnOtKnj1FH/89goXLf4WdMi18HxBdmDjd
ktEE4XJGxCvzeKwo8/CR9G46W+bbFJ+aQ8N5aBbVFuRoz0Mw6P/R57pqjUHU4xn1
8BW1iF8KfJJD+sfYrpvq
=grQA
-----END PGP SIGNATURE-----

--Sig_/z1g+Zviz9pkwepjS67Oah3d--
