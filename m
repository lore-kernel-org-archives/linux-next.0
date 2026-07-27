Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1977288C0E;
	Mon, 27 Jul 2026 11:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785151749; cv=none; b=M9NXzoU25RIji6qAtJiVWliuJdv2bTTGE1hSqcWoH6LSWoyxCa4qSU+m0cp72G20KbyLj2eR53RvElHjqGrVz1EQgXTNGRnZH8ArkQ1bYuN6585kly4C4XQFi2pNIErcNOi7qqkS9jeOd7HZsNokGaGAgovs6XkUzB45oYczkmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785151749; c=relaxed/simple;
	bh=5Vh2QBwfsE4i6gpcLva7zCEbRFTvzjAROY8lVJIxStc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ijEU4aJby+8QWfve+cgRVXvMu9pvlGkIH59KTDtxDIuohTjfFYdlFl7GizqohZTPRrDECZ3H1Ux9lb4nG63SQd1iaTiuoKphL3ygS8+hjh6D9fNMy2bt3XaN1PVWyPWq8v0Q2kuYh5CnnB1Q2NEEqtJmO0+AFxGDj72oMMaP+zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hq31SGbO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hq31SGbO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C96AA1F000E9;
	Mon, 27 Jul 2026 11:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785151748;
	bh=oIO6GrGVtYw6uUj6M5irmOprPUbTZjzGzSdJ/dYspqU=;
	h=Date:From:To:Cc:Subject;
	b=hq31SGbOpd9NYZ+OTBQSK9DVnz5UIjxyCHqVM0dBE2JtzbT2ZpndS2kvJXfA6ezub
	 jKOeNVJDYynqAk1v1pglv6qIdOt1g1S2Q/7gC9Ssw7wjlKKV4JQq14Yu6shg/Fu9mu
	 NXCeMOQsaY75vTVKhVP1nWZ6xozqrIRHKgcPX0umag2e+P5e4UvN24OTxKH/c4JeeB
	 wxeGp4U4OpnooAl3KuZF3H3LazU+iwY/raPE0X6QmX2b/bmEzQIcFJJDZ23p92yhu3
	 3/pV2fse09tU9k5w3EcisJLkdGwb7liJnIEE6+Q0/f26lQ9MkuavW3Hloyp+fRXm/m
	 QHQWQEKJEmh3Q==
Date: Mon, 27 Jul 2026 12:29:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Unexpected files in the drm tree
Message-ID: <amdBAVcEPlQ0arBZ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UpDrmXPe/ndjJB1F"
Content-Disposition: inline


--UpDrmXPe/ndjJB1F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  ac3baea883dab ("drm/panel: find_panel_by_fwnode() return a counted reference")

added this unexpected file:

 drivers/gpu/drm/drm_panel.c.orig


--UpDrmXPe/ndjJB1F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpnQQAACgkQJNaLcl1U
h9B35wf/W4ihqgu3N9RBiehzehivS37Ah3Q1rIqFUSZQIgYxj+wXjksyY61Op5Hp
eEs24eUgt1AC9FdYjbZ4iWdWJQKlM2IyCeBzaPNuORq+YeIdIm54nk42vZGYeOLH
XEWTl851DIMFdbpHbiIMmHJwpikigz5hVEfBipYaVeXyx524mWmA1D8NcGVfQf5j
MndbMFXpULY4IuZ48C81hB7EAAAFJpp2oWm7/m9jHVFpx+ketGEpUH5iG1GnRUt5
PXRuKS1mh3NpK9kjQByAYRoslDxMW/49pFD78icDq1xbcwUneQIkxpzy2P8gwwsX
EcIvV/SjXe66cimguo7iUf9N5a57eg==
=FKIc
-----END PGP SIGNATURE-----

--UpDrmXPe/ndjJB1F--
