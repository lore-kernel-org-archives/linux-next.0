From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the scsi-fixes tree
Date: Fri, 14 Dec 2018 13:23:15 +1100
Message-ID: <20181214132315.601d020f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/MP+fv/9tCmEqLKxW+OW4IcR"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>, "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

--Sig_/MP+fv/9tCmEqLKxW+OW4IcR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  drivers/scsi/sd.c

between commit:

  61cce6f6eece ("scsi: sd: use mempool for discard special page")

from the scsi-fixes tree and commit:

  159b2cbf59f4 ("scsi: return blk_status_t from scsi_init_io and ->init_com=
mand")

from the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/scsi/sd.c
index bd0a5c694a97,4a6ed2fc8c71..000000000000
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@@ -760,10 -759,9 +760,10 @@@ static blk_status_t sd_setup_unmap_cmnd
  	unsigned int data_len =3D 24;
  	char *buf;
 =20
 -	rq->special_vec.bv_page =3D alloc_page(GFP_ATOMIC | __GFP_ZERO);
 +	rq->special_vec.bv_page =3D mempool_alloc(sd_page_pool, GFP_ATOMIC);
  	if (!rq->special_vec.bv_page)
- 		return BLKPREP_DEFER;
+ 		return BLK_STS_RESOURCE;
 +	clear_highpage(rq->special_vec.bv_page);
  	rq->special_vec.bv_offset =3D 0;
  	rq->special_vec.bv_len =3D data_len;
  	rq->rq_flags |=3D RQF_SPECIAL_PAYLOAD;
@@@ -794,10 -793,9 +795,10 @@@ static blk_status_t sd_setup_write_same
  	u32 nr_sectors =3D blk_rq_sectors(rq) >> (ilog2(sdp->sector_size) - 9);
  	u32 data_len =3D sdp->sector_size;
 =20
 -	rq->special_vec.bv_page =3D alloc_page(GFP_ATOMIC | __GFP_ZERO);
 +	rq->special_vec.bv_page =3D mempool_alloc(sd_page_pool, GFP_ATOMIC);
  	if (!rq->special_vec.bv_page)
- 		return BLKPREP_DEFER;
+ 		return BLK_STS_RESOURCE;
 +	clear_highpage(rq->special_vec.bv_page);
  	rq->special_vec.bv_offset =3D 0;
  	rq->special_vec.bv_len =3D data_len;
  	rq->rq_flags |=3D RQF_SPECIAL_PAYLOAD;
@@@ -825,10 -824,9 +827,10 @@@ static blk_status_t sd_setup_write_same
  	u32 nr_sectors =3D blk_rq_sectors(rq) >> (ilog2(sdp->sector_size) - 9);
  	u32 data_len =3D sdp->sector_size;
 =20
 -	rq->special_vec.bv_page =3D alloc_page(GFP_ATOMIC | __GFP_ZERO);
 +	rq->special_vec.bv_page =3D mempool_alloc(sd_page_pool, GFP_ATOMIC);
  	if (!rq->special_vec.bv_page)
- 		return BLKPREP_DEFER;
+ 		return BLK_STS_RESOURCE;
 +	clear_highpage(rq->special_vec.bv_page);
  	rq->special_vec.bv_offset =3D 0;
  	rq->special_vec.bv_len =3D data_len;
  	rq->rq_flags |=3D RQF_SPECIAL_PAYLOAD;

--Sig_/MP+fv/9tCmEqLKxW+OW4IcR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwTFBMACgkQAVBC80lX
0GxqRwf/XLCJ4f42zhZWrE+ELAXs/HnBUF4h+4N9VaWVcOkXxRnOMKCcs8k+wwi8
h8EZJ/ATLVH3COzMgHE0Td6mEYAArYmkDCUX0eeFNmWkxe6ZblULtE66+Xivy2N3
R5eCJN/JZdr8uz1RQDk6bR9Pvmzrj4Cj3ymFS7IoliCJwWlI0sb/PaMIrJqhGSwn
OYSLL79p6zwu2twiU4QaexrZ/JuRGeLRj9HrAsKtpO7Nd0VCkDvc2zy2BEaTRxbg
Yp9UDwn1z/tB/1z65jy8n7CkRZkBhlkLPR4mm8QDeBGLPHyU2JiFPT2ciiZsnHE+
ofvCQFHUtlZdfBgeAl+G4aSMU5XSgQ==
=RHIN
-----END PGP SIGNATURE-----

--Sig_/MP+fv/9tCmEqLKxW+OW4IcR--
