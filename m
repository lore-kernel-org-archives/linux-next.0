Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14091470E92;
	Tue, 18 Aug 2026 12:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787055969; cv=none; b=tgjcRfe+sbDADUmQfm9AeI4KdGT9rjG59065V2ssWm4BJQA2oaNMMjtlX9Xz6p0a5FD1PttoN94qVE8exAMV4ZySdDdji7v4mzTWAnMOMxh8aeC6kbJRYml9SPWvUk+QpJH6SKEI7Tgrss05CfTzT73goMvq2wMvl6OR+Ph9Wu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787055969; c=relaxed/simple;
	bh=1bUVKMwX1OGLBxt/EYzzpNrntCihHwockvPlWvIwCOk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NCn2i93ZuCSrMJknadEbaEAIu440pzPF1A3I473e5tpPUakfDLOh3JQCqParAUhyy/PNFObGy2XsSCW0tyY4Y6kTZqFJGmzmBiYH88KwAepdb3Com6Y9LjkWywXkO3gPFCyjLy5aEGSM2JEVS0PWO68S4ck1GAIc2JUZasOjzRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hkjy9+XY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hkjy9+XY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C19941F000E9;
	Tue, 18 Aug 2026 12:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787055950;
	bh=oSl6EIhXyBl5OB1rb4PPjwJI1HWPlb/7gnWzl/u9330=;
	h=Date:From:To:Cc:Subject;
	b=Hkjy9+XY6NWKmg2BNshiBe0pJ1hy878/Ry/5AnlqVHKer2B361eagW5JK5v4Zcbas
	 adQBzv5JVz9xb9ES4IFEE5qbMkdp5SnFN127k1VGv9BJviwhpasJI6LHefOY9h18EJ
	 tscAgcB7TjeehDC3v2lrxNyzhfWhCoBBvKderfDx4L0Fjg7baSx97/630spCiPD68V
	 hGh04G7jOYddboqCD20BYmNT4dII1m31tgmjYt087ri1abKBR7IKlILtkHPNfUb5Ti
	 xE0W+6d/HyAB7BzUUMofAIu4I6BVlOwLWkiZimEEZW9ZgGtvSUfHBmwYL7KSYZr/ku
	 GmK9ETUmGFt2w==
Date: Tue, 18 Aug 2026 13:25:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the drm-intel tree
Message-ID: <aoRPSlTUvPDlZCdy@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8M6BfoD15ssaWBU3"
Content-Disposition: inline


--8M6BfoD15ssaWBU3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  3b1f4d5e47b36 ("drm/amd/display: Fix dangling pointer in connector reset function")

Fixes tag

  Fixes: e7b07ceef2a6 ("drm/amd/display: Merge amdgpu_dm_crtc and dm_crtc_state")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--8M6BfoD15ssaWBU3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqET0kACgkQJNaLcl1U
h9CqSQf/cUQPSWEG1xQ83SotvaTR9US+xfOy6ijhZt8D+ohEdOz8uS6e9KPTffaf
TbNBRHD8iPcQ03CK6hrxWDZFwk5jCo27T6cCXrIWjKb5YNBRWmigbfZe4cTZCOty
Pg5ItFcSl0zJoVpeMYFt3Tq1/uRt/ibkjCwBSoWHISBut+7TMeJGySgRB9ki5UC8
KoR4kghWYey1UbevZCjHLDk8jokgOpsoTxEHvXwjSa4B2tj98lHY/tMV6xtinWLV
dOGrRM6WlVt0JRuvxZ7axE0dJwgrGNbdELrDsPLKqBI+u+tYUSJ6+qr3CxBy4+6n
p2nwplF8kqOwekFUMnuazBam+BbLIQ==
=L6mP
-----END PGP SIGNATURE-----

--8M6BfoD15ssaWBU3--
