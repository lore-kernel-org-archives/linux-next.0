From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the staging tree with the block
 tree
Date: Wed, 8 May 2019 13:44:13 +1000
Message-ID: <20190508134413.26a13d00@canb.auug.org.au>
References: <20190501170528.2d86d133@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/PTiqtRjs/NzDhQUMKyeXWF="; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190501170528.2d86d133@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>
Cc: Greg KH <greg@kroah.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Gao Xiang <gaoxiang25@huawei.com>
List-Id: linux-next.vger.kernel.org

--Sig_/PTiqtRjs/NzDhQUMKyeXWF=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 1 May 2019 17:05:28 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the staging tree got conflicts in:
>=20
>   drivers/staging/erofs/data.c
>   drivers/staging/erofs/unzip_vle.c
>=20
> between commit:
>=20
>   2b070cfe582b ("block: remove the i argument to bio_for_each_segment_all=
")
>=20
> from the block tree and commit:
>=20
>   14a56ec65bab ("staging: erofs: support IO read error injection")
>=20
> from the staging tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc drivers/staging/erofs/data.c
> index 9f04d7466c55,c64ec76643d4..000000000000
> --- a/drivers/staging/erofs/data.c
> +++ b/drivers/staging/erofs/data.c
> @@@ -17,11 -17,18 +17,17 @@@
>  =20
>   static inline void read_endio(struct bio *bio)
>   {
> + 	struct super_block *const sb =3D bio->bi_private;
>  -	int i;
>   	struct bio_vec *bvec;
> - 	const blk_status_t err =3D bio->bi_status;
> + 	blk_status_t err =3D bio->bi_status;
>   	struct bvec_iter_all iter_all;
>  =20
> + 	if (time_to_inject(EROFS_SB(sb), FAULT_READ_IO)) {
> + 		erofs_show_injection_info(FAULT_READ_IO);
> + 		err =3D BLK_STS_IOERR;
> + 	}
> +=20
>  -	bio_for_each_segment_all(bvec, bio, i, iter_all) {
>  +	bio_for_each_segment_all(bvec, bio, iter_all) {
>   		struct page *page =3D bvec->bv_page;
>  =20
>   		/* page is already locked */
> diff --cc drivers/staging/erofs/unzip_vle.c
> index 59b9f37d5c00,a2e03c932102..000000000000
> --- a/drivers/staging/erofs/unzip_vle.c
> +++ b/drivers/staging/erofs/unzip_vle.c
> @@@ -843,14 -844,13 +844,12 @@@ static void z_erofs_vle_unzip_kickoff(v
>  =20
>   static inline void z_erofs_vle_read_endio(struct bio *bio)
>   {
> - 	const blk_status_t err =3D bio->bi_status;
> + 	struct erofs_sb_info *sbi =3D NULL;
> + 	blk_status_t err =3D bio->bi_status;
>  -	unsigned int i;
>   	struct bio_vec *bvec;
> - #ifdef EROFS_FS_HAS_MANAGED_CACHE
> - 	struct address_space *mc =3D NULL;
> - #endif
>   	struct bvec_iter_all iter_all;
>  =20
>  -	bio_for_each_segment_all(bvec, bio, i, iter_all) {
>  +	bio_for_each_segment_all(bvec, bio, iter_all) {
>   		struct page *page =3D bvec->bv_page;
>   		bool cachemngd =3D false;
>  =20

This conflict is now between the block tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/PTiqtRjs/NzDhQUMKyeXWF=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzSUI0ACgkQAVBC80lX
0GznYgf+PLM8FVE3+eBJHgcShX3cPz6dCuWcOYWHXHcCWT5gnmOqutY1Xrbn1NFG
l0XjkULZPCPJOgsWoVqKA/bJzav17VCR/ArGToeGP3YzCe6COuYSP7tq5WtFiZT7
JktCqCSOWcmQBkXDWcNkv8Ie84cUOR738hX2CG45tUvhYYw+6sVrlJ7NWtoF7n2d
3WuZufHUryMyJ9NKWlnUpIHu2G0R83nCsyUYEl5qsHgfTDi7ZJkPXDdMksq6tIfl
kBM1JZs+WqecuP6kUtRNlUai9sBl/iOkSnQk84KnrrVJSn8GzHL8+I0Zbx2YJuqn
ySO/viGKh+18hUQrv85y758ZVwWmeA==
=aat7
-----END PGP SIGNATURE-----

--Sig_/PTiqtRjs/NzDhQUMKyeXWF=--
