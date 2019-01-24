From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the extcon tree
Date: Thu, 24 Jan 2019 14:47:13 +1100
Message-ID: <20190124144713.4330ec34@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Qz.oxVF1fMg4gYXz078cjHL"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/Qz.oxVF1fMg4gYXz078cjHL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Chanwoo,

After merging the extcon tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

WARNING: modpost: missing MODULE_LICENSE() in drivers/extcon/extcon-ptn5150=
.o
see include/linux/module.h for more information

Introduced by commit

  58963276749e ("extcon: Add support for ptn5150 extcon driver")

--=20
Cheers,
Stephen Rothwell

--Sig_/Qz.oxVF1fMg4gYXz078cjHL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxJNUEACgkQAVBC80lX
0Gy8AAf+JOdLe5KesDkaE3AnUAYa10Y59avkjtPq19tfPBkCBpzfVG/foTbuZs6j
VCvTrdz2es5R2ck6RODZzAOqii/j2GBfX30hKsQ4owaPjUb10wZQjSgCLr8joR1h
zjPeDGe0fGJbTBRmgK2gLBEdmRvU8hmyDshIclykvuynAG6aMu1Up0fo8r+h/g5W
V9J5SXiwtF61dcLreJtq916mycS8/g488WnKuXgnehScHzwrFA9OeZ3ERzw7WYQu
NsM6EXuRH46eUfe5bZod30eXXT8PWf20hsls0F3Y0SNFRwdWtU2p6rurMvmdPS9h
D/80Eawg3/h/QIZ75R8d2Jmcml01rQ==
=gDAh
-----END PGP SIGNATURE-----

--Sig_/Qz.oxVF1fMg4gYXz078cjHL--
