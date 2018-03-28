From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the kbuild tree
Date: Thu, 29 Mar 2018 08:58:09 +1100
Message-ID: <20180329085809.78af08ff@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/yYMVloRgW.c8.CUA3IdrAEv"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/yYMVloRgW.c8.CUA3IdrAEv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

After merging the kbuild tree, today's linux-next build (x86_64
allmodconfig) failed like this:

net/ipv4/netfilter/nf_nat_snmp_basic_main.c:57:10: fatal err
or: nf_nat_snmp_basic.asn1.h: No such file or directory
 #include "nf_nat_snmp_basic.asn1.h"
          ^~~~~~~~~~~~~~~~~~~~~~~~~~

Presuambly caused by commit

  9ee1b1bb8743 ("kbuild: rename *-asn1.[ch] to *.asn1.[ch]")

though I am not sure why it didn't fail yesterday.

I reverted that commit (and the following one because of a conflict)
for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/yYMVloRgW.c8.CUA3IdrAEv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlq8D/EACgkQAVBC80lX
0GxC0Af/USeKpvx3Nz9eaWH+MaWoUqRW1vs2C9UUIN5KrJcTiwtfnT9aUdcI7FJv
WzhoheM99d1ldjB+SfoZ3hUq5bA48BuqA2qeAihqcCJxjIpGciFBLLlNO0os68hT
f+0EaqHh3lEhSQ9HrAkhrAnGw6DvYQh5ksb2c7x5JIbnZu2kmDYrvrgBsT0cysLE
E2EDvkhSBK1Dgd2ktMeb0iUUZHuBmFtStQIYJxeKnTUoqVxG1/YihwBSOvXSbyyx
yxt61T25xNdDp5sev2ZHOqe7H/0OZlGa4ccGPfEoCk8hZYwpUyf0FrjSh+ORLh0G
EnbPqRwO2veQm2GoHfGhvzPpmRDEXw==
=cKJV
-----END PGP SIGNATURE-----

--Sig_/yYMVloRgW.c8.CUA3IdrAEv--
