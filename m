Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7361639D6CB;
	Wed, 25 Mar 2026 13:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774445381; cv=none; b=U7QtbxOVxboN+6fwzqOg56I9O2cmt+ovon0KckweAQYJ/fCSOJXsJe4cOKzDFE2qFXFRuvOj8F8MYUL2ZgrLV5nVBpbm6VRQBhPxDPCbQPbYpNqpdltY0TM30NOmzxL+Sn/iR2roSDeyvOBocMbWxDTN42mrnOK26bO52qIXl40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774445381; c=relaxed/simple;
	bh=9Vedb/kvTUOFJNWjXqMTRTi5dDdni7Q21S95FCAuess=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JFspfuZElgVAbBdtEWxK4ExFZKcDTcr7A00lmllRz8pVV86xJrtMzPpAnRcqezzM0jsaDVFaihY0ki9jldp6IXAQXE6MJ6ZBgPzLzxTcTkSKgIbXLfPusDEiK4PC5l6QvfGZsbyq5zUduabIX934QfdJagPIg4vAGXGYVB+Qegw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sjNEHSLe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sjNEHSLe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2343C4CEF7;
	Wed, 25 Mar 2026 13:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774445381;
	bh=9Vedb/kvTUOFJNWjXqMTRTi5dDdni7Q21S95FCAuess=;
	h=Date:From:To:Cc:Subject:From;
	b=sjNEHSLeC3INF02sT3mBynLPXra9SNZeqh7GCQnp1rl/DWrOVss6HATTGgxYwBAEI
	 vUdgShRhjc7D/pAAOOZ5MBnKk+Z8my+5jb2gG/gnFca9i3bEjgBA/nkyq/JPrPkpSw
	 gF6deKLM3G33BaKAfoIvPBJhtcBDp0NQharEWS4xn42jxrPj94Za+c2EtxgzNXEES0
	 xij6HM+fZrmUOL8qC06Hkl4rFNot7P4GdlsfaRVYwr+yHiEri+YGG+LKF8r8+06sje
	 yOLwsAEAVfVko1f0IBBu+KKWSYy7YMx22UKlVDQkNCd8e2ViuSLXlVp5MHUHuJhw8H
	 zIMmS+jpCmuiA==
Date: Wed, 25 Mar 2026 13:29:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, "Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs-brauner tree with the
 vfs-brauner-fixes tree
Message-ID: <acPjQfoS-k2oDp3i@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cVwIlqgWQjauOJNv"
Content-Disposition: inline


--cVwIlqgWQjauOJNv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/iomap/bio.c

between commit:

  f621324dfb3d6 ("iomap: fix lockdep complaint when reads fail")

=66rom the vfs-brauner-fixes tree and commit:

  e8f9cf03c9dc9 ("iomap: support ioends for buffered reads")

=66rom the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/iomap/bio.c
index edd908183058f,f989ffcaac96d..0000000000000
--- a/fs/iomap/bio.c
+++ b/fs/iomap/bio.c
@@@ -8,66 -9,33 +9,78 @@@
  #include "internal.h"
  #include "trace.h"
 =20
 +static DEFINE_SPINLOCK(failed_read_lock);
 +static struct bio_list failed_read_list =3D BIO_EMPTY_LIST;
 +
- static void __iomap_read_end_io(struct bio *bio)
+ static u32 __iomap_read_end_io(struct bio *bio, int error)
  {
- 	int error =3D blk_status_to_errno(bio->bi_status);
  	struct folio_iter fi;
+ 	u32 folio_count =3D 0;
 =20
- 	bio_for_each_folio_all(fi, bio)
+ 	bio_for_each_folio_all(fi, bio) {
  		iomap_finish_folio_read(fi.folio, fi.offset, fi.length, error);
+ 		folio_count++;
+ 	}
+ 	if (bio_integrity(bio))
+ 		fs_bio_integrity_free(bio);
  	bio_put(bio);
+ 	return folio_count;
  }
 =20
 +static void
 +iomap_fail_reads(
 +	struct work_struct	*work)
 +{
 +	struct bio		*bio;
 +	struct bio_list		tmp =3D BIO_EMPTY_LIST;
 +	unsigned long		flags;
 +
 +	spin_lock_irqsave(&failed_read_lock, flags);
 +	bio_list_merge_init(&tmp, &failed_read_list);
 +	spin_unlock_irqrestore(&failed_read_lock, flags);
 +
 +	while ((bio =3D bio_list_pop(&tmp)) !=3D NULL) {
- 		__iomap_read_end_io(bio);
++		__iomap_read_end_io(bio, blk_status_to_errno(bio->bi_status));
 +		cond_resched();
 +	}
 +}
 +
 +static DECLARE_WORK(failed_read_work, iomap_fail_reads);
 +
 +static void iomap_fail_buffered_read(struct bio *bio)
 +{
 +	unsigned long flags;
 +
 +	/*
 +	 * Bounce I/O errors to a workqueue to avoid nested i_lock acquisitions
 +	 * in the fserror code.  The caller no longer owns the bio reference
 +	 * after the spinlock drops.
 +	 */
 +	spin_lock_irqsave(&failed_read_lock, flags);
 +	if (bio_list_empty(&failed_read_list))
 +		WARN_ON_ONCE(!schedule_work(&failed_read_work));
 +	bio_list_add(&failed_read_list, bio);
 +	spin_unlock_irqrestore(&failed_read_lock, flags);
 +}
 +
  static void iomap_read_end_io(struct bio *bio)
  {
 -	__iomap_read_end_io(bio, blk_status_to_errno(bio->bi_status));
 +	if (bio->bi_status) {
 +		iomap_fail_buffered_read(bio);
 +		return;
 +	}
 +
- 	__iomap_read_end_io(bio);
++	__iomap_read_end_io(bio, 0);
  }
 =20
- static void iomap_bio_submit_read(struct iomap_read_folio_ctx *ctx)
++
+ u32 iomap_finish_ioend_buffered_read(struct iomap_ioend *ioend)
+ {
+ 	return __iomap_read_end_io(&ioend->io_bio, ioend->io_error);
+ }
+=20
+ static void iomap_bio_submit_read(const struct iomap_iter *iter,
+ 		struct iomap_read_folio_ctx *ctx)
  {
  	struct bio *bio =3D ctx->read_ctx;
 =20

--cVwIlqgWQjauOJNv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnD40AACgkQJNaLcl1U
h9BlWQf+MwXgcL2rnju9DCfqdmrXuhd7TyxkKt9C+57tDcgBMoCzLQQBr2p/awn+
GBy7+iTC99RhBEMoQRe0ZJcv8KSZo7zAcF6LOJTxZMHIkO8uChRrwJF0xisjE2DL
Dl2N4l4pQDQmpJ38ZUdILRZ3H5fipeLIHn1fk8zN3gE0WPvCP7hEgsHe2Uvx1fed
PTn3ri+sac9kr4koNM4kP5vCC1/RBrsTV4um2cn+AxsPl33QyZE7NxeBopQ7AU01
gPaJ4sFHuglX8HiiX3e1ZhuYKGwNxjrsbiKpcNjNXlJBCnheIGfJlWdvO0TC66CI
KI1nY1DCtKNkHezAMMIJ3zHU8/b8yg==
=OPNc
-----END PGP SIGNATURE-----

--cVwIlqgWQjauOJNv--
