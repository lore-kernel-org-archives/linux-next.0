From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pidfd tree with the kbuild tree
Date: Thu, 2 May 2019 18:31:25 +1000
Message-ID: <20190502183125.3b53300e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/c7UPOCWZDr0blwyXwvs0FsM"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Brauner <christian@brauner.io>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/c7UPOCWZDr0blwyXwvs0FsM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pidfd tree got a conflict in:

  samples/Makefile

between commit:

  a757ed09d672 ("samples: guard sub-directories with CONFIG options")

from the kbuild tree and commit:

  eb364bbe6791 ("samples: show race-free pidfd metadata access")

from the pidfd tree.

I fixed it up (iI did the minimal fixup - see below) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc samples/Makefile
index 0f2d70d785f5,fadadb1c3b05..000000000000
--- a/samples/Makefile
+++ b/samples/Makefile
@@@ -1,21 -1,6 +1,21 @@@
 +# SPDX-License-Identifier: GPL-2.0
  # Makefile for Linux samples code
 =20
 -obj-$(CONFIG_SAMPLES)	+=3D kobject/ kprobes/ trace_events/ livepatch/ \
 -			   hw_breakpoint/ kfifo/ kdb/ hidraw/ rpmsg/ seccomp/ \
 -			   configfs/ connector/ v4l/ trace_printk/ \
 -			   vfio-mdev/ statx/ qmi/ binderfs/ pidfd/
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
 +subdir-$(CONFIG_SAMPLE_STATX)		+=3D statx
 +obj-$(CONFIG_SAMPLE_TRACE_EVENTS)	+=3D trace_events/
 +obj-$(CONFIG_SAMPLE_TRACE_PRINTK)	+=3D trace_printk/
 +obj-$(CONFIG_VIDEO_PCI_SKELETON)	+=3D v4l/
- obj-y					+=3D vfio-mdev/
++obj-y					+=3D vfio-mdev/ pidfd/

--Sig_/c7UPOCWZDr0blwyXwvs0FsM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzKqt0ACgkQAVBC80lX
0Gz0eQf+Kbg+tH0icN2dRRvQWMLlgOKX/9kxBiFC7qi47prbysX+cs7HmRiwp5gs
/1p3ro92jaoM9X1vHnVQHdVVwZ+eqZAdXeMwSsAScE3ifVQP69WCGo0Sm0On4X7z
7AKwmdZBsTc2RTel0gbnficnFYiTzDmNY9pP7oGbEXFx8WKOKJE/IyePdynE0BLm
6cZV7hxpYiIy2MeFXyeSOuRxaRuMTqMmO4oHPN2JFHS0J5bN/L4S4hNV6KQ6vgtC
RbgWhlZD5Ar440AAPM5wYcUPadIekJNlWXcwUCExaPYXf3x5Fa1Q/zWeOZnVj8Kf
IcsexXLWoO9F8WRuStyc4FFIf4S5UA==
=4Pn4
-----END PGP SIGNATURE-----

--Sig_/c7UPOCWZDr0blwyXwvs0FsM--
