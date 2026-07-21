Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C186A37AA77;
	Tue, 21 Jul 2026 14:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784643864; cv=none; b=B+sfaEKoxyAuUbOsxXaiq4fAahgnhLQnS0brjua0Ari7YJBHljmLPF+eOSAg0VxRFDJKLUd2Ig3m4KOds/hqmeSFB/F7e1l0CB0t/qbMeurjtAcV6S9IVUPRLhqde2OmfLvrctkq6yiqMy9L4/oxQ2P5l7yG2VJ9IwarstL3aWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784643864; c=relaxed/simple;
	bh=HNH6DL8lBTYy1E8IeNhWO8UcShE7woxL5+sYupjpgbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j1kgke5TxpL7wCTBix9hofyo8Q1t5lAYe9omGqZWg0yi38b9WHU3MCwYGzOwPKG8JHoN4/EPtpBqLcRhNYFNhlqWxvK5+e92DwE+InL9OMka5O1DInHZXRIQSOis3PSE28YSRxqBU+Ca9MV3ORBL/46IxMKxFHbG14qgy2vr3Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ISG7DL8/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ISG7DL8/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D90F1F000E9;
	Tue, 21 Jul 2026 14:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784643863;
	bh=HNH6DL8lBTYy1E8IeNhWO8UcShE7woxL5+sYupjpgbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ISG7DL8/acjHfCGm6BVGocwhc8XYhrOJgK3cEr/28xuEQZa+Iqogx7WI0MJuhjkRr
	 w7EAz2q4TPKgrGMXUADplgsC/FQslCFwxWrC5vgxmEsjD39C6kqvS1kwJSO6fJBqZM
	 CA2pXb3x+MIVYh6OPxU0etWnlfMJJ2LW6wGC6AeiZdu6vkdYysQM44nQn6Qgw1Amjp
	 DnDsw40oU5Ctkxjvv/5rnf39KyCfhZ9y3BLJWDqOlX8U88gcxDg6NW1UnwN+ZosxLc
	 FLGPJuryjnI5U9/cFgE+okpGSJrhs7UtTGg/+LAkqH4k5i0JBZjKxzyuXrptDnWcZ6
	 /IpOrxwQ+dtjg==
Date: Tue, 21 Jul 2026 15:24:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the kvm-arm-fixes tree
Message-ID: <f9ea69f2-3635-406b-b060-cdb49b501d5d@sirena.org.uk>
References: <al9cA4bfywF11OmQ@sirena.org.uk>
 <86wluoeek4.wl-maz@kernel.org>
 <0604b71d-5a05-47f6-949c-26e0ceaf1b78@sirena.org.uk>
 <86tspse8vo.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ldKSactYHe8WvLy0"
Content-Disposition: inline
In-Reply-To: <86tspse8vo.wl-maz@kernel.org>
X-Cookie: Love America -- or give it back.


--ldKSactYHe8WvLy0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 21, 2026 at 03:04:59PM +0100, Marc Zyngier wrote:

> Oliver Upton <oupton@kernel.org> and Marc Zyngier <maz@kernel.org> are
> the current tree maintainers.

Thanks for confirming, the contacts are updated now.

--ldKSactYHe8WvLy0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpfgRIACgkQJNaLcl1U
h9ANOQf/cG6WIHzKp0EKTCB3Ynu1L5V0hgTQ0APh8APx9r+6NPpMp3bDl0mWHHV7
eAzbmB5j26Yf1sliqTPGome9QuiXo/FYL5eQaReYTeyLMwi5HjizmPYYYTDsSg6D
1QAyUFKn10RccTLpYSAN1l010b8b9xDDB3T5OyM7dlbzVZAfVM5dq0szt9R3+mUy
Ihvl/ayxSU9nf0F+qD3J81VE9xYxm5tgEGMAyUQqqPoBVG+uMc5491wROKAkTixJ
fpVUeUvhku2FgRA2ZhRjaF2tDPLKrcQLqcY2Sj4KTTAC+7UAY0dD5C0kXIBudcSF
qyLvkz5G3cDuu6F4BwBUsvWGpHj+tA==
=mDPO
-----END PGP SIGNATURE-----

--ldKSactYHe8WvLy0--
