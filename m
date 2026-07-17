Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888762C08D0;
	Fri, 17 Jul 2026 13:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784295057; cv=none; b=dcgo3sR5hyD94VumzDhE7OplIb/ry2gDkkPgJn2LEFz4prGYmItpvMnI4lHI54GTQ2TQz2wO7BgDxZJY576BCTipZsTnvq7z/rwXIg6OWEQbRzVRUc+g7iMTchEF+q8WVxxp3Uh9cx7d9NXnXlDel/FLeFn2alZYkaqc2Kel/G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784295057; c=relaxed/simple;
	bh=ptb7Xmmjm4tYfGiQHCFmeYdoV8AJL8h0v7n486OmqdI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NYGScSZ2q1o3Y3ZxFtrOQdWcOgEx8q9KbjiJtUGb+0HBWYnooosHZ5yfqUf1fjI1qKUBKgifq1AaiZyeLQyKt99+dz7IaoEJOuSl0ueAbxlnILWAgSUweAuD+7ChjjbFnsCyCHwU7AXk35XyPHLrCvbp+aupYLbVAUVaOtGQuaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KaR5ppDu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KaR5ppDu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CF2C1F000E9;
	Fri, 17 Jul 2026 13:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784295056;
	bh=b/mEbV4bwigBSsSasRbp230JrjPGKzHhlylR4xqQbSY=;
	h=Date:From:To:Cc:Subject;
	b=KaR5ppDuHtQA7ZDsdqtLT6qIYhpBem7t4xuSghoY0+4ChfrUAyudy52lB4FaW/G8S
	 SPFNy61rFMOtfEnpEo747mzJWzn2l7yLM0CH5L6hZwZGFNXzarOEa4ozAARRwGlM8v
	 /o9FS2JfElQwCYKCqbo0R+zWaiCakmm/uBAEqaaDWMx6A0ztmLgIjdpHG5J9F7QLVX
	 LUjhak7YjYCuQf5ln4O0rXdksZeKG8V7swQ3e43g7O29KnB9uInuSXJBjdfdWXoC/B
	 hBdDZ6cAr0TfBu/DZrt0tUjJ9cvEL/wMy5lwCh2M7MZeGNho4gZrZCLshxL8ZqadfN
	 IcW2zP3nJvSTQ==
Date: Fri, 17 Jul 2026 14:30:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the drm-msm tree
Message-ID: <aloujPZ0m1fUbxia@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="unO7reyFc1XfoeKY"
Content-Disposition: inline


--unO7reyFc1XfoeKY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  6cd33b6f4155e ("drm/msm/dsi: round 6G byte clock rate to the PLL-achievable value")

Fixes tag

  Fixes: 6b16f05aa39f ("drm/msm/dsi: Split clk rate setting and enable")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--unO7reyFc1XfoeKY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpaLowACgkQJNaLcl1U
h9Cxfgf/SWdrw6czqjnaB3+8ZllibbgxfstgCNz2BzSXyuqT/azm/ZVs0xM1dQNg
pzz+tSZ5UnQgKgNgTkf3lS6q40jIMuKgie8XKumhyT4vmst+0nM1VW2yo2uofDoI
w79zZoIVVRjiHH0qqre3DaayrZL0YARpl0ZRc9JrQlF3UbypivY3pslYaCOE1TVB
YCMt2/Fre5PUOvGcK+bi4HHTIGrnyiPPFV7iA71H97B/c69ZxpP1WJurQDoP4MBj
kV3+Hp9CB2kgp9BF5jrSaof81JQy+8f/omOqH+6u3zijj9Hvli0ToMt8HqLuZu95
wWcg6td2mbFenTArMc2ofpJDmkxApA==
=qF7R
-----END PGP SIGNATURE-----

--unO7reyFc1XfoeKY--
