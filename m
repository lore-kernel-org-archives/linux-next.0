From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the kbuild tree
Date: Fri, 3 May 2019 11:20:58 +1000
Message-ID: <20190503112058.51336cd2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/N64jm+8l.uMFzxF4YR8ioZQ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/N64jm+8l.uMFzxF4YR8ioZQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  samples/Makefile

between commit:

  a757ed09d672 ("samples: guard sub-directories with CONFIG options")

from the kbuild tree and commit:

  f1b5618e013a ("vfs: Add a sample program for the new mount API")

from the vfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc samples/Makefile
index 0f2d70d785f5,95d71ffd62d5..000000000000
--- a/samples/Makefile
+++ b/samples/Makefile
@@@ -1,21 -1,6 +1,21 @@@
 +# SPDX-License-Identifier: GPL-2.0
  # Makefile for Linux samples code
 =20
 -obj-$(CONFIG_SAMPLES)	+=3D kobject/ kprobes/ trace_events/ livepatch/ \
 -			   hw_breakpoint/ kfifo/ kdb/ hidraw/ rpmsg/ seccomp/ \
 -			   configfs/ connector/ v4l/ trace_printk/ \
 -			   vfio-mdev/ vfs/ qmi/ binderfs/
 +obj-$(CONFIG_SAMPLE_ANDROID_BINDERFS)	+=3D binderfs/
 +obj-$(CONFIG_SAMPLE_CONFIGFS)		+=3D configfs/
 +obj-$(CONFIG_SAMPLE_CONNECTOR)		+=3D connector/
 +subdir-y				+=3D hidraw
 +obj-$(CONFIG_SAMPLE_HW_BREAKPOINT)	+=3D hw_breakpoint/
 +obj-$(CONFIG_SAMPLE_KDB)		+=3D kdb/
 +obj-$(CONFIG_SAMPLE_KFIFO)		+=3D kfifo/
 +obj-$(CONFIG_SAMPLE_KOBJECT)		+=3D kobject/
 +obj-$(CONFIG_SAMPLE_KPROBES)		+=3D kprobes/
 +obj-$(CONFIG_SAMPLE_LIVEPATCH)		+=3D livepatch/
 +obj-$(CONFIG_SAMPLE_QMI_CLIENT)		+=3D qmi/
 +obj-$(CONFIG_SAMPLE_RPMSG_CLIENT)	+=3D rpmsg/
 +subdir-$(CONFIG_SAMPLE_SECCOMP)		+=3D seccomp
- subdir-$(CONFIG_SAMPLE_STATX)		+=3D statx
++subdir-$(CONFIG_SAMPLE_VFS)		+=3D vfs
 +obj-$(CONFIG_SAMPLE_TRACE_EVENTS)	+=3D trace_events/
 +obj-$(CONFIG_SAMPLE_TRACE_PRINTK)	+=3D trace_printk/
 +obj-$(CONFIG_VIDEO_PCI_SKELETON)	+=3D v4l/
 +obj-y					+=3D vfio-mdev/

--Sig_/N64jm+8l.uMFzxF4YR8ioZQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzLl3oACgkQAVBC80lX
0GyrEAf7BSGoO46Jk1cooZRmJFrWn9IvYS7DhIYtLoa64TxgHKaJPGXyqvTcn5h8
DqjObvygN6PGwIxeXjfoj/TX4BBZd3vYTE7obcB4KJcysAeiMn2UU7Oyii2zoWFM
/c6RQz31K/yWsPPo58b0b7Cqz+AObXiijcYVO1rZoR999LHyEmqA6WaJSUixhlrS
KjlavZUVkwspxUqDbzm1OtcprLFPadAZMYEQQJv2VcleI6ayvI29ah/9QK6tCzYV
t2dCgUsK3kHJUVIH+uLFF9NWjUiT8fYQ1DWMDGFojuyF+PCKRh16deQk0hQ2G90d
XK01NnjqHH4AoKMqbdlYDCr9BWzG5A==
=xQvL
-----END PGP SIGNATURE-----

--Sig_/N64jm+8l.uMFzxF4YR8ioZQ--
