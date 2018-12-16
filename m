From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the nfs-anna tree
Date: Mon, 17 Dec 2018 10:16:30 +1100
Message-ID: <20181217101630.292dd55e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/b7l4dzBjV_3487Zir6v2ChE"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Anna Schumaker <Anna.Schumaker@Netapp.com>, Trond Myklebust <trondmy@gmail.com>, NFS Mailing List <linux-nfs@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>
List-Id: linux-next.vger.kernel.org

--Sig_/b7l4dzBjV_3487Zir6v2ChE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the nfs-anna tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

/home/sfr/next/next/fs/nfs/nfsroot.c: In function 'root_nfs_data':
/home/sfr/next/next/fs/nfs/nfsroot.c:264:5: error: implicit declaration of =
function 'fmtcheck'; did you mean 'dst_check'? [-Werror=3Dimplicit-function=
-declaration]
     fmtcheck(tmp, "%s", 0), utsname()->nodename);
     ^~~~~~~~
     dst_check

Caused by commit

  66ab6f062d96 ("nfs: use fmtcheck() in root_nfs_data")

For some reason this did not turn up until I was building the
hwmon-staging tree (maybe some Kconfig change casued it to be built now),
so I have just reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/b7l4dzBjV_3487Zir6v2ChE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwW3M4ACgkQAVBC80lX
0GyWpgf7BzuNbWNvh4jN36sW2BhM9Xo6BJ5qswIWKQCwJtiEG/CWidEcKMnV0DB/
uIRij9FK45Yh0MgrWRkogTyQOnPTUyQckkBANRIOc6bKAflxT5+CzuqCtFYT263o
KInyRT+KW3kp2V+6CTmpddyiIE9PL5PtPpdtBe63MIwxZHnWkX/t7fKwZI1nV8aW
IX3TmybtKO6UKGYLEfVR9f+GikFhcodgfAzb9tVBBrv8vhr3c/Ifda0roQxHgrDr
8r7sypF0FI6A/SETXjgwy3BwEgVAH/eGjvGW7uhonGaEf9NEWB+L6XztGBQMp9bp
xZIjgZwRVNsrsmf8kosFIUp99viBng==
=O2WA
-----END PGP SIGNATURE-----

--Sig_/b7l4dzBjV_3487Zir6v2ChE--
