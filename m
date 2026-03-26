Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A925242D89;
	Thu, 26 Mar 2026 13:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774531776; cv=none; b=GBgobs9YRKVeu6uaU6A5h6ch6r5UYbPedojYHtSYhIQyyiv3hkc9PIBPCp43xo02Fra33wGHaIH97nhsPIH6bjG5SMADEyEEm48qQrnrS21RSxFeTDRQ+nkAy2IUz2DKvX4vgNFqTluvzUpo/VazNjFoWcGlKyHbadnFlSRVzG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774531776; c=relaxed/simple;
	bh=hjXeRZLQljTOeDmSTXK4VNXwmctvh++948a9URgmvlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gC64fEQwEIRJaL2sGbub9LuDyD0wr/UjYNAXLmcFqB30Nn5nT6E/7BuY0Ej71zfyizQpx+k6hIOLTiTVKZqjpQebmJbxb6mrmNAJSymXhvn92Z/UoQbXAd4RT2EtzRLvgclfcLQy4dqcPfLF1qu8Qif4VZMvkQrkOb7ZjHOjElU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WCcGQ0/Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WCcGQ0/Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DC0FC116C6;
	Thu, 26 Mar 2026 13:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774531776;
	bh=hjXeRZLQljTOeDmSTXK4VNXwmctvh++948a9URgmvlA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WCcGQ0/Y57xmv1DhOSyvvqBMYSyxRARheMbyRn+sVdVMzN+aoc9HTBzQZr/p/rcp6
	 fkTgfgXvYRVMRDea/UG/6FH1S9nLs3IegT1HUpm91cqNMn9prjpZZzKXQN46GSCzbw
	 vkzpJ5GFZjuDKAkZbSjzWViNgf5Q3AJQaPPJZAmV1m6f2EJfRsMbLv/vzZ8ZjaAH9M
	 kNqQiP8AG81l0S1lOVtnLTfF01ll3Siqtx6W3LtwaqZdS+tFrFSRDHTr0MLQjRTdKO
	 K0aFdxaHnf7aBu90wR4KOQLYdWsbqc9tSstMw73Iw2XZyIssl/0dPcnSG9PYQo/W3C
	 YhL4BLBQRnmuw==
Date: Thu, 26 Mar 2026 13:29:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: "Darrick J. Wong" <djwong@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the
 vfs-brauner-fixes tree
Message-ID: <a3708ba2-57d1-40cf-9891-2ee0cdfee1e1@sirena.org.uk>
References: <acPjQfoS-k2oDp3i@sirena.org.uk>
 <20260325151356.GF6212@frogsfrogsfrogs>
 <20260326-festrede-moment-4e19b5069a3d@brauner>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ySWQUjTMmFJEmMyk"
Content-Disposition: inline
In-Reply-To: <20260326-festrede-moment-4e19b5069a3d@brauner>
X-Cookie: Here there be tygers.


--ySWQUjTMmFJEmMyk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 26, 2026 at 02:24:26PM +0100, Christian Brauner wrote:
> On Wed, Mar 25, 2026 at 08:13:56AM -0700, Darrick J. Wong wrote:

> > That looks correct to me, thanks for pointing out the merge conflict. :)

> Wait wait, the vfs.fixes tree is merged into the vfs.all tree which
> should have the merge conflict resolution:

I'm still merging the version from next-20260312, see my report from
yesterday:

  https://lore.kernel.org/linux-next/acPV19IY3Gna6Ira@sirena.org.uk/T/#u

The initially reported issue was fixed, but there's a rather similar new
issue showed up, I suspect it was masked by the prior issue since it's
in a separate kselftest directory (this is namespaces, prior one was in
filesystems) and the kselftest build system is less good at surfacing
all errors than the main kernel one.

--ySWQUjTMmFJEmMyk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnFNLsACgkQJNaLcl1U
h9A+dAf/X1GHGyUNODOz/IAtR2m15LKyVvx86WU9NWTWsMuD7uCBgvx5fxzZhnrB
NszWZpk87xfIGIS3txCv59QadxxZqmiiYbkhasu2CXU6QJYNLBoj73ylbF7pRQk/
rWE0SNA19XzbIZAB/lCxqAaY1kUlADtqqyrSGQcCTpEW4s9xsLAJYELB0UxJ+f1L
T3tZiaWSunRlGE3ankyulsrWDHLdhbOwgIhtveGjlJkfeLm+zge9f0N3+hzuTp3J
ztqWIDOB6zLkt8d66w8t3utNIIJPr21JwIFznRi8SyZwtVsrTFq76fssGA62gsRt
6ld708hx8uNrV4k9i333sEDooz0NHA==
=PUkX
-----END PGP SIGNATURE-----

--ySWQUjTMmFJEmMyk--
