Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F212BF00A;
	Wed,  8 Apr 2026 15:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775663113; cv=none; b=jzyfn27vdSiFKZvBh/RH9TvYjsgzjlFq645VokTIXkafTzgGDvMmmFv3XceSejulv1k4QAHvVip3H6LM3qFsvHqeliV73AnjjDG93yUQl8WIFa/R+Cfju+Rz1hWxPyjjv6A1h1Z1vXSyH8rGycBBfs6jFt0zvFIAjGwAGnlqAnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775663113; c=relaxed/simple;
	bh=5zgkXCADh8GS7ioX3vDgl3SOshD5pNkgKWFJrutI9tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S7c5o1Luvjfr23qq3k7qCMSV+ywi+REZ6ehKA5M1Fl+j9sp3+nidGbqEEVi98pJGGnSgMtoEi0aQw5nLdag0AR0j77n85wlB9SUM+T44OFZ/fKlTEzFHQ1EwnWx5+hJI/IC0/HHKnw5jpfp1T5S/yRDrnR9opomklzz2f2hHuK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qL2R0i91; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qL2R0i91"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF47DC2BCB6;
	Wed,  8 Apr 2026 15:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775663113;
	bh=5zgkXCADh8GS7ioX3vDgl3SOshD5pNkgKWFJrutI9tc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qL2R0i91lKY79RU2rRr1nJ9DRPiKweb9V+5JKVi0SY8ud2BC82EMJPQjNeiCghNsh
	 sjklwaGIIrt0HxUC+GIZBhJT0qL9M0oBomriQhE67mPl1hVTBNCeygzZyH161o+V3M
	 pXGX/XZx3mEzjZEcYSDDVvKbAaOdy34N8WrJ3F50eFq5FhVWjb0QmkbnLmKcUlRwZE
	 BTMUmJMgykgjE5PUN2wFKH6ERFMvCe6iv80qc6z9Aochlajgrfpjk8tIXzolWOo9oS
	 Sfhi0ZaRDWoCH2t86BudRyohCM9+in3SB+R3ipYX/IETV7OHKw0G+ZKmREGBXJ2uFo
	 uQI67mmy4VABQ==
Date: Wed, 8 Apr 2026 16:45:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Josh Snyder <josh@code406.com>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip-fixes tree
Message-ID: <8930589b-51f1-460d-b0f4-391d84e322be@sirena.org.uk>
References: <adZNmIpSOkd6P5c7@sirena.org.uk>
 <87wlyh32bq.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PH21Aae4kb61GQqI"
Content-Disposition: inline
In-Reply-To: <87wlyh32bq.ffs@tglx>
X-Cookie: Often things ARE as bad as they seem!


--PH21Aae4kb61GQqI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 08, 2026 at 05:21:29PM +0200, Thomas Gleixner wrote:
> On Wed, Apr 08 2026 at 13:44, Mark Brown wrote:
>=20
> It's a boot not a build fail, right?

Yes, sorry - the -next tooling understands running kunit as a build
command and I need to remember to edit that bit of the message.

> >   105c42566a55 ("ata: ahci: force 32-bit DMA for JMicron JMB582/JMB585")

> Found it with qemu and pushed out an updated version. Delta patch
> below. It restores the behaviour for !force and delta <=3D 0 which is
> required under certain circumstances to get through the tick_periodic()
> boot stage.

Thanks, hopefully everything will go through smoothly tomorrow.  As
mentioned on IRC I'm also holding tip at yesterday's version since it's
also affected.

--PH21Aae4kb61GQqI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnWeAQACgkQJNaLcl1U
h9Bmcwf/XIP4XvLLIc832cjT8g8MQZ6cAkkeleyFIwEzTjxV2OavWb0ATV/4iiHv
AdhD8AacBy+ZlCVNSZnu89aRbY8ALJ1/NgU270d6Xe9lWklQF7kPaantyd6u09sI
z+7V7A2c/xcwhRxOyAto7yulCLR+QTwezNVs+nR9nJSDfQUIwn0G//iBGS9TZLQV
0JFIvVpPhu9jA2nD0YCSo1TUQRKIdwXCADpaAl6i0eB+m+nRO+8+mjH6GAq+ICaf
mbTTzU1bUrOve6NQOmKpIMWasG6Ap/VEkUva2VFOW6IFRtq25hGkL3o32a4i+aNz
DIUl2BgyglEfApRxpSMy3GaRPFoFug==
=BRq2
-----END PGP SIGNATURE-----

--PH21Aae4kb61GQqI--
