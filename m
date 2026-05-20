Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAC33D171E;
	Wed, 20 May 2026 10:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271686; cv=none; b=PwioApTm8SSMnkqprqJ+zSQWWfAAk2V3Uollm6WFdXOz9vT/09gNKcHri45iV1/rR3Cfq/xwJ4B7x+oH7rc6klKFEapnybcD3JJjWShGrahTNZ5Gqc+AhHvBTBQoOFV+YRkHvkbfH23aDlrcjTLPAzWenXsOkM2R/NcD/lES8Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271686; c=relaxed/simple;
	bh=D+DnVY/eehWwln17QaAq8bHlwHdIuPuA4UnzqI3iZss=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FC9dJ8XMp5Lm/Ab2NrskJpBG/usugA8IEQP8pxu54xpSN/iLYX7o03tHx0xiQ+Xx4INQWahuSsnapZUCnOnOlE9DsXJiAy9l3NJgkeakARP/1jtQ7urvkYY9vflTPPGlM4DIMlPtLHZrpfI3fvLqOIKovfem68Fb0kfPuc9gKKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IGR8eSKY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IGR8eSKY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B0DA1F000E9;
	Wed, 20 May 2026 10:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779271684;
	bh=hBpKvcgZX/vvIxsk/43HBOOQ0tuUc4isovhZgDFe+3U=;
	h=Date:From:To:Cc:Subject;
	b=IGR8eSKYeBPp9wpHF/2s4FbkE5pztbN9jIzK38jvuyT6r3U9aiiNJrdiQ9XN43vLq
	 1X596bTyxQClAgk+dMiy8Vh2YvPCRQM9po0F/1c5dLNRqeugpkK2cXE+WNay0C4Im2
	 FiT5HYg/Bs7vumWNVlOzUVQC3ogHn1um/FQTe7G0Au80eBT3zreEVbxEOSzRNebYTg
	 c7UXjXeJp1w/Hx9Ve+3c9hY1ksId3Qtgfr07VvrRj/U9OpxuMJknfpYNq12I/+suJO
	 ordOaZVqE7eRXYv0KePoM8XCtirsy1ACoAkOkTex44vceGQGW/2nQaAxgpZiTSlk8L
	 nETtTraHczaTQ==
Date: Wed, 20 May 2026 11:08:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the mfd tree
Message-ID: <ag2IAVXkJ-HkDuEp@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h7FEfnG1GgIWwEL1"
Content-Disposition: inline


--h7FEfnG1GgIWwEL1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  07de145bd1a9c ("mfd: si476x: Fix typos in comments")

is missing a Signed-off-by from its author

--h7FEfnG1GgIWwEL1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoNiAAACgkQJNaLcl1U
h9CUxQf/TFBDlgZUVxznqwIj9E+doB2aJcVhy3sMxqOpaFFqVsLanvvbruCQ6nlo
9wbgNYyfWQoZCCsyfWFaFCiFG9dGQZ1AwtviKbnVX+hELrFnnSN+NC+R9AqfKtnH
8a04g8TSS8h/zLppWwTRzrCt+JQVtD3RH6sv+A16N0vv5+KK7lAxPWbl4/D5xKHP
xJSBvLxFwBm+tRJ7Iw23toQgZLmAwNuG7nHitqJlQB/+KCcGb7IaZ+sBIAs+DVPK
gy9ppcInBVu9RmTXNa7qNi9OHlmKKerq3oTAEZ9+Ua4fw30QATNtDYS247DlExoY
jj0OIyNO+O5uCONPiKQOGzaumZWTwA==
=DgZ9
-----END PGP SIGNATURE-----

--h7FEfnG1GgIWwEL1--
