From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the device-mapper tree
Date: Sun, 24 Feb 2019 01:17:14 +1100
Message-ID: <20190224011714.0d72b6ad@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1jNdi.VcJAdx5+P6/1zIl/1"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/1jNdi.VcJAdx5+P6/1zIl/1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  eeee919c8a63 ("dm: always call blk_queue_split() in dm_process_bio()")

Fixes tag

  Fixes: 568c73a355e ("dm: update dm_process_bio() to split bio if in ->mak=
e_request_fn()")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/1jNdi.VcJAdx5+P6/1zIl/1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxxVeoACgkQAVBC80lX
0GyjcAf+LhRt827AX4Q9A+S8sxCNq2kgWch4Tqnv4TtWWUnVoHEPB06QdDsXoEn7
FUQ/MvFCZSJldaD689qJneGTNLL4UPLzf/8JRpOP/sFtdbEnkZgs3AMRZHE2cVG0
jpccyM4mv/sc3HxMWWoa/+bFk7fWAd+vrtUts0VhXeEKrwtfxSD6vBh3odZ9t86z
bfqMLZd4973jAh5fPYUq7yELQVZtupeklbLbQ6N6irBmnSdk5aU2p/xAQpdGVDm4
A+Z35UcLepCtLHXILyPfwG9E8AH/3+zq+yb+GyDY23CngOGJ2iXPzWW31be92Sjr
SailG8oLiUigMv/tSY++rAbGPDFsvw==
=eDnb
-----END PGP SIGNATURE-----

--Sig_/1jNdi.VcJAdx5+P6/1zIl/1--
