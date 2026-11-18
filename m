Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007180;
	b=ey4r59+H+VotsxX9WaTkt0E6aaZBgi4fsfgQkNQreE+A/tQr0+t411IE3pScbUi8uWwF
	 7iUX0n+wKu48gjAHzKLyrEQ1M5czby4W8C8E/kpyvHycjJj9zZzADwmwW/kTqAzQj+SPg
	 mY0zKUrswR5Nxm4nt2cqm7/fFR8pu7Kq+ebxuvG/TMRxa5RxQe8xBCVHjMAqwr8ZF3Mk2
	 /209A10Zvm2t/c0RqAc7HKuAKkBqVVG08noNXkJ8CBJG5eInXRy72db+hn17LvVhvELiu
	 IeByh44Owcg+9gm0Pu4PGUBcVcP2JmcgXL6CLxcmw4AuUdZ/iBZnL62K4k6MpNS/yhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007180;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=C+DI1+gyFA9Xv3YNKOwlCNyXwaPwJdyu8dlgILb5igg=;
	b=SOITGKP5Ad8nQ21b/YdCLz2fKeIRWd594OMmFBInanIx8yfuWH+StRQohIKkbYS2I+Ke
	 sLZjMvDCyLyC6BSTTaLsz3Xac/xYI1hpVID3IzV5pILWRxLtLiaMdFI3hLM5EpF01QMcE
	 ChZXWUGDXP+JzLseosbbr++5peIHQIw3CHQnuaGTOFzFdBYTY2Bj0AKs3EQuHOC/NU4KQ
	 iwy3V4Qcmy7kO/pOhK15YeNlx51DcuheqIzY0pX+fKLPqI/0Y0eh3BlIcNJD41y1OoI0T
	 o7ORSPAJxulQAKjcs5j1Im/e4o1xFBDSu7N6rRf0FiomHtOfqzShR/ApdCEailB5Nag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nLqJ07oq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9674606A325;
	Wed, 18 Nov 2026 13:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nLqJ07oq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01F821F000C4;
	Wed, 18 Nov 2026 13:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795007180;
	bh=C+DI1+gyFA9Xv3YNKOwlCNyXwaPwJdyu8dlgILb5igg=;
	h=Date:From:To:Cc:Subject;
	b=nLqJ07oqrKKWhBEiTGzfLatPP2vxlULwyzcM6MMs0giZijVunC1uxhkwRPMYXrPWM
	 YQ9ccv3PUNYxgUkPdeERQWlv8axGalckIPk42m+NZDJc+DCfORRthk4XhJfMrNx9Xh
	 af2K6lc3562PaAXtkRHoIAJNjyXhMCgN9nv4WGcy9A90Iq5nlLGK1vHpP7FnOOMnwc
	 ZBFz8A+2GOdx+qGzkBOaBBemBrUyhVtdhc+0S3SYYd/nxIrxQwyzhFNGKBLFR8XHMn
	 im2piZbEZ2NPK/569cgOS2TjDayP6MBE96WPGajLUCScstfTpEWo2nKVM7xO2EJHuU
	 ienE+NLvfAaFA==
Date: Wed, 18 Nov 2026 13:06:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Chi Zhiling <chizhiling@kylinos.cn>,
	Christian Brauner <brauner@kernel.org>,
	Joanne Koong <joannelkoong@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the exfat tree with the origin tree
Message-ID: <av2iyFkAQ-mCpbZF@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fRhUwiMT+R1X/R5b"
Content-Disposition: inline


--fRhUwiMT+R1X/R5b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the exfat tree got conflicts in:

  fs/exfat/iomap.h
  fs/exfat/iomap.c

between commit:

  9e8fc16dc6b47 ("iomap: pass iomap_iter_next_fn directly instead of struct=
 iomap_ops")

=66rom the origin tree and commits:

  cfdee4e5f5764 ("exfat: coordinate direct writes with mmap faults")
  e70ec3eaac957 ("exfat: increase VDL before unlocking initialized folios")

=66rom the exfat tree.  This really needs double checking.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/exfat/iomap.c
index 4e6f3ed9dcc85,5e2c35954ecd3..0000000000000
--- a/fs/exfat/iomap.c
+++ b/fs/exfat/iomap.c
@@@ -151,40 -158,44 +158,40 @@@ out
  	return err;
  }
 =20
- static int exfat_iomap_begin(struct inode *inode, loff_t offset, loff_t l=
ength,
- 		unsigned int flags, struct iomap *iomap, struct iomap *srcmap)
 -static int exfat_iomap_next(const struct iomap_iter *iter,
 -			   struct iomap *iomap, struct iomap *srcmap)
++int exfat_iomap_next(const struct iomap_iter *iter,
++		     struct iomap *iomap, struct iomap *srcmap)
  {
- 	return __exfat_iomap_begin(inode, offset, length, flags, iomap, false);
+ 	const loff_t *dio_valid_size =3D iter->private;
+ 	loff_t valid_size;
+ 	int ret;
+=20
+ 	if (iomap->length) {
+ 		ret =3D iomap_iter_continue(iter, iomap, srcmap, 0);
+ 		if (ret <=3D 0)
+ 			return ret;
+ 	}
+ 	if (iter->flags & IOMAP_DIRECT)
+ 		valid_size =3D *dio_valid_size;
+ 	else
+ 		valid_size =3D exfat_get_valid_size(EXFAT_I(iter->inode));
+ 	ret =3D __exfat_iomap_begin(iter->inode, iter->pos, iter->len,
 -				 iter->flags, iomap, false, valid_size);
++				  iter->flags, iomap, false, valid_size);
+ 	return ret ?: 1;
  }
 =20
  static int exfat_write_iomap_begin(struct inode *inode, loff_t offset, lo=
ff_t length,
  		unsigned int flags, struct iomap *iomap, struct iomap *srcmap)
  {
- 	struct exfat_inode_info *ei =3D EXFAT_I(inode);
- 	loff_t valid_size =3D exfat_get_valid_size(ei);
- 	loff_t end;
- 	int err;
+ 	int ret;
 =20
- 	err =3D __exfat_iomap_begin(inode, offset, length, flags, iomap, true);
- 	if (err || flags & (IOMAP_DIRECT | IOMAP_FAULT) ||
- 	    iomap->flags & IOMAP_F_NEW)
- 		return err;
-=20
- 	end =3D iomap->offset + iomap->length;
- 	if (end >=3D valid_size ||
- 	    round_up(end, i_blocksize(inode)) <=3D valid_size)
- 		return 0;
-=20
- 	/*
- 	 * Zero the invalid bytes from valid_size to the end of the block
- 	 * to prevent stale data from being exposed through the page cache.
- 	 */
- 	return iomap_truncate_page(inode, valid_size, NULL, exfat_iomap_next,
- 				   NULL, NULL);
+ 	ret =3D __exfat_iomap_begin(inode, offset, length, flags, iomap, true,
+ 				  exfat_get_valid_size(EXFAT_I(inode)));
+ 	if (!ret && (flags & IOMAP_DIRECT) &&
+ 	    offset + iomap->length > iomap->validity_cookie)
+ 		iomap->flags |=3D IOMAP_F_DIRTY;
+ 	return ret;
  }
 =20
- DEFINE_IOMAP_ITER_NEXT(exfat_iomap_next, exfat_iomap_begin);
 -const struct iomap_ops exfat_iomap_ops =3D {
 -	.iomap_next =3D exfat_iomap_next,
 -};
--
  #ifdef CONFIG_SWAP
  static int exfat_swap_iomap_begin(struct inode *inode, loff_t offset,
  		loff_t length, unsigned int flags, struct iomap *iomap,
@@@ -214,31 -227,155 +219,150 @@@ static int exfat_write_iomap_end(struc
  	if (!written)
  		return 0;
 =20
- 	end =3D pos + written;
-=20
- 	if (exfat_advance_valid_size(ei, end))
- 		dirtied =3D true;
-=20
- 	/*
- 	 * IOMAP_F_ZERO_TAIL zeroes the remainder of the last block. Track that
- 	 * block as zeroed so later valid_size extensions do not zero it again.
- 	 */
- 	if (iomap->flags & IOMAP_F_ZERO_TAIL)
- 		end =3D round_up(end, i_blocksize(inode));
- 	exfat_advance_zeroed_size(ei, end);
-=20
- 	if (dirtied || iomap->flags & IOMAP_F_SIZE_CHANGED)
+ 	if (iomap->flags & IOMAP_F_SIZE_CHANGED)
  		mark_inode_dirty(inode);
--
  	return written;
  }
 =20
- DEFINE_IOMAP_ITER_NEXT_END(exfat_write_iomap_next, exfat_write_iomap_begi=
n,
- 		exfat_write_iomap_end);
 -static int exfat_write_iomap_next(const struct iomap_iter *iter,
 -				  struct iomap *iomap, struct iomap *srcmap)
++int exfat_write_iomap_next(const struct iomap_iter *iter,
++			   struct iomap *iomap, struct iomap *srcmap)
+ {
+ 	int ret;
+=20
+ 	ret =3D iomap_iter_next(iter, iomap, srcmap, exfat_write_iomap_begin,
+ 			      exfat_write_iomap_end);
+ 	if (ret =3D=3D -ENOSPC && (iter->flags & IOMAP_DIRECT)) {
+ 		const struct exfat_dio *dio =3D iter->private;
+=20
+ 		/*
+ 		 * ENOTBLK makes iomap wait for the submitted bios and report
+ 		 * a short write only if they succeeded.
+ 		 */
+ 		if (iter->pos > dio->start)
+ 			return -ENOTBLK;
+ 	}
+=20
+ 	return ret;
+ }
+=20
 -const struct iomap_ops exfat_write_iomap_ops =3D {
 -	.iomap_next	=3D exfat_write_iomap_next,
 -};
 -
+ static void exfat_zero_invalid_range(struct folio *folio, loff_t pos,
+ 				     size_t len, loff_t valid_size)
+ {
+ 	loff_t start =3D max(pos, valid_size);
+=20
+ 	if (start < pos + len)
+ 		folio_zero_segment(folio, offset_in_folio(folio, start),
+ 				   offset_in_folio(folio, pos) + len);
+ }
+=20
+ static struct folio *exfat_iomap_get_folio(struct iomap_iter *iter, loff_=
t pos,
+ 					   unsigned int len)
+ {
+ 	struct folio *folio =3D iomap_get_folio(iter, pos, len);
+=20
+ 	if (!IS_ERR(folio))
+ 		iter->iomap.private =3D folio;
+ 	return folio;
+ }
+=20
+ static bool exfat_iomap_valid(struct inode *inode, const struct iomap *io=
map)
+ {
+ 	struct folio *folio =3D iomap->private;
+ 	loff_t valid_size =3D exfat_get_valid_size(EXFAT_I(inode));
+ 	loff_t old_valid_size =3D iomap->validity_cookie;
+=20
+ 	if (valid_size =3D=3D old_valid_size)
+ 		return true;
+ 	if (!folio)
+ 		return false;
+=20
+ 	return old_valid_size >=3D folio_next_pos(folio) ||
+ 		valid_size <=3D folio_pos(folio);
+ }
+=20
+ /* Called after iomap_valid(), with the destination folio still locked. */
+ static int exfat_iomap_read_folio_range(const struct iomap_iter *iter,
+ 					struct folio *folio, loff_t pos, size_t len)
+ {
+ 	loff_t valid_size =3D iter->iomap.validity_cookie;
+ 	int error =3D 0;
+=20
+ 	if (pos < valid_size)
+ 		error =3D iomap_bio_read_folio_range_sync(iter, folio, pos, len);
+=20
+ 	/*
+ 	 * Sanitize all invalid bytes before iomap marks this range uptodate,
+ 	 * including bytes that a short user copy may leave untouched.
+ 	 */
+ 	if (!error)
+ 		exfat_zero_invalid_range(folio, pos, len, valid_size);
+ 	return error;
+ }
+=20
+ static void exfat_iomap_put_folio(struct inode *inode, loff_t pos,
+ 				  unsigned int copied, struct folio *folio)
+ {
+ 	if (copied) {
+ 		struct exfat_inode_info *ei =3D EXFAT_I(inode);
+=20
+ 		if (exfat_advance_valid_size(ei, pos + copied))
+ 			mark_inode_dirty(inode);
+ 		exfat_advance_zeroed_size(ei,
+ 					  round_up(pos + copied, i_blocksize(inode)));
+ 	}
+=20
+ 	folio_unlock(folio);
+ 	folio_put(folio);
+ }
+=20
+ const struct iomap_write_ops exfat_iomap_write_ops =3D {
+ 	.get_folio	=3D exfat_iomap_get_folio,
+ 	.put_folio	=3D exfat_iomap_put_folio,
+ 	.iomap_valid	=3D exfat_iomap_valid,
+ 	.read_folio_range =3D exfat_iomap_read_folio_range,
+ };
+=20
+ /*
+  * Gap zeroing follows the direct write. Keep completed data intact when =
the
+  * gap and the write share a filesystem block.
+  */
+ static int exfat_dio_gap_read_folio_range(const struct iomap_iter *iter,
+ 		struct folio *folio, loff_t pos, size_t len)
+ {
+ 	const struct exfat_dio *dio =3D iter->private;
+ 	loff_t valid =3D iter->iomap.validity_cookie;
+ 	loff_t end =3D pos + len;
+ 	loff_t start, stop;
+ 	int error;
+=20
+ 	if (pos < valid || end > dio->start) {
+ 		error =3D iomap_bio_read_folio_range_sync(iter, folio, pos, len);
+ 		if (error)
+ 			return error;
+ 	} else {
+ 		folio_zero_range(folio, offset_in_folio(folio, pos), len);
+ 		return 0;
+ 	}
+=20
+ 	start =3D max(pos, valid);
+ 	stop =3D min(end, dio->start);
+ 	if (start < stop)
+ 		folio_zero_segment(folio, offset_in_folio(folio, start),
+ 				   offset_in_folio(folio, pos) + stop - pos);
+=20
+ 	start =3D max(pos, dio->start + dio->completed);
+ 	if (start < end)
+ 		folio_zero_segment(folio, offset_in_folio(folio, start),
+ 				   offset_in_folio(folio, pos) + len);
+ 	return 0;
+ }
+=20
+ const struct iomap_write_ops exfat_dio_gap_write_ops =3D {
+ 	.get_folio	=3D exfat_iomap_get_folio,
+ 	.put_folio	=3D exfat_iomap_put_folio,
+ 	.iomap_valid	=3D exfat_iomap_valid,
+ 	.read_folio_range =3D exfat_dio_gap_read_folio_range,
+ };
 =20
  /*
   * exfat_writeback_range - Map folio during writeback
diff --cc fs/exfat/iomap.h
index 519132367b65e,f8f018f87230a..0000000000000
--- a/fs/exfat/iomap.h
+++ b/fs/exfat/iomap.h
@@@ -6,11 -6,17 +6,19 @@@
  #ifndef _LINUX_EXFAT_IOMAP_H
  #define _LINUX_EXFAT_IOMAP_H
 =20
 +#include <linux/iomap.h>
 +
- extern const struct iomap_dio_ops exfat_write_dio_ops;
+ /* One synchronous attempt for a direct write extending valid_size. */
+ struct exfat_dio {
+ 	struct kiocb iocb;
+ 	loff_t start;
+ 	loff_t completed;
+ };
+=20
 -extern const struct iomap_ops exfat_iomap_ops;
 -extern const struct iomap_ops exfat_write_iomap_ops;
 +DECLARE_IOMAP_ITER_NEXT(exfat_iomap_next);
 +DECLARE_IOMAP_ITER_NEXT(exfat_write_iomap_next);
+ extern const struct iomap_write_ops exfat_iomap_write_ops;
+ extern const struct iomap_write_ops exfat_dio_gap_write_ops;
  extern const struct iomap_writeback_ops exfat_writeback_ops;
  extern const struct iomap_read_ops exfat_iomap_bio_read_ops;
 =20

--fRhUwiMT+R1X/R5b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr9oscACgkQJNaLcl1U
h9Cz0Af7BhOnbb22a8uO1ePV6ziE6IrnCHuEfgbA4pjanqFURqostNCqJ8EfWHM+
Lgc6nugRscfVgJpse1wSL9xw+3Zi7n6rGQ3lmQBJHIuRFLjG+CTlUHxMe3MSCoww
fhfdQzF2VAxxZBKuAFxAplRmBSS5vCUd7rk75uhfK/YKLV8rWxn9/GMX5d8+Upkn
TSwTdO8Xgc+ouuqddRNg9Ft6mUQ6JXsUF+oW+V5VgCMmFEtNrg+OK+4Dofw82sTU
SkuX6+UVoPNLWucO+X4znlfagjjK5X5XYVSBcCaDWOqblC0XNJnn8gUKtgjgfx5l
nptQ876y48HkHN4T+WUWqgu15iUmrA==
=gavM
-----END PGP SIGNATURE-----

--fRhUwiMT+R1X/R5b--
