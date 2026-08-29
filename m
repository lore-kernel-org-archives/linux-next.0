Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE20D35957
	for <linux-next@vger.kernel.org>; Sat, 29 Aug 2026 00:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787964137; cv=none; b=TtPqJBQaJW1DIuV2NfIBlXTgPqQ/G7Iql3a7ZCP5EgYQ0MGutmdnjOs6yzdDWGHv2WXAu15EcUvARoih26y67wA9r1GKOs4FoLSMwRJaF+psXMMqU9OZAJAyEE/OJEPrgXt3z9+I2UjDweyoMHbjZtt5WE/SGnSWfXjcizBu5gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787964137; c=relaxed/simple;
	bh=uwNP/z7p5vV/59/TkFQAhOu92IQzuPMVcuHaKTVX/fQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kr9vM4Egbsf9qmySVez1544WFDL/fl4rf0gTNDOn32GhD1oLRAtrIBgKgwgN5gEZX+eNPnEnyBBmH/R1Fj1is2iltoQFbppRZ5o2nBHeFbbwX/IXClgNz4FoM3ui7it7SCCzugKD7ZK3JMAdk7NiI9dBoGn+ju9X5a0TV8Ibw1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gi8BSiB4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gi8BSiB4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D7BF1F000E9;
	Sat, 29 Aug 2026 00:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787964136;
	bh=8j3MdT+qVCM+z/RU1OPLHltEm/6Dl3UA9rbOZzrY9wM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gi8BSiB4A9ovF7OYqE8rqZv9Ei9QGpg9uS0kcDmguVUGzY1z0Wys86UgLUW+34CZj
	 novNQ0VsBQ9ZXbHrHUWFTSXnAe7fzU0wbSNlVUnajqw+1dPuJ9zYO5xOSy/T4hxZnO
	 crd88mvYQlSh43FHt4mJbpwfemTIuhpuFwDv5eVeyWWoz9CeKHJvc83/pMcuGqtbSO
	 QPklKWS74lejnVZka+E4TCpl6UiuxBSQe4HEl/e90nTsG0iLsgKLANdzF34pEypm3k
	 Ms0FThQFJkufS0OIRh4kdL5GBPHe2XNsmMPQIXPuI1eln3rNFVtP6Uc6YH1sF+AX5/
	 bUOMS9XSOccyg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id EE9AA1AC527F; Sat, 29 Aug 2026 01:42:12 +0100 (BST)
Date: Sat, 29 Aug 2026 01:42:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Paulo Alcantara <pc@manguebit.org>
Cc: David Howells <dhowells@redhat.com>, linux-next@vger.kernel.org,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: Re: -next for CIFS
Message-ID: <apIq5P0XbbRHDf37@sirena.co.uk>
References: <d6f9af6b5fb15945b594c5fec0ad9d7e@manguebit.org>
 <e2f818f5-c2cd-4975-9be8-f73101a36081@sirena.org.uk>
 <752329b497166aed63d62ceb9c663012@manguebit.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aoljx4N/QJIdiozx"
Content-Disposition: inline
In-Reply-To: <752329b497166aed63d62ceb9c663012@manguebit.org>
X-Cookie: My vaseline is RUNNING...


--aoljx4N/QJIdiozx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 09:05:57PM -0300, Paulo Alcantara wrote:
> Mark Brown <broonie@kernel.org> writes:

> >> The new -next for CIFS patches are in

> >>         https://git.manguebit.org/linux.git cifs-next

> > Thanks, I've updated and will use this tree from tomorrow.

> I've noticed that CIFS patches from

>         https://git.manguebit.org/linux.git cifs-next       =20

> aren't still appearing in linux-next.

> Are you having any issues with it?  Please let me know.

Not that I noticed, though it's possible there was some network issue
fetching and got 67176fe3cb4d5cf6fbb821777877bba83efc048f.  I have seen
some systems having issues serving stuff with scrapers?  I'll check
again on Monday but if nothing else that commit will be there.

--aoljx4N/QJIdiozx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqSKuQACgkQJNaLcl1U
h9C5Fgf+KR55AO56v7MpeOJSUwP8zdgTDKlWJr7/QSLZ6M0wNR9eSK/ai/jLOyVh
zP4B4MJdpg33h3ixRV4xCweOrt64g6bTViiHZbiQe5Za/nu3qo3L6YJ3SFZZA+IL
WfW11OxM/xItHDavfKN1+8QatXzm8Z4pzhrT7EWddiMg7LI0x7Omw/waTR3UJo+n
B773tHSCmnX3dX2CJqcfhsj4bgz00AEBRPQe++RQohHdT/ELpAqU0wpEqqbyeTm1
GjRJ/RcPUc1r3ZkK5K8Hm4RBXDTcuPyTXPVfgUxTUldbeD+ytDBRXzbs3smEUyVt
sjgWc5e7Yt9dMCmTsu1xz8EEqy5ofA==
=Gf3R
-----END PGP SIGNATURE-----

--aoljx4N/QJIdiozx--
