Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5703F23B6;
	Fri, 29 May 2026 16:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780072801; cv=none; b=LPzs7nkqBGRZqh/PyVG1in/gYo3HjzfKPTt5sBXqbZdL1i4I4ukMjdD0hiX+nw6XM+/7fryqD6RNi25vMjuLTnEBAbsZd20VOamhoY1mmSr/cr53xVDkPJMKOuBOtgCduZyjbjylOTCurVh92erj9gJBQftuYFJfiA8KnVo4CpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780072801; c=relaxed/simple;
	bh=ONnlhhgMX8wlHG08BRCRKbwy7FRgt0gWA1xQSd/+Xsg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gj7JQ1D2/LDWqhJJaxFRKI3ZPDaP1QPhqFxGLRePcuLLlXC0nf1JfboQjwFmAlkTZn3eYLaV27r0bGZcLYyrGINMe3s3dE2hWl2otAiU4yGsaOZazPgWu1lv0J/wMnfe2QlwNgBU2MfbPl97pi+NRp/tVOOMXv/GeLEECEYEYSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WJdlwxGJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WJdlwxGJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D144E1F00893;
	Fri, 29 May 2026 16:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780072798;
	bh=7VpBFviI5EyFtoIDPFAExBvyJWYX9IyvneA5cdw16Z8=;
	h=Date:From:To:Cc:Subject;
	b=WJdlwxGJJKsaO6vCAuYgpc9wOGxZ2yGbJJ2zdPEal/LoRrVEWv2pj4cdXdk6nd71t
	 fBXMDX9fMSIsLHVykyba8HPMhxaeOwP9Z2569Rk0XO6kpfD/wNNOb7ZmVLWdVk0zpM
	 Bx1szHTAqB0jONAc6eb5xwenMrtP6auZtlhug3yFTTtF2rT0GCsOiIGcmF1CwdTm2H
	 H+7vwpmX2lQCrGUpZjSnzGUiNEq/c1B85XDnARz26tdCgkuv+amvi6X+PSaVUjE5UV
	 j+yuphJ53yZWceRtI/u3ibZ0lywdDPNAo/Ubcj36q5gqUV1znKkAWoGIn0qynJ7/9s
	 kaLFRU9UAyCoQ==
Date: Fri, 29 May 2026 17:39:54 +0100
From: Mark Brown <broonie@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the pm tree
Message-ID: <ahnBWgbK1BBQfkY9@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Sfj1gW9gzmqnytVh"
Content-Disposition: inline


--Sfj1gW9gzmqnytVh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  f8d14b7bb0063 ("ACPICA: Fix NULL pointer dereference in acpi_ns_custom_package()")
  2543fbb21642f ("ACPICA: fix I2C LVR item count in the conversion table")
  53a3a7723c9ea ("ACPICA: Mention the LVR bits")
  d364d76f3d0cc ("ACPICA: Change LVR to 8 bit value")
  468adc6b1ff83 ("ACPICA: Fetch LVR I2C resource descriptor")
  f0ee0b0927f78 ("ACPICA: Add LVR to acrestyp.h")
  15a07a5a96d5c ("ACPICA: Fix FADT 32/64X length mismatch warning")
  555233110be78 ("ACPICA: actypes: Distinguish between D3hot/cold")

are missing a Signed-off-by from their authors

--Sfj1gW9gzmqnytVh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoZwVoACgkQJNaLcl1U
h9CDcAf+OD+yhlhtbfVZ+D7dzIqmcAjLHmY8NBGonj7KpI8aZvW47TwlcPnKvpru
XXBd51nmqLI9IfYQa0Sv56ASKbUvjOngeJ2w2+dTPaiBoBVjz+PbA/8S/eOiFU31
5DhEJ5szXP0t3KiNuNDCijK1qhdhAGW8LBw/1QyypghkuxdQNUjL7obYIHfi8a8N
0ZifzpDPVqoeZZANgqxqxEm0EpPYCEpfqa9G6zak7KnTvNODEmkB/WReAo9askon
m2Ho2pBOKsseiVjKK7Xzm3xl78OkMnCesY0ifwRckI3zQeZevCXiXZZNU+Ld9AqW
c0D/0DRs0aMEPGItsKiMt8MRUNyF8g==
=dkpr
-----END PGP SIGNATURE-----

--Sfj1gW9gzmqnytVh--
