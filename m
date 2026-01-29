Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156A7305E3B;
	Thu, 29 Jan 2026 13:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769694641; cv=none; b=s000MU5hhCjkNdzqqYdcy7gIv7jtuLCiVmeow4YSgWSYmjj/p2VDbvmeppomE2u8SbqqDhmVwh0uc/2Xo0OmvGEZ8C4yFCXnH+h7y0NOq/iwNKc/+70hfDquresTQNUsF7cAakaddhPtuNPaJ7x2EcZPYCTvtyaVz7GBZpDN5Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769694641; c=relaxed/simple;
	bh=WyilHLmNkuKjKBaRuHegv0qoYQMIENZ/5VESlcwLcec=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r3JpTbtFzXHyzh5D6WvffZS2RrZk2degADo3XtxLEZJ0VxyYy3ZHrNu3wxTrTbu3t25mVqJSC+cSaLcYxeME0c192iDWTjacJlKDa8MH6t5mWheZuJ+MIk3cRMGlTam/rnyfrg+3tfP/kRYZ3MAYR5g5m88BP2lMx3tgSm3/Ik8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AK7HtoEq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AK7HtoEq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 491CCC4CEF7;
	Thu, 29 Jan 2026 13:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769694640;
	bh=WyilHLmNkuKjKBaRuHegv0qoYQMIENZ/5VESlcwLcec=;
	h=Date:From:To:Cc:Subject:From;
	b=AK7HtoEqR9AfRJP4rHcQOnm3sgYSI9qnV7ye39fwFyttpUAcRQRXdA9YZonul51fC
	 OQnknkLuzyHiuxMs49uj7Owuxthv+4sAuuvVYo9viSF+DxIqFIhzgI/UUfXxUW7Cw9
	 KLisTJhkV5Lh01ltbMPVln85XUOPhHcWCdJ64eGerzwbFfFaf1E7rhi9AhNM3knXn0
	 MEEirZM/lei6iw5M+ahn3NIxsqWN/avcoAxQ7hI5B15PMm36tsj9XSg7JeLRl95Ikl
	 faZDFB03USQJstENw/n15zkV5n/PyIhXTRkzzh1RpPtrjfZYY5jrZZTaSA7In5SNgv
	 dmlIBC9VEPI2w==
Date: Thu, 29 Jan 2026 13:50:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Oreoluwa Babatunde <oreoluwa.babatunde@oss.qualcomm.com>
Subject: linux-next: manual merge of the mm-stable tree with the
 dma-mapping-fixes tree
Message-ID: <aXtlrOzrFg5XMSkj@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UxwAfq/lWjF1z51t"
Content-Disposition: inline


--UxwAfq/lWjF1z51t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mm-stable tree got a conflict in:

  include/linux/cma.h

between commit:

  0fd17e5983337 ("of: reserved_mem: Allow reserved_mem framework detect "cm=
a=3D" kernel param")

=66rom the dma-mapping-fixes tree and commits:

  9bda131c6093e ("mm: cma: add cma_alloc_frozen{_compound}()")

=66rom the mm-stable tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc include/linux/cma.h
index 2e6931735880b,e2a690f7e77eb..0000000000000
--- a/include/linux/cma.h
+++ b/include/linux/cma.h
@@@ -57,33 -62,4 +62,13 @@@ extern bool cma_intersects(struct cma *
 =20
  extern void cma_reserve_pages_on_error(struct cma *cma);
 =20
 +#ifdef CONFIG_DMA_CMA
 +extern bool cma_skip_dt_default_reserved_mem(void);
 +#else
 +static inline bool cma_skip_dt_default_reserved_mem(void)
 +{
 +	return false;
 +}
 +#endif
 +
- #ifdef CONFIG_CMA
- struct folio *cma_alloc_folio(struct cma *cma, int order, gfp_t gfp);
- bool cma_free_folio(struct cma *cma, const struct folio *folio);
- bool cma_validate_zones(struct cma *cma);
- #else
- static inline struct folio *cma_alloc_folio(struct cma *cma, int order, g=
fp_t gfp)
- {
- 	return NULL;
- }
-=20
- static inline bool cma_free_folio(struct cma *cma, const struct folio *fo=
lio)
- {
- 	return false;
- }
- static inline bool cma_validate_zones(struct cma *cma)
- {
- 	return false;
- }
- #endif
-=20
  #endif

--UxwAfq/lWjF1z51t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml7ZasACgkQJNaLcl1U
h9AHLQgAhrihooyqwNsRY+tG1utYibr7SPyNuItyYRDheltMqJy9xnMIwbNhs+Of
A5nCVwDTjrgRjJf5b5sH09Wj0THA78LHKxmPSS/M2bolQe9PUDqxGaxihxBu4LTx
K1cumCmuKdi0k1QCuwchT/Y0SnNKSF8HiQUsoApdy4A5RnMJ/glMAzZ2QMyKsYA1
C6WcqEkKzA4rXNxv4GwAK9tiMuGQxuyosxC/M8CacjI3sm/mYtIqc9K53EO5qfk9
mw8jcPYRq9JwEGgaibsjuLlZl8gZ/yl/3EKpNTOQesFyj4cX2r7k49Y8Ol2p+9aY
8L6WMuRuzeWfDsHkr4KE2yX1qiyzKQ==
=PM3e
-----END PGP SIGNATURE-----

--UxwAfq/lWjF1z51t--
