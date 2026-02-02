Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D752136F43E;
	Mon,  2 Feb 2026 14:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770044191; cv=none; b=q9cvVIOsKnqRRBGN5j5cN89BsHt+6OQyZrUp2d4o1+rfQaj6uaYi7v37RCOYZfGaIvCi8M6zIy24kFUOfj8Q4p7U/pcfTr8H5xnnYRod0BYNyeHcAZZEmtMq6pVM7AeM8D5+jTEF3iY2bw2usySGlJVLORfoQb9mmTxISq913t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770044191; c=relaxed/simple;
	bh=xmwx7OIwijZF+b4qpuOsoAQH9IFDxQXDStZ6hgeWbeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ktFao9dcFuBdfpKU6jDmju0++r1lcfz940sy8bg6w8zXN9QQnK+IzPVY3wsEXH5RluXLy5vK/U9a+i+D9TllvrxkFxU6kfAz8j7IL4+tIU258ibrFRLSUo7q7jQ87ZwJzWkcYHHnuycc2sn4COvvV+/Z+4MuMHknDs2UBHOBYR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CHBZs2j7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CHBZs2j7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40F9CC19425;
	Mon,  2 Feb 2026 14:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770044191;
	bh=xmwx7OIwijZF+b4qpuOsoAQH9IFDxQXDStZ6hgeWbeI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CHBZs2j7lpDlU212zQ2vj+FE1XTJvFnCRQC8VSiZZC+Lpa9mRTcQ88S0APjFGtU8r
	 JlHbq3VbXwXLH/MBKlGBFvpsUchOx/nIX6gZyNK+XDxnxcJIcz0Y4ubvaa92hltuq2
	 iFUDJvVED9ptA1vQLIP6BmxFO1w5q91Tv3CZWKHQNwQIJ7SZHpPLukmm6Q+VSEmbpG
	 8mSrHC4pdon+CHYAbVsjO8TVDhJAV2vajxlh0m9adYMq5zpwFQui+CatM/UsgKTBIL
	 sHB+TrUkGHc4meKAk9Vb4qu0aWaL5BEN/siwG/eJ7EnrytPh8RCFOUGq8wZFbgvAzP
	 3AF08ReMAP5RA==
Date: Mon, 2 Feb 2026 14:56:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Lee Jones <lee@kernel.org>,
	Steffen Trumtrar <s.trumtrar@pengutronix.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the leds-lj tree
Message-ID: <aca32e97-9fc5-4cb7-908c-a4410ff98055@sirena.org.uk>
References: <20260109124558.25b0eebc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zBU5l9eNU0b54IuQ"
Content-Disposition: inline
In-Reply-To: <20260109124558.25b0eebc@canb.auug.org.au>
X-Cookie: Bedfellows make strange politicians.


--zBU5l9eNU0b54IuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 09, 2026 at 12:45:58PM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the leds-lj tree, today's linux-next build (x86_64
> allmodconfig) failed like this:

This issue is still present in today's -next, the leds-lj tree is still
using the version from 8th January.

--zBU5l9eNU0b54IuQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmAuxoACgkQJNaLcl1U
h9AVQgf/X//R3K8YZdt8eQtUx216AQDd8oROKWFlSosmhoScWwrX5ewvsz+29NzK
Onni/LcBiwKecaWhvg3cxm42oYBN9QVxaKOAZXAOHL41TRdLRiCt/qzpNPKv7/0Q
kagWhATFqo6fK08fOS6Hhn5UUpyUqVXC44Kw1h/WwpdvRLhbtuD9cuLt83TJwhd/
zAZhu9ThE7V4r289KUjcwQ/jw1orAqhQ5MJJgLhv7V6QBwv2SmoKRpqn3YJABjzo
NffKvq6gu8f3ov00crO+/idzKUsZbt92oRy1hRguJ/jxI6IHkfbvMRpN82jOeR0T
cFj3gRDqxW+Ctmc+hrqhaRm4e6gGMQ==
=m0VD
-----END PGP SIGNATURE-----

--zBU5l9eNU0b54IuQ--
