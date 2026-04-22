Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D57C4A23;
	Wed, 22 Apr 2026 12:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776859862; cv=none; b=fvnCZzHx5VZ0Q775RItb4uQT5F7tookHyUHHjH+zGi9S/tT9VjwFRfjMWGFbq40MMzRd4LTuC2JGyUvNche6wFUaX4zdcS5OVw2CaMT9AgcL4spj3M4e0Vb85lYY+1p+YiCx2tM2irSvrSGTdm2JsD3xUXpUysupuYZv6eFOcss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776859862; c=relaxed/simple;
	bh=99GjtKkMAt8wReWrMetAf97rMyDvgpcEZk1VokIhHCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ula43m0SSkckxdXHwmFcksFe/3ZfOLl1jzJS+4Amw7E3Vq0osjgTqmS36I+aQjLyKipKWvYdToaNBW5xOG9uMh88SvTapmDpbnDOAa6krUjsxaNjMiQTt8mkwmlBeenYeZxOOIZNxNyFeIQlC9582Pz7+zpbbLtVuYN1/Lmd9y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=auu84id2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="auu84id2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE255C19425;
	Wed, 22 Apr 2026 12:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776859861;
	bh=99GjtKkMAt8wReWrMetAf97rMyDvgpcEZk1VokIhHCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=auu84id2K0+TMY1yeIMGfF9g1aQlF5DIWnuxBErojINkt9tVE1R1qVHa0VpuCVfsF
	 hfEu/cVWTl+APTJQ/jclp0AaXLtuNtDQRp1DbhlXHxT0gZwwNGF8RZRT3NbGZCEJRi
	 8ikHKmxZksibThxpND2+mPTvr6BWSkXH2MRDAB6rp4aXSERKKkMtDGeYJrfaAolbPX
	 a8FNrsytUrva6McuEzxcEpdK9//iLxBrXTVoZPkpLDydMJlJkP56pfouI+/Q0Rxf/U
	 zaurQB+vTTSF3dnwWpDw4YdVzOUPZ8DDkEXoMZBK+MT9PtA9uJviJ43pq1qlOMXX1S
	 W2+KIspTXZLig==
Date: Wed, 22 Apr 2026 13:10:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: next sync updates
Message-ID: <9047f85b-b2f1-497c-933c-c880c5ef56cd@sirena.org.uk>
References: <aee_mCW8p2J6IbIO@kernel.org>
 <20260422093528.42562dac@canb.auug.org.au>
 <aeiWDGtG1ItO-SPR@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UZS396O7b/VYx6hJ"
Content-Disposition: inline
In-Reply-To: <aeiWDGtG1ItO-SPR@kernel.org>
X-Cookie: I'm definitely not in Omaha!


--UZS396O7b/VYx6hJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 22, 2026 at 12:34:04PM +0300, Jarkko Sakkinen wrote:

> Mark, the goal is to address the main problem Linus was complaining
> about i.e., late rewrites of Git trees (aside from late cc stable
> rewrite, which could have been prevented).

> for-next-tpm and for-next-keys will replace 'next', which I will
> delete after the change is effective.

I didn't see this mail until after I'd started things running for today
but I've now updated the config so the two new trees should appear from
tomorrow as tpmdd-keys and tpmdd-tpm, and the old tpmdd tree has been
removed.

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

--UZS396O7b/VYx6hJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnoutEACgkQJNaLcl1U
h9DqBwf9HzOsw/yMUYhOjRwLV/uJRSrH65oSkPIRi4UGlVmrvkPrqctPZdcifhM1
lNaZXYxpJ9cYHBoIFkzAN1HnifPy4qaIuGzP+j0JBrOI+m+RVGek/jYB0irxDeK4
yNmLUGfRONFK+Ot3jcZ+lRgkIN+AD8M7GQ4w45YuRlmY0B3/3uUH1dNNHXfZhsL1
8BjuibmcanQAAyiCcuPYw/BgYINKV2vCtQSWBO+2KGqHChC2zM7vwIq0Ws68AQ+Q
C/tqtvait/donSFpeBrcaOsMepKWboeyPSiQE7AyMGTX/E0zeU7BxsIn6ZtecejJ
akQDlgknp7m1imKdbNyGFDjcp+i16Q==
=plCu
-----END PGP SIGNATURE-----

--UZS396O7b/VYx6hJ--
