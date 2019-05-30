From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the akpm-current tree
Date: Thu, 30 May 2019 14:55:25 +1000
Message-ID: <20190530145525.3cca17cb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/8aSEcKm1n18JLWopbjCv0hG"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matteo Croce <mcroce@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/8aSEcKm1n18JLWopbjCv0hG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

net/tipc/sysctl.c:42:12: warning: 'one' defined but not used [-Wunused-vari=
able]
 static int one =3D 1;
            ^~~
net/tipc/sysctl.c:41:12: warning: 'zero' defined but not used [-Wunused-var=
iable]
 static int zero;
            ^~~~

Introduced by commit

  6a33853c5773 ("proc/sysctl: add shared variables for range check")

--=20
Cheers,
Stephen Rothwell

--Sig_/8aSEcKm1n18JLWopbjCv0hG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzvYj0ACgkQAVBC80lX
0GwB6wgAmmW1oDLUmcW6Jc2Q79FQC0TF/nrsmwrnrFajk64ae3ZfZYJpfRZn++9p
QyqqPNyEIKbIeFEZ2TG30LPZ6NgKStitxF4MhgnUr25NEmp1WjoCbniZhxNy4YG/
7VezifgRRiWkaTEHWutSDvdyiq3y6lR9K6flYYr2oQhpCnvqlAWLVyn6gJNTh9Vu
boELoEuJsePyiayxjK/Hryp4QW2b2QVMlU3uooueo7mVRUsxzeNd/nwiEgLFmmEO
e/3rDYA8yhCNKSy2zWw+40bSjpVY5MTm0moLBOM9Gnw4aTZcVyPtG+Pq4fpnED+T
w8ClR4AEddix/9uKLHAAw4mDvuSQFA==
=kH6a
-----END PGP SIGNATURE-----

--Sig_/8aSEcKm1n18JLWopbjCv0hG--
