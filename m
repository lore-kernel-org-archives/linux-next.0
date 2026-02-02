Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E55D36B07F;
	Mon,  2 Feb 2026 15:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770045769; cv=none; b=j0bLIB32OxV0p1gtZIuS/uDZatTr8hylL1ta8cCPC5E2ys8ehu2pQZB/7n7zkwX/yFWrnlolVOOj4AQqcqOzNxK0cKuPFqQGkrprwlZP8Ln/HtchDeyxDFzTRL4oh36rUWP0m1t4qiSWAVfThhb5JHXWKZAkT8qE4eH6Ttdbesc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770045769; c=relaxed/simple;
	bh=sRqj4RCP68xNRLhNDgyD8YGEA62k2/25+3yJLg9bLTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FsTqLKc/TgTFU5nQ/wznaaZUEiKwG3PgePzwlYZqewu8FLg8HXk6Z2QsyX0SjixIhxMNml1FOmXOUXaH8kGRQ/p4y7S+jOnHq01PN/OGkFqbDpcdzqCxsluNkdbNEKFHcSbE5SAocRRx/js2g0fmAd3x46grhGoJgQE73BUrWTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H6jg6YG6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H6jg6YG6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 739FDC116C6;
	Mon,  2 Feb 2026 15:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770045768;
	bh=sRqj4RCP68xNRLhNDgyD8YGEA62k2/25+3yJLg9bLTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H6jg6YG67OVB5Nu36WUZ2Nydsd4YhGdVpKjRYV+eIAobZENq4QRzXaa2d+0ZWVNgF
	 GSSybh7wCqeBLhqG790sFTFzPtd3qh2oF6ZodGUDRYf/sOYNyS44dZI0FgDAljxVXn
	 eAnpwX9xmkpdsO5oRUwXli1kcnDaTzRxwqlFLQf7h+TjXthUwmtIrKNnsbozZHtvrc
	 ATNY2x+IcPU7Co0N+myW7eGPQ7+f6dWrkE0o3FoZkshfUCCpTEji0EF+rFu5POF0n2
	 E2IIGD+33tCsJU6mWUVB0GHRzFJ7HmG87kr5WgFXoILZVeNn3aI2QaOoMMB7vFoHGi
	 At/O0O83oDB0w==
Date: Mon, 2 Feb 2026 15:22:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the random tree
Message-ID: <7bad538d-5b90-4741-9bf9-b4f6f708048c@sirena.org.uk>
References: <aXPso7beaFvlUYiP@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AXV+F2GVHT6R/8J6"
Content-Disposition: inline
In-Reply-To: <aXPso7beaFvlUYiP@sirena.org.uk>
X-Cookie: Bedfellows make strange politicians.


--AXV+F2GVHT6R/8J6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 09:48:19PM +0000, Mark Brown wrote:
> Hi all,
>=20
> After merging the random tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:

This regression is still present in today's -next.

--AXV+F2GVHT6R/8J6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmAwUMACgkQJNaLcl1U
h9Drlwf/aFnBdWGQWTTbx5GeAusSNic4xVl27x/fCPCYaFSlYnG/s0ptKrRzVEWd
Nwwzsy/Yu1Amx60s931T/kqjbFvvy9H8BXNt7pQC6vSrwvPE3OG9RWCgwo6jpHZh
7kDIGO3v/XLPbxfD+nSpPCpqEjOGqzwzsl6v7qTk7E7kYAE2KJPTutyDxsbWjt3Q
v1GO01As9T1N9fGoiMd1vn+FHcb74elMqGOYi2y6ayqQHGtvfkIxEOJFqk1RNNUu
1gE+exvbqCH0zwr+8q6QDb1t9QVV2Wx6IQ++gDvs4sKWl8vSGUSS5EAVouUzoufd
ZxX2J5Xca+1N1zX0dSTfI0mdS6ei+Q==
=fQZR
-----END PGP SIGNATURE-----

--AXV+F2GVHT6R/8J6--
