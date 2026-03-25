Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3A93ED5AA;
	Wed, 25 Mar 2026 16:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774455218; cv=none; b=IenbdD7Zj7lhyZv9IU7WrXbCSkQixoaAsRiNPmDdsHkgOEeIRmsDadLo8NE48EmVavdqy0WW5/cvlE5HP+bXCeukw8JEQ+PGc25cY6ZJODSsba8BTGHWDBDhMPxbWb5lWx0Mt3Z3OxOXXve5hIGP8BtHwRIeLwxvo65NU2CFVTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774455218; c=relaxed/simple;
	bh=GDxAGDcNjq56c/6ORixmUhe+JahQzkg18fLOwjZMqFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sgOkmg5HPoeHM73S05CyZAYDeQFQb44smsfs0JvcWAKOIiPW2+Dcd8A05dN3+i3G6mgusJF4D0Tt/RaFu9ic4Ti6gXBV0V033lXb10p9Fp1S3AzZ8Tu675EEDHtOIH7Q3OtMLBUZucA+p/Vz54gypUyFBtu6qZfHaIAisLHV9vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R1r7+RQ8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R1r7+RQ8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0D59C4AF0B;
	Wed, 25 Mar 2026 16:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774455218;
	bh=GDxAGDcNjq56c/6ORixmUhe+JahQzkg18fLOwjZMqFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R1r7+RQ8iIsAWwEOVu6QrxhFNgAPTJ0j9nRARIvbvevJLfGxU23iQhi4KGXdQGPNI
	 k140sqWZUKTSpbGeeBOPu8geFX8h++8pcGAN1FCqOjFRAx7DUzSJ4d93JCNlTbx46e
	 vx5piKqxvn8ixckMXhE6uWjDs/vjRSxzPEFw2DOSmznGWc7IXomsc3Z+orpU5cE2qM
	 QmxR3oyetErfAQDT8MhGNHK3Or2VXmyujWCFl9Ty7s6YYSCevUrh8iNYzdC3iU+6GD
	 nzeogvrYQxkEHShPqFkCXb8cueNCgDWG0nlW3DPD17nusk5+cPzPifQ5XRywlejVWP
	 Tv4QEoI98+G+A==
Date: Wed, 25 Mar 2026 16:13:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the block tree with the drbd tree
Message-ID: <f39e87cd-3709-46aa-8b95-13483785eb9b@sirena.org.uk>
References: <acQCDMhGqwhzLuzt@sirena.org.uk>
 <1fdb5cbf-fd41-456b-a2cb-c270353cb871@kernel.dk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QLe2R1x71y8MLLvr"
Content-Disposition: inline
In-Reply-To: <1fdb5cbf-fd41-456b-a2cb-c270353cb871@kernel.dk>
X-Cookie: -- I have seen the FUN --


--QLe2R1x71y8MLLvr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 25, 2026 at 09:56:57AM -0600, Jens Axboe wrote:
> On 3/25/26 9:41 AM, Mark Brown wrote:

> > Since I've got no confidence in my ability to do so rather than
> > resolving this I have marked the DRBD driver as BROKEN for today
> > (there's a half completed merge in the tree which shows how far I got)
> > and I will reorder the drbd tree after the block tree going forward
> > since it seems to feed into there.

> It _should_ feed into there, for some reason their tree got added to
> -next rather than go the usual route.

It's fine and normal to have multiple levels of tree in -next, some
trees like the soc tree even require that any pull requests sent to them
have had some soaking in -next.  It does look like this goes in as
patches rather than pull requests though?  That has more likelyhood of
causing issues.

--QLe2R1x71y8MLLvr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnECa0ACgkQJNaLcl1U
h9CCnwf7BoAf5OtTjF63Oi1uiP9YjJoFuH/FfeCk63uynBev7FPitVV+nmqWQLzr
+tklUJirMpxmD0lcsSKtrHfAj+gTr1R2vRvdHc23NE4DHYlImrKUANcSfrtZQ7MP
Hdmpa4vLxVgrHqxPiZvkDQQ4NnuO0CM2jssPHPLBpo9AZV0+XFuAc56+NDMOPZrZ
/YYPlB1XirIx7tHi/pHLRKhK0/pZoVbSBqFLK6dOkKCyMrGIyktfzCbAN7BAHUV8
m3iP1WkpCb/ULQN0txNCXSjuXa5IVXAlEEeSzlYRIPdY4/vQSe0+8zIEIXO9BDY3
7ajG0cGBSnMS4SqBIHMdcp4TZmRHQA==
=s2xC
-----END PGP SIGNATURE-----

--QLe2R1x71y8MLLvr--
