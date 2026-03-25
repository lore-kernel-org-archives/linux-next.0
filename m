Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C4A262FD0;
	Wed, 25 Mar 2026 14:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774448050; cv=none; b=jrBMoLZUrJ48w8ciftj6fXUpblpQd7O0dfB/AkGkTsTtqtu3BJVW48UP2dClCibNdNlC9nIXg8ywAQdPY+YieiaOC8VU/gf0SiOna84H2uTNZwMYktu+bRlayLF14T/pcv7Dt2Y6mlRRufUQljYWh1WeoPFrNHHHsqa/xxWgR0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774448050; c=relaxed/simple;
	bh=VIbNOkf9BhzoWlyoXOhRiUUoFZG9wJ+V1sD9cQNlBQ8=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I4/I4W3x1BxpG6oVJS7d3AtHtXw0h0vl5+UUZyqVl4+KyUJf99eSfupPeXPeGtlt7tdovGwY9I+BxyG+yaiFX8Yj4tkP4vJjbGgikBG242vqlX+pZ+CrkmoimGdE4tJuHDCpu55jjIPm9DGkZDfxRW4CIGJzsAq7veWLJP0TXHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QfiPACHR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QfiPACHR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F9D3C4CEF7;
	Wed, 25 Mar 2026 14:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774448050;
	bh=VIbNOkf9BhzoWlyoXOhRiUUoFZG9wJ+V1sD9cQNlBQ8=;
	h=Date:From:Cc:Subject:From;
	b=QfiPACHRtYCDTbfSr7QNMeq8o0m+FcSSwvJGUDkBM1zFf7CmRhw55IKfN4bsPT8Os
	 i3Dzumv+GbrrZivioJy/sIOp6rEmlgKXSytvYlaUvHvadwjCX2EcCAnxBzxIjbw4Kd
	 iz8hJuwh3Y1sRerGPhp5m8z+JLbFjSYrO/XY4AWIm2B7eT1aC7/FklwPb/UlKjlEr2
	 oCtjmLlxcvBZpFY9s3R4VkJfAFX6IFhs/Lh2cj2armaIH5JoJCA5wZ9TGtfRwYbELK
	 1hU/tVgGJ9x8YlVOZuvcjhoHuutM6lN31YXjZbZxIw0V1BcvUlz50efGFB9XYtTIYI
	 0GFBOo4cR5Y3w==
Date: Wed, 25 Mar 2026 14:14:06 +0000
From: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Tal Zussman <tz2294@columbia.edu>
Subject: linux-next: manual merge of the fs-next tree with the mm-stable tree
Message-ID: <acPtrrkwagtafDT8@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IxLKVMH0Vl53hFZF"
Content-Disposition: inline


--IxLKVMH0Vl53hFZF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fs-next tree got a conflict in:

  fs/f2fs/compress.c

between commit:

  8066a7c76e816 ("folio_batch: rename pagevec.h to folio_batch.h")

=66rom the mm-stable tree and commit:

  d82869456217e ("f2fs: support to report fserror")

=66rom the fs-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/f2fs/compress.c
index 614e00b8ffdc5,f43ff7ffca60f..0000000000000
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@@ -13,7 -13,8 +13,9 @@@
  #include <linux/lzo.h>
  #include <linux/lz4.h>
  #include <linux/zstd.h>
 +#include <linux/folio_batch.h>
+ #include <linux/pagevec.h>
+ #include <linux/fserror.h>
 =20
  #include "f2fs.h"
  #include "node.h"

--IxLKVMH0Vl53hFZF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnD7a0ACgkQJNaLcl1U
h9DRfgf+KW3g0qXq3SPtlSykNoWtGToL/zhd0uzE+IWkMAYtdufsVRj01gWPVlCX
tRkziIDHlIYxegThw7hmrRyu5FUwBvruAE6yBvNFYdzyyJ6Up0XUbYYvhyOpMpGR
cZZ8mAdWmEE3LNs6n1VYYPX33tQrXA6Tllwp2pK5yVbTwgcmWiuqKYAbLi3OJTQ6
F2VZ+83soc2BosgQqgsz3NiLN/fTakBqYHyOT+u8Y+VnKSoJXFU6knDZ4OifBRWz
L8U17+G6tChD9VPO8TiIb1YbcKA2+b3/3TUnTPK1BzmC9c2wMsCy+pwOCRrQaX3b
x263wyLQXTQ6RKEZ8r4PJLKwCAtxJw==
=xPbm
-----END PGP SIGNATURE-----

--IxLKVMH0Vl53hFZF--
