Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CD6E55C;
	Mon, 26 Jan 2026 12:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769430120; cv=none; b=PG33kfgt8ezCwxV/q+85qHGqqxZHME6IGnYbXIcodC+Wy32C/QeG3dxcU5NaggZ6s4pXY8DSfqLR8K6M1LWoVC0vBqk6pEtemk9k3g3vW43pyX3xThc4xg1pTcYKWeuL9CqerJ5pdiG9A+bKLQ20M1FWwzh0aXkGvIG/k/sTdUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769430120; c=relaxed/simple;
	bh=a5OXUMDZpV/uYOBsmnG6p7YO+00Z/60yDGHsMS6/e9E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BTIf0xB0OCEMrEeUi6bCeeAlk9nNcHC0+iDjbdc1VprG3jJ/EZJMdS6HUjRxHeSyQcFYGEEHtTJO43Kj2NeC/WPrO9XJT2aEONDx3Ck1EKG9w0xmZ8UYMSscAVeqHK2CH5shqG6xUiCqarFa42czexlpwWJmks3JcDFlyfsOYOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EKMjkxNn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EKMjkxNn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACCF2C116C6;
	Mon, 26 Jan 2026 12:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769430119;
	bh=a5OXUMDZpV/uYOBsmnG6p7YO+00Z/60yDGHsMS6/e9E=;
	h=Date:From:To:Cc:Subject:From;
	b=EKMjkxNnZsBF5ixDFmIZET76whQLrBdVvyetfFvDlk0b5pSC/WNy6nSuKlAR5Pgkx
	 kkvUiHXSQl32oqpnzPgy/0BLAaVgEZ3Ts8ZrOH7c7eDY3XOzOho2VBUQ0AHYbNXc3Y
	 HLfW+K05UBGVbaelErmRU0HAbaVg40Qh3krzzsaUqlC1qlyi0p63Ys54ss9vd+dYCx
	 vCLrd2yNy72/ZOob8jd4S8O7i6XGg/nsf49ge5V0qiqlwp+3I52WQgWuJhmz6NEYwq
	 0D7vIX5WmD8Ef/jT4IqJHzYdRusUM7fG9oqWBfdkduvuBC+I/X5Jnw4bnIHmWJvsr/
	 15loZ/zIqjWYw==
Date: Mon, 26 Jan 2026 12:21:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Andreas Gruenbacher <agruenba@redhat.com>,
	Steven Whitehouse <swhiteho@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the gfs2 tree with the origin tree
Message-ID: <aXdcYzuVogTFGWyf@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wFIZknKIfJFGPqf3"
Content-Disposition: inline


--wFIZknKIfJFGPqf3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gfs2 tree got a conflict in:

  fs/gfs2/lops.c

between commit:

  469d71512d135 ("Revert "gfs2: Fix use of bio_chain"")

=66rom the origin tree and commits:

  c0c8c960ab932 ("Revert "gfs2: Fix use of bio_chain"")
  910869abc1ca8 ("gfs2: gfs2_chain_bio start sector fix")

=66rom the gfs2 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/gfs2/lops.c
index d27a0b1080a97,e03928def87ed..0000000000000
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c

--wFIZknKIfJFGPqf3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml3XGMACgkQJNaLcl1U
h9DxcAf/e+NIboBSb6vIk88ThcYUX3il5bTpKzpB1oEOyJGRp0QCJxw/oszsaR45
AcjJfLAac4eDasoy2FSc23GhUgy8+z65XSV77+KYgTHsyTbpyRWL1vuvyVNCRVQb
G+5CoDtsMKxtOFl0fRoNQlCjVQKmSts2ZdoiXL4QyqoJ8VaMG4XqDcP0soBRMZsK
mWQkoFKKXTzd9xp/72ySeFhzuL+TRLOb6lAP/jVbNaY3UL6+umiDteoHeNO4OJjx
3o1q8i8pjA+sy4bxS+i2QxGBx8quhq/oHe+daFFM6YXZ5iPmjICBc/3W5yAL6312
2lNUoAPe/ou+MRDPHgroxaUb/TodNQ==
=Ew1G
-----END PGP SIGNATURE-----

--wFIZknKIfJFGPqf3--
