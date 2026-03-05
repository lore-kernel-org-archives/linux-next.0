Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735FC37C0E6;
	Thu,  5 Mar 2026 13:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772718273; cv=none; b=NQEV8bpuQLepLPPvdVFoOdxvd2UtVY7yy4mfQPO+w9Rvo4eaNKzQyiuABKEJVoMGHvOC5gyWihJ4PPL8eMHvD3xgqp2tOMi9idGyQ7U/Um5sHCs3pV9RByLnP74w3JOKB9X69WX78kj0j05tUOxCngcN6kmFLwxBwtnIjiRYaQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772718273; c=relaxed/simple;
	bh=CsgWTlBlFuHLPWoG6ANTIRzoDnB5AbtHClGiQ1cOwZs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bVU2BfGlNKIjzCmu5BQF3uzL6nYfEM/E2ipp7KspapehtMtmmYEpPX5sUkWZoHRgC8zFucKg0aTVllXUlpZEvPjGB5x6yg5UDvmTeKFA7NvhPKjYdA8eIYUZ7vm8YAEEfwW2le16Z8QqV8rhk00u5EV4KtL0O16Hk/G7q9sBFhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fQQGjjI6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fQQGjjI6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB38C116C6;
	Thu,  5 Mar 2026 13:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772718273;
	bh=CsgWTlBlFuHLPWoG6ANTIRzoDnB5AbtHClGiQ1cOwZs=;
	h=Date:From:To:Cc:Subject:From;
	b=fQQGjjI6BzgDbJ5P2Xu6Jyrvcl+ZOIRa0dqFUMiuXddLgl/KvOQP0tNwlstjn9hOD
	 OsK+alQ8TrJiAwe8aG7kUMW4/+gVTo6PQ0bpka8FAjqVSHBgYG5v1U5HBCu+7tQsTN
	 kEH/KpFTlN40+NzEB648D6uv74aUVIZR1Gg7mt2qhW3LCt61QV7a85tHyzMXASv18v
	 lxKtsDlBzxtp3I9GitxdyZHvQrjMwVaFR/Zej5s3p8AFFqpYk0k43noHmZq9iQIkWJ
	 WMGP8DFPGgFuVsjQXD7Gl35cm0Oymv406I2PCacmnFym427k75ZTkBnHamBl3+Z+ZT
	 zTQMsAoO+23IQ==
Date: Thu, 5 Mar 2026 13:44:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Christian Brauner <brauner@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the block tree with the vfs-brauner tree
Message-ID: <aamIvIWiZDDCmNYG@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FCp0gUBvpaq2E1S4"
Content-Disposition: inline


--FCp0gUBvpaq2E1S4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  block/t10-pi.c

between commit:

  179c2a24466b2 ("block: prepare generation / verification helpers for fs u=
sage")

=66rom the vfs-brauner tree and commit:

  7f0bc835bd428 ("blk-integrity: support arbitrary buffer alignment")

=66rom the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

I don't have a huge degree of confidence in this merge as the block
change was quite large and the code is entirely unfamiliar to me.

diff --cc block/t10-pi.c
index d27be6041fd31,3a564c0e2fe80..0000000000000
--- a/block/t10-pi.c
+++ b/block/t10-pi.c
@@@ -372,83 -267,283 +267,284 @@@ static void blk_integrity_set(struct bl
  	}
  }
 =20
+ static blk_status_t blk_integrity_interval(struct blk_integrity_iter *ite=
r,
+ 					   bool verify)
+ {
+ 	blk_status_t ret =3D BLK_STS_OK;
+ 	union pi_tuple tuple;
+ 	void *ptuple =3D &tuple;
+ 	struct bio_vec pbv;
+=20
+ 	blk_integrity_csum_offset(iter);
+ 	pbv =3D bvec_iter_bvec(iter->bip->bip_vec, iter->prot_iter);
+ 	if (pbv.bv_len >=3D iter->bi->pi_tuple_size) {
+ 		ptuple =3D bvec_kmap_local(&pbv);
+ 		bvec_iter_advance_single(iter->bip->bip_vec, &iter->prot_iter,
+ 				iter->bi->metadata_size - iter->bi->pi_offset);
+ 	} else if (verify) {
+ 		blk_integrity_copy_to_tuple(iter->bip, &iter->prot_iter,
+ 				ptuple, iter->bi->pi_tuple_size);
+ 	}
+=20
+ 	if (verify)
+ 		ret =3D blk_integrity_verify(iter, ptuple);
+ 	else
+ 		blk_integrity_set(iter, ptuple);
+=20
+ 	if (likely(ptuple !=3D &tuple)) {
+ 		kunmap_local(ptuple);
+ 	} else if (!verify) {
+ 		blk_integrity_copy_from_tuple(iter->bip, &iter->prot_iter,
+ 				ptuple, iter->bi->pi_tuple_size);
+ 	}
+=20
+ 	iter->interval_remaining =3D 1 << iter->bi->interval_exp;
+ 	iter->csum =3D 0;
+ 	iter->seed++;
+ 	return ret;
+ }
+=20
 -static void blk_integrity_iterate(struct bio *bio, struct bvec_iter *data=
_iter,
 -				  bool verify)
++static blk_status_t blk_integrity_iterate(struct bio *bio, struct bvec_it=
er *data_iter,
++					  bool verify)
+ {
+ 	struct blk_integrity *bi =3D blk_get_integrity(bio->bi_bdev->bd_disk);
+ 	struct bio_integrity_payload *bip =3D bio_integrity(bio);
+ 	struct blk_integrity_iter iter =3D {
+ 		.bio =3D bio,
+ 		.bip =3D bip,
+ 		.bi =3D bi,
+ 		.data_iter =3D *data_iter,
+ 		.prot_iter =3D bip->bip_iter,
+ 		.interval_remaining =3D 1 << bi->interval_exp,
+ 		.seed =3D data_iter->bi_sector,
+ 		.csum =3D 0,
+ 	};
+ 	blk_status_t ret =3D BLK_STS_OK;
+=20
+ 	while (iter.data_iter.bi_size && ret =3D=3D BLK_STS_OK) {
+ 		struct bio_vec bv =3D bvec_iter_bvec(iter.bio->bi_io_vec,
+ 						   iter.data_iter);
+ 		void *kaddr =3D bvec_kmap_local(&bv);
+ 		void *data =3D kaddr;
+ 		unsigned int len;
+=20
+ 		bvec_iter_advance_single(iter.bio->bi_io_vec, &iter.data_iter,
+ 					 bv.bv_len);
+ 		while (bv.bv_len && ret =3D=3D BLK_STS_OK) {
+ 			len =3D min(iter.interval_remaining, bv.bv_len);
+ 			blk_calculate_guard(&iter, data, len);
+ 			bv.bv_len -=3D len;
+ 			data +=3D len;
+ 			iter.interval_remaining -=3D len;
+ 			if (!iter.interval_remaining)
+ 				ret =3D blk_integrity_interval(&iter, verify);
+ 		}
+ 		kunmap_local(kaddr);
+ 	}
+=20
 -	if (ret)
 -		bio->bi_status =3D ret;
++	return ret;
+ }
+=20
 -void blk_integrity_generate(struct bio *bio)
 +void bio_integrity_generate(struct bio *bio)
  {
  	struct blk_integrity *bi =3D blk_get_integrity(bio->bi_bdev->bd_disk);
- 	struct bio_integrity_payload *bip =3D bio_integrity(bio);
- 	struct blk_integrity_iter iter;
- 	struct bvec_iter bviter;
- 	struct bio_vec bv;
 =20
- 	iter.disk_name =3D bio->bi_bdev->bd_disk->disk_name;
- 	iter.interval =3D 1 << bi->interval_exp;
- 	iter.seed =3D bio->bi_iter.bi_sector;
- 	iter.prot_buf =3D bvec_virt(bip->bip_vec);
- 	bio_for_each_segment(bv, bio, bviter) {
- 		void *kaddr =3D bvec_kmap_local(&bv);
-=20
- 		iter.data_buf =3D kaddr;
- 		iter.data_size =3D bv.bv_len;
- 		switch (bi->csum_type) {
- 		case BLK_INTEGRITY_CSUM_CRC64:
- 			ext_pi_crc64_generate(&iter, bi);
- 			break;
- 		case BLK_INTEGRITY_CSUM_CRC:
- 		case BLK_INTEGRITY_CSUM_IP:
- 			t10_pi_generate(&iter, bi);
- 			break;
- 		default:
- 			break;
- 		}
- 		kunmap_local(kaddr);
+ 	switch (bi->csum_type) {
+ 	case BLK_INTEGRITY_CSUM_CRC64:
+ 	case BLK_INTEGRITY_CSUM_CRC:
+ 	case BLK_INTEGRITY_CSUM_IP:
+ 		blk_integrity_iterate(bio, &bio->bi_iter, false);
+ 		break;
+ 	default:
+ 		break;
  	}
  }
 =20
 -void blk_integrity_verify_iter(struct bio *bio, struct bvec_iter *saved_i=
ter)
 +blk_status_t bio_integrity_verify(struct bio *bio, struct bvec_iter *save=
d_iter)
  {
  	struct blk_integrity *bi =3D blk_get_integrity(bio->bi_bdev->bd_disk);
- 	struct bio_integrity_payload *bip =3D bio_integrity(bio);
- 	struct blk_integrity_iter iter;
- 	struct bvec_iter bviter;
- 	struct bio_vec bv;
 =20
- 	/*
- 	 * At the moment verify is called bi_iter has been advanced during split
- 	 * and completion, so use the copy created during submission here.
- 	 */
- 	iter.disk_name =3D bio->bi_bdev->bd_disk->disk_name;
- 	iter.interval =3D 1 << bi->interval_exp;
- 	iter.seed =3D saved_iter->bi_sector;
- 	iter.prot_buf =3D bvec_virt(bip->bip_vec);
- 	__bio_for_each_segment(bv, bio, bviter, *saved_iter) {
- 		void *kaddr =3D bvec_kmap_local(&bv);
- 		blk_status_t ret =3D BLK_STS_OK;
-=20
- 		iter.data_buf =3D kaddr;
- 		iter.data_size =3D bv.bv_len;
- 		switch (bi->csum_type) {
- 		case BLK_INTEGRITY_CSUM_CRC64:
- 			ret =3D ext_pi_crc64_verify(&iter, bi);
- 			break;
- 		case BLK_INTEGRITY_CSUM_CRC:
- 		case BLK_INTEGRITY_CSUM_IP:
- 			ret =3D t10_pi_verify(&iter, bi);
- 			break;
- 		default:
- 			break;
- 		}
- 		kunmap_local(kaddr);
-=20
- 		if (ret)
- 			return ret;
+ 	switch (bi->csum_type) {
+ 	case BLK_INTEGRITY_CSUM_CRC64:
+ 	case BLK_INTEGRITY_CSUM_CRC:
+ 	case BLK_INTEGRITY_CSUM_IP:
 -		blk_integrity_iterate(bio, saved_iter, true);
++		return blk_integrity_iterate(bio, saved_iter, true);
+ 		break;
+ 	default:
+ 		break;
  	}
 +
 +	return BLK_STS_OK;
  }
 =20
- void blk_integrity_prepare(struct request *rq)
+ /*
+  * Advance @iter past the protection offset for protection formats that
+  * contain front padding on the metadata region.
+  */
+ static void blk_pi_advance_offset(struct blk_integrity *bi,
+ 				  struct bio_integrity_payload *bip,
+ 				  struct bvec_iter *iter)
+ {
+ 	unsigned int offset =3D bi->pi_offset;
+=20
+ 	while (offset > 0) {
+ 		struct bio_vec bv =3D mp_bvec_iter_bvec(bip->bip_vec, *iter);
+ 		unsigned int len =3D min(bv.bv_len, offset);
+=20
+ 		bvec_iter_advance_single(bip->bip_vec, iter, len);
+ 		offset -=3D len;
+ 	}
+ }
+=20
+ static void *blk_tuple_remap_begin(union pi_tuple *tuple,
+ 				   struct blk_integrity *bi,
+ 				   struct bio_integrity_payload *bip,
+ 				   struct bvec_iter *iter)
+ {
+ 	struct bvec_iter titer;
+ 	struct bio_vec pbv;
+=20
+ 	blk_pi_advance_offset(bi, bip, iter);
+ 	pbv =3D bvec_iter_bvec(bip->bip_vec, *iter);
+ 	if (likely(pbv.bv_len >=3D bi->pi_tuple_size))
+ 		return bvec_kmap_local(&pbv);
+=20
+ 	/*
+ 	 * We need to preserve the state of the original iter for the
+ 	 * copy_from_tuple at the end, so make a temp iter for here.
+ 	 */
+ 	titer =3D *iter;
+ 	blk_integrity_copy_to_tuple(bip, &titer, tuple, bi->pi_tuple_size);
+ 	return tuple;
+ }
+=20
+ static void blk_tuple_remap_end(union pi_tuple *tuple, void *ptuple,
+ 				struct blk_integrity *bi,
+ 				struct bio_integrity_payload *bip,
+ 				struct bvec_iter *iter)
+ {
+ 	unsigned int len =3D bi->metadata_size - bi->pi_offset;
+=20
+ 	if (likely(ptuple !=3D tuple)) {
+ 		kunmap_local(ptuple);
+ 	} else {
+ 		blk_integrity_copy_from_tuple(bip, iter, ptuple,
+ 				bi->pi_tuple_size);
+ 		len -=3D bi->pi_tuple_size;
+ 	}
+=20
+ 	bvec_iter_advance(bip->bip_vec, iter, len);
+ }
+=20
+ static void blk_set_ext_unmap_ref(struct crc64_pi_tuple *pi, u64 virt,
+ 				  u64 ref_tag)
+ {
+ 	u64 ref =3D get_unaligned_be48(&pi->ref_tag);
+=20
+ 	if (ref =3D=3D lower_48_bits(ref_tag) && ref !=3D lower_48_bits(virt))
+ 		put_unaligned_be48(virt, pi->ref_tag);
+ }
+=20
+ static void blk_set_t10_unmap_ref(struct t10_pi_tuple *pi, u32 virt,
+ 				  u32 ref_tag)
+ {
+ 	u32 ref =3D get_unaligned_be32(&pi->ref_tag);
+=20
+ 	if (ref =3D=3D ref_tag && ref !=3D virt)
+ 		put_unaligned_be32(virt, &pi->ref_tag);
+ }
+=20
+ static void blk_reftag_remap_complete(struct blk_integrity *bi,
+ 				      union pi_tuple *tuple, u64 virt, u64 ref)
+ {
+ 	switch (bi->csum_type) {
+ 	case BLK_INTEGRITY_CSUM_CRC64:
+ 		blk_set_ext_unmap_ref(&tuple->crc64_pi, virt, ref);
+ 		break;
+ 	case BLK_INTEGRITY_CSUM_CRC:
+ 	case BLK_INTEGRITY_CSUM_IP:
+ 		blk_set_t10_unmap_ref(&tuple->t10_pi, virt, ref);
+ 		break;
+ 	default:
+ 		WARN_ON_ONCE(1);
+ 		break;
+ 	}
+ }
+=20
+ static void blk_set_ext_map_ref(struct crc64_pi_tuple *pi, u64 virt,
+ 				u64 ref_tag)
+ {
+ 	u64 ref =3D get_unaligned_be48(&pi->ref_tag);
+=20
+ 	if (ref =3D=3D lower_48_bits(virt) && ref !=3D ref_tag)
+ 		put_unaligned_be48(ref_tag, pi->ref_tag);
+ }
+=20
+ static void blk_set_t10_map_ref(struct t10_pi_tuple *pi, u32 virt, u32 re=
f_tag)
+ {
+ 	u32 ref =3D get_unaligned_be32(&pi->ref_tag);
+=20
+ 	if (ref =3D=3D virt && ref !=3D ref_tag)
+ 		put_unaligned_be32(ref_tag, &pi->ref_tag);
+ }
+=20
+ static void blk_reftag_remap_prepare(struct blk_integrity *bi,
+ 				     union pi_tuple *tuple,
+ 				     u64 virt, u64 ref)
+ {
+ 	switch (bi->csum_type) {
+ 	case BLK_INTEGRITY_CSUM_CRC64:
+ 		blk_set_ext_map_ref(&tuple->crc64_pi, virt, ref);
+ 		break;
+ 	case BLK_INTEGRITY_CSUM_CRC:
+ 	case BLK_INTEGRITY_CSUM_IP:
+ 		blk_set_t10_map_ref(&tuple->t10_pi, virt, ref);
+ 		break;
+ 	default:
+ 		WARN_ON_ONCE(1);
+ 		break;
+ 	}
+ }
+=20
+ static void __blk_reftag_remap(struct bio *bio, struct blk_integrity *bi,
+ 			       unsigned *intervals, u64 *ref, bool prep)
+ {
+ 	struct bio_integrity_payload *bip =3D bio_integrity(bio);
+ 	struct bvec_iter iter =3D bip->bip_iter;
+ 	u64 virt =3D bip_get_seed(bip);
+ 	union pi_tuple *ptuple;
+ 	union pi_tuple tuple;
+=20
+ 	if (prep && bip->bip_flags & BIP_MAPPED_INTEGRITY) {
+ 		*ref +=3D bio->bi_iter.bi_size >> bi->interval_exp;
+ 		return;
+ 	}
+=20
+ 	while (iter.bi_size && *intervals) {
+ 		ptuple =3D blk_tuple_remap_begin(&tuple, bi, bip, &iter);
+=20
+ 		if (prep)
+ 			blk_reftag_remap_prepare(bi, ptuple, virt, *ref);
+ 		else
+ 			blk_reftag_remap_complete(bi, ptuple, virt, *ref);
+=20
+ 		blk_tuple_remap_end(&tuple, ptuple, bi, bip, &iter);
+ 		(*intervals)--;
+ 		(*ref)++;
+ 		virt++;
+ 	}
+=20
+ 	if (prep)
+ 		bip->bip_flags |=3D BIP_MAPPED_INTEGRITY;
+ }
+=20
+ static void blk_integrity_remap(struct request *rq, unsigned int nr_bytes,
+ 				bool prep)
  {
  	struct blk_integrity *bi =3D &rq->q->limits.integrity;
+ 	u64 ref =3D blk_rq_pos(rq) >> (bi->interval_exp - SECTOR_SHIFT);
+ 	unsigned intervals =3D nr_bytes >> bi->interval_exp;
+ 	struct bio *bio;
 =20
  	if (!(bi->flags & BLK_INTEGRITY_REF_TAG))
  		return;

--FCp0gUBvpaq2E1S4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmpiLwACgkQJNaLcl1U
h9AEDQf/Yn3HIlpLpSwuZT+JKzxk6/+nFKxnRzjrAnrNPgjoewSHccUwbErmzEfs
h1oDRMa+MxWdaUQ9EhWrsKWgNeMQEhZMk2slc9tzAyeyLFl+RNVfCWDkyCUtjmLQ
Znj9FfxD+fnBzzb7abAhNf1LAg3OtYkxMq0a0ou+wqB+jsq4nkOzAKfSCRgB5L9Q
LCHtaWPow4odDk5ECWpQ8+AxjaLxzvkj4IkGCml8MfGWvawedZylUcdBWSdNT5fY
v9uqd+KIAG6c5rcsoe9MAvQszGhvWiT0jiCcBM5hTTUlFgy7p1jVf5GShLojMAX7
AKEfeuLLPYtyf33Cs9iPp5r6whgybg==
=sAVR
-----END PGP SIGNATURE-----

--FCp0gUBvpaq2E1S4--
