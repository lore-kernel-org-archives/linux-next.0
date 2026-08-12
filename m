Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FD343E48D;
	Wed, 12 Aug 2026 12:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786537228; cv=none; b=m9eEkT8W5oW69DibnG43lgcXfmmPmNekwGgJQYYEeo7zUzYofCajF/4BXXzMZMoTeDnlb7k/qpvZKbV8xNEJ/aUkirT1j1zJw0wXQLcAsivCyGVbk3817G7sA2NDfX/oCohE/Zdb2Dz7xVKRsrZkw3XCVvNsw4L1jnf/syThPDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786537228; c=relaxed/simple;
	bh=36w9BuICedvDr9m99q5T+Phk8HiYkD5ocPCOnWTAJeM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l2pz5Horm+J0hRCryH8mW29b2bD1/t2oqLs+luDEli8CUuRS1HYcFZrFX0CPoi/CuFe8u2dhndCU0ldOo4bPaRX5cZkrfyPisG4hj6bFlLZMJydhmrkf1sZYPu3XAilxA5zCJIsXvHGe2hejbxpQcX6X53ug0L4xtuOL6Ksk4aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aTPhdVUm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aTPhdVUm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 730481F000E9;
	Wed, 12 Aug 2026 12:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786537226;
	bh=zk4AEmk3QoNg2GSD+NVru5ucNbQrH5AbyQH8h0ef0P0=;
	h=Date:From:To:Cc:Subject;
	b=aTPhdVUm5ZSWs6h9Fn6oP410OPQ3ZzNgFNqdIVoXJH07JGmFk7bui/mcjCdGXAVD0
	 H4Fv7dtsIssNIBzpB5KlXQpo7NFRaYD+Zay/0vznyoVbu5JQ484zN7SU9NT5gwny1e
	 MRkcVEbdtaUS9kyA8SAa9hTIqXW5o4+oaKi2u+s28VWzcxNoV7zLuuEi6vH34tiBpJ
	 7UT2i1hl5h9DCcOoqPSR7k/w5MxxoOlIbVXUuznJFpKPXk9/YUwwlATEBEoWhOGvoO
	 wZh526ud4XjIzHLdXrTczHRIlBBt98xguRaVWTO9E+I7P7nSUQS+mpxHiOyVNcLGzO
	 g1dY9KTYvy28A==
Date: Wed, 12 Aug 2026 13:20:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the thermal tree
Message-ID: <anxlB1gpN0gc5Swe@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rtZD0nevD6VVwaKj"
Content-Disposition: inline


--rtZD0nevD6VVwaKj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  ef1000de37fa8 ("thermal/drivers/qcom: Fix missing spmi adc tm5 gen3 file")

Fixes tag

  Fixes: 948ee3a74f35 ("add support for PMIC5 Gen3 ADC thermal monitoring")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--rtZD0nevD6VVwaKj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp8ZQYACgkQJNaLcl1U
h9DFGQf/SRhcyB0Byhaeuvd45qSM7noWvM34XChNW5Nlr9ZW8yw+ORX9YONc3811
HFXCwYVLtOPF+DksbfoZ6gS7leaPWp2tCbNMLG8nUQb3jm0A2cHNUCCKwwwcwOcl
ypnvf25k9VxLl6sxNS3NXCKPaTK/TVYQ0Yo7UGTDraW+O+yTA5U+OTpEs3D7eI5d
Pg5S0XNCI4ez7bfn2TvhNnY0+owR4ytLtzvxmiW9M3weGOnGODjxI1dSDy0/Orlw
c7iXCF1HRHfZY+e59XQODPaZhOZ/k0kAhA57XgqRsy7Gk/sjwzQUDYAiMlt813ex
mFI4dp08k0ZrXIjf135uB/2B4TlvJw==
=3qw2
-----END PGP SIGNATURE-----

--rtZD0nevD6VVwaKj--
