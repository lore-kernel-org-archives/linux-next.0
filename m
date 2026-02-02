Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DB637D123;
	Mon,  2 Feb 2026 14:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770044319; cv=none; b=obJN1mU5uTd57jFWkJpGsvLfrnsy6G+gkSDbQC76yhaY+2KUZSoeCXwWZBekZfju+CyTuCmJ5QajAZCSZgLQrO4hCWs0X5kZj6MWa7KbT9XHDslirlX2mOp9bcwqjj5y2FNPND00PRkGEwoiDT/vXIOqFzS6HshmFQMG6ynysE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770044319; c=relaxed/simple;
	bh=7ZGImHU0GcYAdoazFO2AQDmnGSEnm1zvIYbhLqP0xbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iuuzraVP4W2xMT9BVa2/KTkHmWr2tFCZVnFBM/ONZWZB4SF4+CMSW0HSpbiVYqq7R88IjB7ZukMoyE7/kTYIy7FgZE7QcbtZz2OFJQ9rmM+Nb/ACAqAGLzXvnyKPvIhJBVJ9AJEFoaMYjzuZuradksAaXfHNysBiVn6ekYkzafc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jA6MfjRp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jA6MfjRp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7668C116C6;
	Mon,  2 Feb 2026 14:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770044318;
	bh=7ZGImHU0GcYAdoazFO2AQDmnGSEnm1zvIYbhLqP0xbI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jA6MfjRpzXHfD8plRbFublf9eNlm6JTH1A7VsljASnJtYeSOqCgbwI+cDVySnO7W9
	 9u46jtEe1i8IW6LM0qVczC3UT9vlXhgqmynT3c/8akCzKbtmdt8z1aYn0ntDP0alVH
	 uh/CAUwQTaH/boK50cj4tarlevWhS6sbWb+jZ9vx9/EkvxaJJYvuXgSmkFDpCchMTZ
	 uVYpkl1CL+tJXTakNLgR2R6Hww+YJep3BWrRlQ/QTTAHSXzYiTurkDocWy4LE+lcTX
	 P5ZoZETTshv4gUhTLHd5WacojxKUPN+ZhR7V9ErFSBiA1PP4k+DJdSzsSVVnp4cKdL
	 Fsd6/ywQwUCeQ==
Date: Mon, 2 Feb 2026 14:58:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <f9afaed3-9db5-4725-a0e5-cb6d6873b3c6@sirena.org.uk>
References: <aXilaLSzB1xsGWCb@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PaIZePWGbgjUfpY+"
Content-Disposition: inline
In-Reply-To: <aXilaLSzB1xsGWCb@sirena.org.uk>
X-Cookie: Bedfellows make strange politicians.


--PaIZePWGbgjUfpY+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 11:45:44AM +0000, Mark Brown wrote:
> Hi all,
>=20
> After merging the vfs-brauner tree, today's linux-next build
> (arm64 kselftest) failed like this:

This issue is still present in today's -next.

--PaIZePWGbgjUfpY+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmAu5oACgkQJNaLcl1U
h9Dfcgf/dSPAhaAQoyKSdIvJ5VnwIJSbr2Gsg1ip5BpChrsXSSpfrAwYFEbrjzUQ
qhDijJV4n2guHKMiArxmwG5bu2QOvrLfxwre7XJZh8N3Is/yYcLaixsMW28yQOHV
eRn+SAYsh1fOCxIefP0gg1u2G/WYEMWpirTo+qpG+K5L9qP3naiZQfbFDcHW/SKc
J4KjaeQ04Pl7WM/MB7EnVp1xib+ewDxYu+zIBmD7ESUfLBeUbg3zIjC5SfdcnTBk
SFQAe2JOi9gL6sRB2OMV3GMGR2xblKYGICmg5hRDpJxQ0kpWb9i8tXlvkHB9Q1DZ
vz35vyhkbvXwfN9oD6/axywWmSqw0w==
=oqXt
-----END PGP SIGNATURE-----

--PaIZePWGbgjUfpY+--
