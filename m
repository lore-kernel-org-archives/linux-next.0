From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with Linus' tree
Date: Mon, 1 Jun 2015 14:56:19 +1000
Message-ID: <20150601145619.5d176c8b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/faXON=k7iyDq63onj6pzlp_"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55423 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750987AbbFAE4b (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Jun 2015 00:56:31 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Mike Snitzer <snitzer@redhat.com>, Junichi Nomura <j-nomura@ce.jp.nec.com>

--Sig_/faXON=k7iyDq63onj6pzlp_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jens,

Today's linux-next merge of the block tree got a conflict in
drivers/md/dm.c between commits 3a1407559a59 ("dm: fix NULL pointer
when clone_and_map_rq returns !DM_MAPIO_REMAPPED") and e5d8de32cc02
("dm: fix false warning in free_rq_clone() for unmapped requests") from
Linus' tree and commit 5f1b670d0bef ("block, dm: don't copy bios for
request clones") from the block tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/md/dm.c
index 2caf492890d6,38837f8ea327..000000000000
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@@ -1087,8 -1036,8 +1036,6 @@@ static void free_rq_clone(struct reques
  	struct dm_rq_target_io *tio =3D clone->end_io_data;
  	struct mapped_device *md =3D tio->md;
 =20
- 	blk_rq_unprep_clone(clone);
 -	WARN_ON_ONCE(must_be_mapped && !clone->q);
--
  	if (md->type =3D=3D DM_TYPE_MQ_REQUEST_BASED)
  		/* stacked on blk-mq queue(s) */
  		tio->ti->type->release_clone_rq(clone);
@@@ -1977,13 -1887,9 +1893,9 @@@ static int map_request(struct dm_rq_tar
  			dm_kill_unmapped_request(rq, r);
  			return r;
  		}
 -		if (IS_ERR(clone))
 -			return DM_MAPIO_REQUEUE;
 +		if (r !=3D DM_MAPIO_REMAPPED)
 +			return r;
- 		if (setup_clone(clone, rq, tio, GFP_ATOMIC)) {
- 			/* -ENOMEM */
- 			ti->type->release_clone_rq(clone);
- 			return DM_MAPIO_REQUEUE;
- 		}
+ 		setup_clone(clone, rq, tio);
  	}
 =20
  	switch (r) {

--Sig_/faXON=k7iyDq63onj6pzlp_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVa+X8AAoJEMDTa8Ir7ZwVR54QAICkw9+qU3Bxz7F/pAbHzNKS
U6HdnT/fBCnNr3CbNOsGMysz+Lork6Fn5q6bMeI8c8LhNn7HymcIiIDqeKe6/rp8
H2NPAigaEyT5xHgpph6vWi0Cp7N1fJuNCVoT3xrRR2k+YT0TyXTdHleTLEtLxgPh
b60a+8OMvZz0uzos8RJuQoMfkmnEBgiQw0FeKcs1ZKyXu0IWLX0SkAKnFPq1nLhO
EMOTAc9S+RtGGJ3ceC0E6pSAN2pzdWqHjz2SkkoAQoAN9N9MFmMIygAsBB0t6sgf
7pEMd7cBqQNWFyIDRGqsB53lmZ9a9UP4h4/vzM+CnHuLpgQkj0RFOsZh8HbswVeE
xBQxntdxMN1/Ljdj+BEksX0ZEOUdE18YLfvUjgRY+lwvWNbSdcgB26g/i9e2rpWP
/HhsMXhi9ftU/DaI0kX10Ja6a+Hxtz8919hooU6C+BNVWThrxTROKuCPrjJGWykn
0rrJRSmhzMAqX5Nq+AmJV44iYxGwfxHqltcuvC8WwIWX4RWZiPbql68b0JoPOe67
RZPS0G/F63CLNE6cU8WDls8QW2KmmJkVfv84jCnyXIh0zG0qgLBMsEOwQCmt7qPG
7WDTl7dY7FIb9By4hwjDwkhdgC94t0YY/pj1FB8ZiTa+ezYa0cXsnicqgiYY58Ei
8AKBshIGvSzQGh43Wx1o
=bJEt
-----END PGP SIGNATURE-----

--Sig_/faXON=k7iyDq63onj6pzlp_--
