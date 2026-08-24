Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AE5408028;
	Mon, 24 Aug 2026 10:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787568937; cv=none; b=bfC0IVKkzQCyXRFWxsDuhijDeMIJSy28pItMdXT8Is8fsWajI9sOZNR5aL0ETpFgbCE0FvZfUROigxLwG1rAmRkFb9mYZ+iaMj0ZaHkACpoCZoH0yGyiRH8HmGU0TSYnD+5YfDNHHucv1IDVNYd17liYzl7zINwsfoeky6rkOqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787568937; c=relaxed/simple;
	bh=FYPZESh/v6cH+k1AERKQuIjCzE1wNshjWzS6b/yr2jk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lzamvbRKxO4usQztl9I47cCt76R1V6v1sOvylepLwEjgDOD3HXGM8xiw5S4RhT30zBsNrYkRe3eM/Xj1naVbMaX8A22jv4RxQKeuyB9RoQsPe7VzmS9LevfvupjRI+ky07XFtbG5/HfY2Ln6XuUy4v1lcHer0dnQbSpL9vfJJTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NIyjcC26; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NIyjcC26"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A78E01F00A3A;
	Mon, 24 Aug 2026 10:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787568936;
	bh=lVC3M70POUO863GLBAK35cAivbJpDBUuoLP0tTpdOyk=;
	h=Date:From:To:Cc:Subject;
	b=NIyjcC26JM6L49fUpnHWw44sgtxv7RV+IV8Zw97/6JOrRk2zqXiMEcBrtmTs7QYvs
	 m+akq0QEKh6O+scjke6UQ/9Xw95SJCLbcDQ94UtYtDpMuA1GrK9O10pUl+HlMMSetu
	 UYnoBXjQ7T5wl8ep6hgy9+M4Gon2WJYgAynP9l4trUAammB+QKjbfz2nj4QouTrY7e
	 CrFA8TO/MyDKVnNCnPKZXRDWfg5oM1fvpVKhFyul8BLAQ0aBZAc8gG5US2zFK9OniW
	 V4MP74ZRef6rO46nYhyIM/EagPjkqGk3CmojprRXVixCdP6choGZ3LrojdYcZQc2lN
	 oFvea1EfkQvXg==
Date: Mon, 24 Aug 2026 11:55:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the fbdev tree
Message-ID: <aowjJaLyW0E-0Yn7@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AyZPeIGXFF5f90Yd"
Content-Disposition: inline


--AyZPeIGXFF5f90Yd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  5a4abc340e7b7 ("fbdev: omapfb: Fix __be32 sparse warning in panel_enabled()")

is missing a Signed-off-by from its committer

--AyZPeIGXFF5f90Yd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqMIyQACgkQJNaLcl1U
h9BJJgf7Bo6x5Jgzja/nAVtxMD/UsTW++v+S0FofzJrg9EDw+TfLAkiEqpj6WqcI
xrE8dnnz6pp8NatC8ZIQnLAPcp4meQptKrjL7l8Ie2zWs0xkKOyYt870UomxiDwl
SlobBGoBFhDr/xNOF+P6XVW1lKbNMRhZEXkSH7WmDcEaysHie3JgM3EQJiOCuBTG
uJrobeSsv3f4dKgRO3yhlQEk2KmBE9oF05WNh3ZsLGwNbJin/3F1rtnJw1tcVudh
IF0qxdIe20qaMZi04fp/PCBJPT5vRLc2FwKeko8wxNRPNWTK3ShNzUUXnXOmZwAz
9fyJMVDce11Cq4RCalctYCeUnPbsCQ==
=q3SB
-----END PGP SIGNATURE-----

--AyZPeIGXFF5f90Yd--
