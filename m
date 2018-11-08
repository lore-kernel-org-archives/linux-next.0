From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the staging tree
Date: Thu, 8 Nov 2018 13:33:07 +1100
Message-ID: <20181108133307.5cca74cb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/SlwN=.sg9eZoil28NjwGF1V"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ioannis Valasakis <code@wizofe.uk>
List-Id: linux-next.vger.kernel.org

--Sig_/SlwN=.sg9eZoil28NjwGF1V
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

After merging the staging tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

In file included from include/linux/printk.h:336,
                 from include/linux/kernel.h:14,
                 from include/linux/clk.h:16,
                 from drivers/staging/media/tegra-vde/tegra-vde.c:12:
drivers/staging/media/tegra-vde/tegra-vde.c: In function 'tegra_vde_setup_i=
ram_tables':
drivers/staging/media/tegra-vde/tegra-vde.c:265:5: warning: format '%d' exp=
ects argument of type 'int', but argument 6 has type 'long unsigned int' [-=
Wformat=3D]
     "\tFrame %d: frame_num =3D %d B_frame =3D %d\n",
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/dynamic_debug.h:135:39: note: in definition of macro 'dynamic=
_dev_dbg'
   __dynamic_dev_dbg(&descriptor, dev, fmt, \
                                       ^~~
include/linux/device.h:1463:23: note: in expansion of macro 'dev_fmt'
  dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
                       ^~~~~~~
drivers/staging/media/tegra-vde/tegra-vde.c:264:4: note: in expansion of ma=
cro 'dev_dbg'
    dev_dbg(vde->miscdev.parent,
    ^~~~~~~

Introduced by commit

  42e764d05712 ("staging: tegravde: replace bit assignment with macro")

--=20
Cheers,
Stephen Rothwell

--Sig_/SlwN=.sg9eZoil28NjwGF1V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvjoGMACgkQAVBC80lX
0GzFTQf/fxQQacT0/1z3/WM1XuEtJhPZJDlZaevKTlvX+a6MimCcKeJJtRsq3I1H
s2ywSVuErjhGP1xVmHsohNcbGzXH/MUzypje13RBFHNcZ8vPC0N6BGywl9E0V1P6
nNnBruWQoUrX1bNafEzw2+++1W8YbkVmwTNY4skt6LZnkZaNNW/UWdObjf+MYNUz
rqimDqcRNGLnEpLFyg+M9/VXhRaKf5OLYliScxgZX0d39weO9Su4V+sk4FdyXKcl
DojTaX1/Lckgg+0dgNocX4hbl2jEhPGcGRM9KZkIqpHGVJ1A9KYhUFReSU90mmob
n55UjTtdv1cBR5FcraZmlIhtP8m1tQ==
=MIAK
-----END PGP SIGNATURE-----

--Sig_/SlwN=.sg9eZoil28NjwGF1V--
