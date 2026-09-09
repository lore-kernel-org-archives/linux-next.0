Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C53434C815
	for <linux-next@vger.kernel.org>; Wed,  9 Sep 2026 10:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788950462; cv=none; b=qSOibfhSuKlTCzrHmCZXLFD9jGcJxAkfCNjDNzEZJozTWi2msrMHpBamfxx4XGkht2dl602p4jbFAJcdwZfdc27eQzFzkuLKliLg/DuSKL/5S1Q6BrPL8sXdK4o6Y6cn7xxBsfKAreGqckA8MaSEwYcCXilUyP8fwHsfQ6XyI9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788950462; c=relaxed/simple;
	bh=gtCtdVCCYDoGS2mSPebQtaAMPGZFTWhhkd/T3al+D3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N3Q8ptlG0c8tIKtq6iZqkhFdLl5uoiI7qnK32M7XJlLvJFGkuScoLw/rieK16Xpsi980B/+/H6Yj9fyRi4L4++iMUfvXAAe8og6Alyo2dxzpCvSTerOjSLKxfJ/HlhjfwL4TArIs6bcPkPcyokPZWZtSrmItCBJZ4JM23w42L0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YfOReCCm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YfOReCCm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DF721F00A3D;
	Wed,  9 Sep 2026 10:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788950460;
	bh=ZVBKH2aIpNI+z5bRo2j0YmAERuLzgnZtPkPB1NjeEkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YfOReCCmd5OmGcHSJmi4OWd5S/Mj86h+iuS9DB0xSTgw2jDTdFEqrXoxGFA7jiOee
	 hFeG2bZB3CuN1sMyTI3StdLHOK2sK8imhTfOf7XuE5TTn6sGS7RYCRqPFvHcxrxESn
	 6JAZbpmxXIhpGCyWBvwVpaGdfaGcI3rRDNlckZSlHsBsFYZrRjKOT3x3KmDwGpajan
	 1DRL5ds8TBGgUZT1w9cbodOtywzVcd1IQ6C8HYtwLKxyOmu1BRycCh0our54MZyVgT
	 3mNdZRR1Ryj8ABXn0rEF6lo6XbiC+z8N7sLbDg1lTrOHLF9uuV9VOJUZc80HeLexgE
	 /jOrDGyfAdZ+w==
Date: Wed, 9 Sep 2026 11:40:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-next@vger.kernel.org
Subject: Re: Adjusting clang-fixes branches
Message-ID: <1b069fd2-42ac-4d42-aa62-8495ecb85327@sirena.org.uk>
References: <20260909001531.GA3539957@ax162>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Yw+berQbaTQlaktV"
Content-Disposition: inline
In-Reply-To: <20260909001531.GA3539957@ax162>
X-Cookie: Have you locked your file cabinet?


--Yw+berQbaTQlaktV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 08, 2026 at 05:15:31PM -0700, Nathan Chancellor wrote:

> Could you please update the clang-fixes trees to use

>   https://git.kernel.org/pub/scm/linux/kernel/git/nathan/linux.git clang-=
fixes-for-current

> for pending fixes and

This is a new tree, I have added it from today.

>   https://git.kernel.org/pub/scm/linux/kernel/git/nathan/linux.git clang-=
fixes-for-next
>=20
> for patches destined for the next merge window? Thanks!

This was the existing tree, I moved it.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--Yw+berQbaTQlaktV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqhN7gACgkQJNaLcl1U
h9Awfwf/QZxHgUdo1+gZVGPeZS9wZ2TDXz+X6CSv30M5db/GWpCzi15GvnFdK6dX
YrDiXyTYPPmza1JGjiA8BhVZp65GHn6Fv8u28oG1MSl4v1ME0AWXYQGVw+JjIt0k
ITMNT4pvRPwXlkwb1ejbDxp86xMjphSNjDUmaqO9I/wLGpMtOiaC7JW6yTXf08v1
9OBgJe3lFX6MyigWMMl0DDke0+4mbo6oNFLJ0upSyJphdiXu6vm/PbeIWmozy1qn
sLqHEL2ZNVO9iu70QuLvI/ZY3+ZPwc+bH5xX2YT4FWfktfVOAtWRGoeshQjrUMNX
96d8XIGmGKZSxVNFfgrtov6yxi+mAQ==
=3y4+
-----END PGP SIGNATURE-----

--Yw+berQbaTQlaktV--
