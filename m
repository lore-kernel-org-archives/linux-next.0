From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the char-misc tree with the drm tree
Date: Wed, 17 Oct 2018 14:22:57 +1100
Message-ID: <20181017142257.5002799b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/u6tzD0qr8bKobG/tey.t=0x"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, Dan Williams <dan.j.williams@intel.com>, Alexander Viro <viro@zeniv.linux.org.uk>
List-Id: linux-next.vger.kernel.org

--Sig_/u6tzD0qr8bKobG/tey.t=0x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  MAINTAINERS

between commit:

  fbb0de795078 ("Add udmabuf misc device")

from the drm tree and commit:

  9793c1fd1775 ("MAINTAINERS: Clarify UIO vs UIOVEC maintainer")

from the char-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index 7d70a6c5eeee,a38c13c7da9a..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -15594,14 -15365,12 +15595,20 @@@ F:	arch/x86/um
  F:	fs/hostfs/
  F:	fs/hppfs/
 =20
+ USERSPACE COPYIN/COPYOUT (UIOVEC)
+ M:	Alexander Viro <viro@zeniv.linux.org.uk>
+ S:	Maintained
+ F:	lib/iov_iter.c
+ F:	include/linux/uio.h
+=20
 +USERSPACE DMA BUFFER DRIVER
 +M:	Gerd Hoffmann <kraxel@redhat.com>
 +S:	Maintained
 +L:	dri-devel@lists.freedesktop.org
 +F:	drivers/dma-buf/udmabuf.c
 +F:	include/uapi/linux/udmabuf.h
 +T:	git git://anongit.freedesktop.org/drm/drm-misc
 +
  USERSPACE I/O (UIO)
  M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  S:	Maintained

--Sig_/u6tzD0qr8bKobG/tey.t=0x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvGqxEACgkQAVBC80lX
0Gw6iQf/cDYDE0VokyqOGGwFDaVpEMwzmWcDAm/nI3Df0a43ROCRebxEFJkBCE/X
XR9ERvs44oXOBvMIC3MVYBXkZJVb5jhjgcXQtNoUPjVpEwQiL5rIQhZ8JQDQC7lO
7BLGYi08A92x0r+kBd4gB+IxbczbuMeONVhBivfEprDlmxXB3xeykAkDb2I98V7m
706r1WuhI1p6TkgGzKOS6g68JVXBNpGFc9Y8kkeY3hFO+hbKijvdmdoVenqULSYW
u0ErCgxjSqntIu1s6mzltEvjTh4FV75PJZ1rtOriDGY3mcXzli2uicehIAvDxkND
rWwFKXt0AGW/4/h1PMP1HE3gXjE5DQ==
=bMUP
-----END PGP SIGNATURE-----

--Sig_/u6tzD0qr8bKobG/tey.t=0x--
