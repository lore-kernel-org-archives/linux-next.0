Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F5A472782;
	Fri,  5 Jun 2026 10:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780657023; cv=none; b=m3XpW9lbmKjNqJ2VTozSognyJcD0VJ0KfBDJA9Zy6VuMmj+8Rc39BeZ3v4ap8d6fKhawmz/j36jcOXwI2Vnxa7RW+5ScYiAYdF8bc6d8ydvIJJsPbAsF7korT3ccS02S+oVuJyaXpVKDd4C5BWKtvKwDBwAtuocgcZ8v/xr/V5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780657023; c=relaxed/simple;
	bh=U3GIQ4FxykCZ/FnNfoZx3tQYYkVRtQSjs3hSTacmXXo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AOeaXcHgcS8gRITC9vJQikp6DpqeJ3+rP7J0RGxSWFwjO1i3AFn/tcOH5Xc/isAvGgoD79q+Lh+2WHRpEvE9dvfRIOnf4j9ZPYDkiQfeBl07CzuRhboF2lGcAZNwWGLaaHKTzWqdn6fMh4cbwx890X0WXoo0dQBwdGGG+ihcgTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ABv8dEOD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ABv8dEOD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D55F1F00893;
	Fri,  5 Jun 2026 10:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780657022;
	bh=4do/Bla2HIKUt5+QXSzh9AyF+N3/T8ETx/kBWPdiWRk=;
	h=Date:From:To:Cc:Subject;
	b=ABv8dEODC5wnWSAI/Y0jixnqVackVEa7pEcjJQwo3jPlXaRe09Pn0j3QyIocbl67s
	 rAB3oSq01zELiY5z3qnn4hlZtia3Ev+fcHyi1f6TSkgUZ2TZav3oIPX8pbS309SjJt
	 pssB/pZLxN7jgNgLq5UhDytJJeYyNI6qYe1rgYIs1F979izdSa4JTHYY6GEhISi2rI
	 5dxv2fwgg28XC+SVoW5n0gVnrVMqB/xYvRgW5Vf3f/j0GbIfB2eB7xKlMx3lb7c2PH
	 b/BBw6dfkdpAu88qNZSl2hXvSVRK/JZfdIR1CHyhZQTPBwX9TIK4KFdTMKeSylfeWV
	 v/YgOqBCq1aKw==
Date: Fri, 5 Jun 2026 11:56:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: linux-next: manual merge of the vfs-brauner tree with the extfat tree
Message-ID: <aiKrepiU3-L6KRqJ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VXpRgygcICu/X7Vi"
Content-Disposition: inline


--VXpRgygcICu/X7Vi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  include/linux/iomap.h

between commit:

  f356603d90ebc ("iomap: introduce IOMAP_F_ZERO_TAIL flag")

=66rom the extfat tree and commit:

  198c3b90e600d ("iomap: introduce IOMAP_F_ZERO_TAIL flag")
  9f54b6894dec2 ("iomap: introduce IOMAP_F_FSVERITY and teach writeback to =
handle fsverity")

=66rom the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined include/linux/iomap.h
index cea6bbc97b6ef,3582ed1fe2361..0000000000000
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@@ -91,6 -91,14 +91,14 @@@ struct vm_fault
  #endif /* CONFIG_BLK_DEV_INTEGRITY */
  #define IOMAP_F_ZERO_TAIL	(1U << 10)
 =20
+ /*
+  * Indicates reads and writes of fsverity metadata.
+  *
+  * Fsverity metadata is stored after the regular file data and thus beyond
+  * i_size.
+  */
+ #define IOMAP_F_FSVERITY	(1U << 11)
+=20
  /*
   * Flag reserved for file system specific usage
   */
@@@ -345,6 -353,9 +353,9 @@@ static inline bool iomap_want_unshare_i
  ssize_t iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *fr=
om,
  		const struct iomap_ops *ops,
  		const struct iomap_write_ops *write_ops, void *private);
+ int iomap_fsverity_write(struct file *file, loff_t pos, size_t length,
+ 		const void *buf, const struct iomap_ops *ops,
+ 		const struct iomap_write_ops *write_ops);
  void iomap_read_folio(const struct iomap_ops *ops,
  		struct iomap_read_folio_ctx *ctx, void *private);
  void iomap_readahead(const struct iomap_ops *ops,
@@@ -421,6 -432,7 +432,7 @@@ struct iomap_ioend=20
  	loff_t			io_offset;	/* offset in the file */
  	sector_t		io_sector;	/* start sector of ioend */
  	void			*io_private;	/* file system private data */
+ 	struct fsverity_info	*io_vi;		/* fsverity info */
  	struct bio		io_bio;		/* MUST BE LAST! */
  };
 =20
@@@ -495,6 -507,7 +507,7 @@@ struct iomap_read_folio_ctx=20
  	struct readahead_control *rac;
  	void			*read_ctx;
  	loff_t			read_ctx_file_offset;
+ 	struct fsverity_info	*vi;
  };
 =20
  struct iomap_read_ops {

--VXpRgygcICu/X7Vi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoiq3kACgkQJNaLcl1U
h9DL9wf/eP13L3S5MpEASIcs9RMcaszcwVGVP1BhH2QKDTVwK51xlBQxpQ48KMJc
fw1PLJlQa5UG4neZ7Va7kpDgPq5xekHcvuN4t/lChewk3GZqh/JMXQ2VpqRsgrUz
ShSFU60lVTuK0AAd26e6F6tP1G7pvCtX0HDdu9mTgJANFoFHNDQzGnwPr+9+7+TP
/uOLaUBEGELeIzZ+WA+SgUi/v4SxhiPrlIvS3sqmQv9HUcTTXx8V6tuwFFmB1irs
1ZfUqYWXug4XarPM7WRrS8+J3ReSgsAJZEk1j/PcwrszpmBJjsQabcYwsgaUBlky
Zdlx6Bx1Z34RrmvEtWu+aFZ49W/vwQ==
=6ZpS
-----END PGP SIGNATURE-----

--VXpRgygcICu/X7Vi--
