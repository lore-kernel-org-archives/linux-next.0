From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the nfs-anna tree
Date: Wed, 16 Jan 2019 08:38:31 +1100
Message-ID: <20190116083831.256824cf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1h5dzV+7Tjewx0X38wEgIld"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Anna Schumaker <Anna.Schumaker@Netapp.com>, Trond Myklebust <trondmy@gmail.com>, NFS Mailing List <linux-nfs@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Chuck Lever <chuck.lever@oracle.com>, Paul Gortmaker <paul.gortmaker@windriver.com>
List-Id: linux-next.vger.kernel.org

--Sig_/1h5dzV+7Tjewx0X38wEgIld
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

[I am experimenting with checking the Fixes tags in commits in linux-next.
Please let me know if you think I am being too strict.]

Hi all,

Commit

  deaa5c96c2f7 ("SUNRPC: Address Kerberos performance/behavior regression")

has problem with this Fixes tag:

  Fixes: 918f3c1fe83c ("SUNRPC: Improve latency for interactive ... ")

The subject should match the subject of the fixed commit.

--=20
Cheers,
Stephen Rothwell

--Sig_/1h5dzV+7Tjewx0X38wEgIld
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlw+UtcACgkQAVBC80lX
0GwZXggAmPnNzm6PKW98wUJiTP8uO8hDUoiKhdWOboko6FhJ2zDgs33TBvC2A1kV
2KymX1+/ngBJL4uzMJE/hmtV3YdyQ/7AEhglL9g4Oa/RLvx7s34TGq3tk6p9w1X+
o2QmYndmjvTAr5BuvB9M+5/bxFoKIoA4AHLUAy6Jc0zgp8UOIy1mfFDrszvkTxpl
omyXwc0qgrE+/rCx5q2HdIkhIBFaBUibwnrlamSMZwz1jmFm+QpqyHi95xNwayct
cELMWxJlRR5BPLtyFhYwjV/D0UFxbx6hi94aN30R0CD0pVqYrMmXoXzAGFUMyY0h
9qdkRd/GWAUWzPXbQibO8QjEcuDtSA==
=+UWx
-----END PGP SIGNATURE-----

--Sig_/1h5dzV+7Tjewx0X38wEgIld--
