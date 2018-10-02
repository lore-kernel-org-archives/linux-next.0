From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the cisco tree with the vfs tree
Date: Tue, 2 Oct 2018 16:29:23 +1000
Message-ID: <20181002162923.13f3f8b1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/DGnAiWvvdTQppxHM424be+R"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Walker <dwalker@fifo99.com>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/DGnAiWvvdTQppxHM424be+R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

Today's linux-next merge of the cisco tree got a conflict in:

  arch/x86/kernel/setup.c

between commit:

  dcf8001d292b ("vfs: Suppress MS_* flag defs within the kernel unless expl=
icitly enabled")

from the vfs tree and commit:

  2c070709ea75 ("This updates the x86 code to use the CONFIG_GENERIC_CMDLIN=
E")

from the cisco tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/x86/kernel/setup.c
index e493202bf265,ee109f490b22..000000000000
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@@ -51,7 -51,7 +51,8 @@@
  #include <linux/kvm_para.h>
  #include <linux/dma-contiguous.h>
  #include <xen/xen.h>
 +#include <uapi/linux/mount.h>
+ #include <linux/cmdline.h>
 =20
  #include <linux/errno.h>
  #include <linux/kernel.h>

--Sig_/DGnAiWvvdTQppxHM424be+R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluzEEMACgkQAVBC80lX
0GxkxQf9EE7kzod4YuuKGXoIWpIs4EMSYXo2/oGkQNSYWpA97vD5Dj3RuJ+nn710
eULcFfq/pHyYntMmfOCW5Zf+DEDngxmL7TbMDbGKGuPE0CQfhKdyOhuFo/C4EUCp
17HWd4Pw9nwbvB9qp84yfQ65XMduq+c8l4g20GkYcPHHZJgP2eS7e80xcRsINDpi
duVYvewtqf6QDnjRinJMX9juQyrXJHBSAme4LQ484j2SDM5METom44+WAgTwd7mT
tzB7NrGTXlmdvObtASo0bVezMZa+MwIZWulSXfXEzaDn7PPuBRNfbSRi8CQ4/42o
pINYMcaGKOOGwz2XIwh+9TDIVkpgzA==
=FNcI
-----END PGP SIGNATURE-----

--Sig_/DGnAiWvvdTQppxHM424be+R--
