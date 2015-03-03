From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the md tree
Date: Tue, 3 Mar 2015 13:35:31 +1100
Message-ID: <20150303133531.72f10682@canb.auug.org.au>
References: <20150302165057.29087a08@canb.auug.org.au>
	<20150302170345.742add96@notabene.brown>
	<20150302171149.0a62b072@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/F.YG7AZ3_uudzX48Zi+tX/E"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150302171149.0a62b072@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: NeilBrown <neilb@suse.de>
Cc: Goldwyn Rodrigues <rgoldwyn@suse.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Sig_/F.YG7AZ3_uudzX48Zi+tX/E
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Neil,

On Mon, 2 Mar 2015 17:11:49 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Mon, 2 Mar 2015 17:03:45 +1100 NeilBrown <neilb@suse.de> wrote:
> >
> > I think
> > +               bm_blocks =3D DIV_ROUND_UP(bm_blocks, 4096);
> >=20
> > needs DIV_ROUND_UP_SECTOR_T()
>=20
> I tried that and it was not sufficient.
>=20
> > The first patch you identified adds that line.  The second relocates it.
>=20
> The second also changes this:
>=20
> bm_blocks =3D sector_div(bitmap->mddev->resync_max_sectors, (chunksize >>=
 9));
>=20
> (added by the first) to this:
>=20
> bm_blocks =3D bitmap->mddev->resync_max_sectors / (bitmap->mddev->bitmap_=
info.chunksize >> 9);
>=20
> where bitmap->mddev->resync_max_sectors is a sector_t ...

So I applied this patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 3 Mar 2015 13:30:26 +1100
Subject: [PATCH] md/bitmap: use sector_div for sector_t divisions

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/md/bitmap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/md/bitmap.c b/drivers/md/bitmap.c
index 23f575f0cd92..d40398404ab6 100644
--- a/drivers/md/bitmap.c
+++ b/drivers/md/bitmap.c
@@ -573,7 +573,8 @@ re_read:
 	if (bitmap->cluster_slot >=3D 0) {
 		long long bm_blocks;
=20
-		bm_blocks =3D bitmap->mddev->resync_max_sectors / (bitmap->mddev->bitmap=
_info.chunksize >> 9);
+		bm_blocks =3D sector_div(bitmap->mddev->resync_max_sectors,
+				       bitmap->mddev->bitmap_info.chunksize >> 9);
 		bm_blocks =3D bm_blocks << 3;
 		bm_blocks =3D DIV_ROUND_UP_SECTOR_T(bm_blocks, 4096);
 		bitmap->mddev->bitmap_info.offset +=3D bitmap->cluster_slot * (bm_blocks=
 << 3);
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/F.YG7AZ3_uudzX48Zi+tX/E
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU9R33AAoJEMDTa8Ir7ZwVMGcP/0a7KOnjr9sWygWdDXuKXsc6
cWTTIVJz99tikAnvqo9XDBs5WhGeP2LMmPER81SFidp+MmSIBmQ6M3NJmEaJyo9j
qnAqZa7ouWwicTy+dRl+sj0YyL3JCtGG8so1QykTHDdsHbcMHDVFX5aQ96mg3DZp
VAgaMt+kC7qpcCE4Oj/kEf9T0109j0EQQSm+NyIFRS2Xk9Baa3wI35uf3p6E6giR
f1LSvm7WNLy503nFDPmRpXinDIAc0i6p8/Yfxma6RIRHWykzUYNIRa7f2sSqvyeI
ShJKG/YzO8D+ReEYHww9cWMH+r16oqTOA/V4pWHxFLthxGsaazWcoVWGPSV4uYXm
dSjSP0oJtlNbTZhnRbYaj6HZaOQb/6V79regcDiO1ry2CuPj/etm3y3W7DHUFI0e
BEJWrnBLfL/V7yRIlv1hKMgcGNGd5w2XvfySb4FgztZ/uM75cz85rRqYagRr67Du
v0lXurqfGHrjhBLtXB4arXrBm8hwgtUQuUAmZjMwVEGxSYpliHFjpDrSD3igyd8X
/NpN4jUei2txIYpO3bCZU0GLQ44bDKxY5dEyF4uKwqYsVD2hV18JXspiQQyxcTIF
ZYmpXgqCdWppJPhcPOEABryMKpS9Xc8y5mLK9cGc5ngi+N0Y0uas5CB/Cp98d6Qc
SQUTD/+wEeaBxGiRlgcM
=p2+i
-----END PGP SIGNATURE-----

--Sig_/F.YG7AZ3_uudzX48Zi+tX/E--
