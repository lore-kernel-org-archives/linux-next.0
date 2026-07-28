Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9A4416868;
	Tue, 28 Jul 2026 13:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785243759; cv=none; b=KDeRIF/LZ4yjMdNd7laeds2hpGX0c8y6phqLt/UZHY6/GwyUEiSifJNmXcIcQ+mV4R+Lcrx87OVMCsiJrw2GmcFT2WzmdLOFsxPNL0UPVaYWiSVQeohu8qCtsa7IyvCTpDulZCgpBfNS6ltK2dusu+Il6z25Vl/0kXsXTyx2UlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785243759; c=relaxed/simple;
	bh=vvKHcbHyLjV0zyGwbEbJmg1h7imYa8CfLv7klyNsLc8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JheLlSbzjHtArZh7G4U13dNi3tzMOIG2WV/qV7d/dwkDOu8tzZuY2pA2bIjTMjjZcfEaMY6UKl/YRjFF3RePAZtEu8tmBEnpsx3zYoOECtUNuAEQomd8iAJcO8ysLO5MeWdGTXY57Nw/9JyiZhxXJj1hhIBEHmp2fHzD4v+PCMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WPETScf1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WPETScf1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ED641F000E9;
	Tue, 28 Jul 2026 13:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785243758;
	bh=Cci9Ar8S7UB9Kp6y19Dyo0e6dgQwmYr/fszskqmN/08=;
	h=Date:From:To:Cc:Subject;
	b=WPETScf1A+ZF3KRYLvPm49ItN7U+KoU91E7wwiVcLWPHj1uZ/BRfJYfFvgW1Ci//N
	 DLYJAFcaJspCa+3GwbOW/4iIf0G696PZdkLgCHB86jLGHrYAIa9M3aez0UMWbCYzMe
	 eFNUNzuMHszIkt9Dq4NlhFQnUTqY3cfKk/liCHXeq30LWRgoQHv1y37JJvGLSucEPP
	 2o1nzOndHsziLglfYholn3nVNpK2o7DRG87oxGs6ddFsTLiIzN2PO8/jOzTWwJGjIY
	 0ZCkP7NOJYZ0STBnZD79XrjLHbNViQ5l34Cfp8/7Eo/PxACbeTs6CyiFKg8H1H+qIx
	 8rEKNU//qJ+hA==
Date: Tue, 28 Jul 2026 14:02:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the drm-rust tree
Message-ID: <amioau65_SQzvgB5@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OnPLfJSBj73YdU4K"
Content-Disposition: inline


--OnPLfJSBj73YdU4K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  0aeed866cb938 ("drm/amd/display: Fix dangling pointer in CRTC reset function")

Fixes tag

  Fixes: e7b07ceef2a6 ("drm/amd/display: Merge amdgpu_dm_crtc and dm_crtc_state")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--OnPLfJSBj73YdU4K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpoqGkACgkQJNaLcl1U
h9BFmwf/SnSXgcSwaj4XCxWt+2xdUKgqofuSIsCKebEzjljIGuRO4XbYD3VPYBPI
Tub/spDY2C0ohGSEUEQ/CKwZikKvWKuvGcmS0+s0Jfh9bdkiE5WPWhKZNBSe05tz
EvJ/qdhL1P66/D0IF7g9K+UYTTcjgCMG76/4IC32yjqcd4s6d/bjy/sOt1JOvaqN
v2eyRMroa4BkjGM9INtUvDSinXJYXSboRLyIZA5Bs/l4ux4dt1r4glsXFsXIn86X
WlYV7tmJ4u29dVPBIru2Za/lK/lJC8oNUU1gw8NlLTTibx4L69QjFR0vAQfkWvWe
u2gOolVE6s2BBpZXybq/0521JkKaqQ==
=G5ZO
-----END PGP SIGNATURE-----

--OnPLfJSBj73YdU4K--
