Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCAD3A9623;
	Tue, 31 Mar 2026 10:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774954367; cv=none; b=UwGc0G6E+O2RsbpuzEipAuPbQ65ynoasJ4N6em5jhVlybA8hSirgL56acsKSl8buIkSp6u6XGP37KThl2RE5KGz0neK52O0AE4AsLkXDsvNLx4kJDZ5r/F6ixlDzDMxOqrFDSifP2bvADlSd5YKIPw+ftDAQ4PKuT/7wdT2Qfz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774954367; c=relaxed/simple;
	bh=XFhbjT7U92kTrDT1hMwM2EzXYKAaGALMBFpFTgfInN8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gep1I6TBilTHfciGQJCrWg0O7MRlr+Lm/MZrFCYzncMR4Z8zFcnyhZYv5lOKfkzBYJtWKEE6VvfIxGr9zrF0DUJY5z96BH6b5dmbwjHjI3l1uK5tljmFvYWBQG3pyt7X3lL5p8uouu8uVJs2xZS9MikguxwiUmNO2IYQABoV9AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jh2Mo7AG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jh2Mo7AG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E33CC2BCB0;
	Tue, 31 Mar 2026 10:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774954367;
	bh=XFhbjT7U92kTrDT1hMwM2EzXYKAaGALMBFpFTgfInN8=;
	h=Date:From:To:Cc:Subject:From;
	b=jh2Mo7AGuMlmi7SD46Jdmh7aMr0KkGErS5wCXLvWiFb6v87SvtlwQFVU7HkNqOvG3
	 8pD0HvjLN9nBqrShenzORE75UOqVoUByYdVyqAKFwY+K/6BSwIeyv5kt8JDzaAh5eV
	 nOBUayNXTed/W7XP+MfBtzeaw/vEGvxj91apni1d3DWGO1+M7A3VDWNjjdYeWT3rAv
	 FIs8CoIUbeHFzSKwLTaZiEk4lUOA6RCpKx1dpGOJWzLZuBKV4Nd6N+DL/FPdE8qH0x
	 QwavfxlNOLOibPqhl4ML6Iwvxeanq0h2EQPfqmUgrdHzF9Go/tHBI1Pd3vi9MhEqzg
	 Cs2X4ZIWVzWTw==
Date: Tue, 31 Mar 2026 11:52:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Kevin Hilman <khilman@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the omap tree
Message-ID: <acune820bjA13Sw4@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V1UbsR15s1Fhf5xD"
Content-Disposition: inline


--V1UbsR15s1Fhf5xD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  2a274187dd023 ("ARM: dts: am335x: Add Seeed Studio BeagleBone HDMI cape overlay")

is missing a Signed-off-by from its committer

--V1UbsR15s1Fhf5xD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnLp3oACgkQJNaLcl1U
h9BB3Qf+MTR8zXnTJIgitgp8frgz2rsnZkWFW1244P2+ejssrb5qUXoa6tuycHqq
z6rOO7slyaVkIP/hXYzh5M4anR+m10ROK26zxp/NuBgFx0d8RMFKKfD34AN0uvY0
fxwFcYLU0A93DWCABjitlbAV5eFWlBLU9nKRC1EaGOgKIWqJBZbVCMskA6ZNLCou
dFFlYFoVM7D9tbu79ZCNbyoDU5md/U/8rLtbuhnZ+JmTf8BcreujFVJ5gnAr5/6p
wnPyW+f1nCig20Sxciw24Ht0vyeATLlhXNxpZzdp0BZNMUp1HO/ByamJq/k7n3IC
zPNAz0zCHhOFT4lWXFNdWli1uqOlEA==
=8S/S
-----END PGP SIGNATURE-----

--V1UbsR15s1Fhf5xD--
