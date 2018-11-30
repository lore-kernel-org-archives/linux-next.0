From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the akpm tree
Date: Fri, 30 Nov 2018 16:40:30 +1100
Message-ID: <20181130164030.3dbeb8b4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/yiQl9OK0_w+H=ql+FP9TfeD"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dave Rodgman <dave.rodgman@arm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/yiQl9OK0_w+H=ql+FP9TfeD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

After merging the akpm tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

lib/lzo/lzo1x_compress.c: In function 'lzo1x_1_do_compress':
lib/lzo/lzo1x_compress.c:239:14: warning: 'm_pos' may be used uninitialized=
 in this function [-Wmaybe-uninitialized]
   m_off =3D ip - m_pos;
           ~~~^~~~~~~
Probably introduced by patch

  "lib/lzo: implement run-length encoding"
or
  "lib/lzo: separate lzo-rle from lzo"

--=20
Cheers,
Stephen Rothwell

--Sig_/yiQl9OK0_w+H=ql+FP9TfeD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwAzU4ACgkQAVBC80lX
0Gz3gAf/eue7DBYUc3dJFaInC25gKclZKgmetu5lVK+oKZBhXeglywuahWGUxgID
y1Fe2yBq8UXeWD3nWm9wt6JC1cy4V4mlNszJ2OPlncFCCVzo7J09Oiu19k+vpaEQ
lxwWIxel0hxxulehpbDjyBExcR/NY9jH4KO2iDLC1RfRep//hj5ULF9aAAS0uroo
jKCDYnJUM4R92bw//gX+8EvGrlRmQq0BA4A3dEWIgzb4DpU9IgfKarNxssbfsPRa
PDVYM91Fwn07DbNWplhHU+qCZ1c0xIRaNSq0X4OefyHsiW0u4TedID1ZVrwA88rt
4T5VHyCyzatz7kQyVX3w7ciw8pr7wg==
=iur9
-----END PGP SIGNATURE-----

--Sig_/yiQl9OK0_w+H=ql+FP9TfeD--
