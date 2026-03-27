Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889337260F;
	Fri, 27 Mar 2026 12:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774615003; cv=none; b=Tf35o9kT+iwnmMpBfVshZAZmTopr+9VL/bCcitnSYzqkHcfevJ6TfbaIeLadSYs002CMS4jSENvrYw8BuVX697Ox18TItMxhG23s5u0Cbk+ZJ0NmS4weumrhKlnj9XUIzsf7fz5ncuSg9Ix29PimLtJJIUHRrryjBRlT+JqJjzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774615003; c=relaxed/simple;
	bh=ADn/DtvBjGRBPuYd8UCSMSVJtva3kJQ+w6q6a6JwX3k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ry4QFRBGAmpu5AmJ43YPxvBWyu7SHSVyDdi4gFr5blcjh1qZJO30EA51zw8ja0uGiXX5IZOetheRqSttbX92KdVJU2Y89eO13jOXlbItpD6C3tqX7JByHtgQ4m7joju0MkncdYNj+212X5erLsg6aMWAbdKcnWDSZYx4Dl9bi1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=melUXUFf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="melUXUFf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1298BC19423;
	Fri, 27 Mar 2026 12:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774615003;
	bh=ADn/DtvBjGRBPuYd8UCSMSVJtva3kJQ+w6q6a6JwX3k=;
	h=Date:From:To:Cc:Subject:From;
	b=melUXUFfoK+rDDBylVW+3N9++qO9WHeo2ZdJekWbcCfVNuZPwDuEaocrcIXGsbUUV
	 AqGFwkonh/rDe9Qvq+yEgXEpzL996u9ALZlzDxCzee++MPGaOdsOVA9DeMKlQdIx8f
	 WHOm0FL04gdCY1IgHHvbt9eN2ai6Nxudmzm3+cGKk4kpzOY6ZUgEVzG4d/FJ2IGNt0
	 EwxzZNv/yJkCg6z2cDx9ejeyjVBIbe/b2vzRPF043Ng9O0ejWM5U/zVxgocvk9cnRg
	 RNjhJ+wXZHn/Q5Y7QFhLj+qco25frCR0Pk0LblWVUMXEgXL73NKrcQap3BnFz7FIY2
	 LwO6J3/FKmZNA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id BA2191AC5731; Fri, 27 Mar 2026 12:36:39 +0000 (GMT)
Date: Fri, 27 Mar 2026 12:36:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the sound tree
Message-ID: <acZ51-4zNhu6lyag@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ovGq+eUwB7k+uBAN"
Content-Disposition: inline


--ovGq+eUwB7k+uBAN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  3ebaf5b77ac6ae ("selftests: ALSA: Skip utimer test when CONFIG_SND_UTIMER is not enabled")

is missing a Signed-off-by from its committer

--ovGq+eUwB7k+uBAN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnGedQACgkQJNaLcl1U
h9CX8Qf8DD8UaiTo/+Y++DjpVYzfUZVesujUYGqrUYd6v9mLQT64w6U07QNl/oEe
TwBW7himp9EMyxW6JKCb5rtZNdcVSCVG9k1PGCYWBBbzSBV4pQtyMfMDJSva7fIl
zNMmdjuXrJo/cHZLJlNdgwOufwkWlQzjdl6bm7tMu5YC7nxBqiQcgxcqaq/Bjqzo
pjKdd01PfJlS27UrFNIoZ7yXih6fLkPJrUDMRl3RePU5OQjtlgOKjBrmmzrDSev0
6MMyZHIh+hVIlHhGp+47qi0hO16Sp+NSKxLQO2+vsXVQJWNDcTe0ajOAV53Tq0Bn
7it5WMwkYsmCCV1RGgQ3nQbyFWWljw==
=Yvb7
-----END PGP SIGNATURE-----

--ovGq+eUwB7k+uBAN--
