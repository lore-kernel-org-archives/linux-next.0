From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the fsi tree
Date: Tue, 24 Jul 2018 16:03:56 +1000
Message-ID: <20180724160356.7f5a018d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/WqxBh6ysu54ywQm7mPM.b+i"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/WqxBh6ysu54ywQm7mPM.b+i
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Benjamin,

After merging the fsi tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

In file included from include/linux/printk.h:336:0,
                 from include/linux/kernel.h:14,
                 from include/linux/delay.h:22,
                 from drivers/fsi/fsi-master-ast-cf.c:8:
drivers/fsi/fsi-master-ast-cf.c: In function 'fsi_master_acf_read':
drivers/fsi/fsi-master-ast-cf.c:609:23: warning: format '%u' expects argume=
nt of type 'unsigned int', but argument 6 has type 'size_t {aka long unsign=
ed int}' [-Wformat=3D]
  dev_dbg(master->dev, "read id %d addr %x size %ud\n", id, addr, size);
                       ^
include/linux/dynamic_debug.h:135:39: note: in definition of macro 'dynamic=
_dev_dbg'
   __dynamic_dev_dbg(&descriptor, dev, fmt, \
                                       ^~~
include/linux/device.h:1428:23: note: in expansion of macro 'dev_fmt'
  dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
                       ^~~~~~~
drivers/fsi/fsi-master-ast-cf.c:609:2: note: in expansion of macro 'dev_dbg'
  dev_dbg(master->dev, "read id %d addr %x size %ud\n", id, addr, size);
  ^~~~~~~
drivers/fsi/fsi-master-ast-cf.c: In function 'fsi_master_acf_write':
drivers/fsi/fsi-master-ast-cf.c:634:23: warning: format '%u' expects argume=
nt of type 'unsigned int', but argument 6 has type 'size_t {aka long unsign=
ed int}' [-Wformat=3D]
  dev_dbg(master->dev, "write id %d addr %x size %ud raw_data: %08x\n",
                       ^
include/linux/dynamic_debug.h:135:39: note: in definition of macro 'dynamic=
_dev_dbg'
   __dynamic_dev_dbg(&descriptor, dev, fmt, \
                                       ^~~
include/linux/device.h:1428:23: note: in expansion of macro 'dev_fmt'
  dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
                       ^~~~~~~
drivers/fsi/fsi-master-ast-cf.c:634:2: note: in expansion of macro 'dev_dbg'
  dev_dbg(master->dev, "write id %d addr %x size %ud raw_data: %08x\n",
  ^~~~~~~

Introduced by commit

  6a794a27daca ("fsi: master-ast-cf: Add new FSI master using Aspeed ColdFi=
re")

--=20
Cheers,
Stephen Rothwell

--Sig_/WqxBh6ysu54ywQm7mPM.b+i
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltWwUwACgkQAVBC80lX
0Gz3HAf/Ucki1Bzw1wcwaHLY51E4H6yjqKTZMPeNNj9hpU3iAOHTNp2u1hjprs9T
Fffqsf5GG1hO0SDZ2HoY03cXrFqUlXnS7BZmbWKsHJcXriO8wRN0fq1HD+qeB9sT
1QCFwImzFeQcqMSqlGy+AnD+5dJMwHb91aJ1QWhOpd+4883xe+iLeiySTo75ra2Y
LQq+pjgkOFutuWnTov2CHPamRJIDctvTkfYkccZF9syZt4vELGcCq/ujfNZPaYDd
j7z6gKDPWuzQuJnl0NO4JCQKXxhXn9ARPxOsMWxXmMvwdCt+g03ur5mlGfIy+F2x
7SrtfexRLadFSOYS3ngFdrzYxJnXRg==
=cRpY
-----END PGP SIGNATURE-----

--Sig_/WqxBh6ysu54ywQm7mPM.b+i--
