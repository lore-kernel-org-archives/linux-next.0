Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943B73E9F85;
	Wed, 25 Mar 2026 16:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774455931; cv=none; b=IMs5DMrWzGhex4kO7Q2AtXknP8EU5MR1BlvWHJciuE4z4uDX98erdcwlDPXAwE6J4E1E6kas9lvzM52uMokdAoNA2wwJ+LZEPgXvK34NlqSRxdZdAldcC9a/rSjsOsyoBvfabtk4nwF/ugMRkFh/YvxlcjNiprIyXkvql93kbg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774455931; c=relaxed/simple;
	bh=xwckAkZbwI/208JX/TLiw3VB9/wUx0OGdh1zgEylEcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JyNs1Nc49u/chhzwUHDceKoJTUtNZiCN9wwRlWmUuBtO5n7hbbyj4Iemrl0A0PY+ISCEaovWmvNTUCfx194jd0BoJiZmV2XK9Q4fkOz6PRHcp3U4WEk5TIivBkIqSEenAopOpfJLOwDJHCXW1gO8AjXUMjoQvg2qfblesyYYxRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rFJ9cG3A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rFJ9cG3A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C09E3C4CEF7;
	Wed, 25 Mar 2026 16:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774455931;
	bh=xwckAkZbwI/208JX/TLiw3VB9/wUx0OGdh1zgEylEcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rFJ9cG3AQff+Q0BIgKon8VZaKhpQ7rr9d3g8kmFp6umtg5DAhj2y0gIc/jRrFCukC
	 K+ZyvIXKMatVCeTyJhX17hqElIinqapGJKoAtvh8m5RN7fZHUJ2EXxoigbu0mqoDyx
	 40wXpVAjdAvHj5qOd30PInd+MQGl7Qdb94pr82vK/YVVY0q2HZv9Wf4W4srKoiM4VI
	 L2HWV7T1OMqOsIOQAWPRIKMrHMUIM1QcStc/guxbPtevMwwdgioHUKURNbZYYZ1Kr9
	 IYWA71iqQAIW2nZFmYXfwiwEbqrg0nrTPLlU0kA0QlHBB6KZJgBPGPXefybRT476Ue
	 ruo/edwx+MIWw==
Date: Wed, 25 Mar 2026 16:25:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the block tree with the drbd tree
Message-ID: <902d1ca6-efc9-4c22-b2cb-b07cc27511a8@sirena.org.uk>
References: <acQCDMhGqwhzLuzt@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c9IBNKmLX5/FTuaU"
Content-Disposition: inline
In-Reply-To: <acQCDMhGqwhzLuzt@sirena.org.uk>
X-Cookie: -- I have seen the FUN --


--c9IBNKmLX5/FTuaU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 25, 2026 at 03:41:05PM +0000, Mark Brown wrote:

> Since I've got no confidence in my ability to do so rather than
> resolving this I have marked the DRBD driver as BROKEN for today
> (there's a half completed merge in the tree which shows how far I got)
> and I will reorder the drbd tree after the block tree going forward
> since it seems to feed into there.

Actually I had to redo the merge so the partial resolution got lost,
sorry.

--c9IBNKmLX5/FTuaU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnEDHYACgkQJNaLcl1U
h9BVFQf/WhA+ShKs0jUdMewvRJ2jE0+QmlVGrhIu9AksSB/vBGHNYKuyB+KVRFw/
SPjtVJ1ZJVDW0J8LoHZuxcZRSh9o2HFgj/6lXtKohCymH+U1+rWX/LiLCVL1FQMY
uio3QAfKp3YdSQRj1DrBWxvxij7MLtaR5w17B0yM1Xh/ktfaD16hLbG0LMhXjHNI
a73e4jO9YMWP87SoKaM9shZA/k1jYI2sneeuBl8HmXIkUpP4BI6oSiwdQPwoVn2M
eUon1kn3zeZWrb991ooMGixoCRBr/JnInJ12r0IITuBMdwcgkQpTXnx5xWBMmM25
2MU/AYAqqbgVkImRjv2lnLRzHu+vHg==
=6OAW
-----END PGP SIGNATURE-----

--c9IBNKmLX5/FTuaU--
