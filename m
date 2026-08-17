Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8835341CB3F;
	Mon, 17 Aug 2026 12:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786970447; cv=none; b=McOHHs+CWObrb4GUSxbS5igA+/E3Lp90Gf8B5tstClXDbtz+But8GRFfIyV/dBXrOVZNy/WwWJF0EB80mORd6WmwLYzFdpgAxRmSsDa6hfqwEJL+EANmfBoW2NG6GrPkan9Q/S7uF3aGDVOyNO/CdZqo8kQ4sQ1azpHlF5mVqew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786970447; c=relaxed/simple;
	bh=sHaubTnqG6CrhzNROZveQ7LatK3T1NwxEHYATg7oXD4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P7SCpRFa6tD+QGfLxHTs6ugfOfTyzrbgix1n3mBrW6+Q5I9Aw4u4emgWsrHM1IXd5n+SmaYpjcm4Zr85jg3alCFKb6M4vkRIdSxpuvDwxZn4QTrbzUi6Birw2iLy/yFPX9CZC+RB1EvHsD8UrDJnKTX4ZY3Wr+YRMHK7GXNkb78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S2pyLdPu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S2pyLdPu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C0181F000E9;
	Mon, 17 Aug 2026 12:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786970446;
	bh=e8x50SU6WZseNYPls1j4byxxXJhbdDNr+IVfoeyfMas=;
	h=Date:From:To:Cc:Subject;
	b=S2pyLdPuGao3B4M2WBhIJEKdQ323fFO8s+Evaf1x+xqDYgaiRzXdh9bLMP5Pe3eJJ
	 LlXROlvGmRbrY4VmPdSfYBX5DOASIkQHpzqh9CpWFTsvF1l4/5YaQWPpj7dD96cKKf
	 mbA13vXFMr/6BBFExgxKM509hPHq8lRUJKw3aE0bcFHOMv0TdatcEUvYr2w43eFVtM
	 EvXIK9KG38+RmnGUG90HoOfLP20fCA3sqIa/8Pgo9HtRZYptkIj0Sz/Lt5uw8uWVFN
	 J1GEi9GATa/7q2FvE18wFgIYIvaLUW1dc2wSAFnA6qX673AiOCGmyuoaZEzTnf5kA+
	 ValO1vN7TdGnQ==
Date: Mon, 17 Aug 2026 13:40:43 +0100
From: Mark Brown <broonie@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the pm tree
Message-ID: <aoMBS1M5brWvJzRE@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F/8HLbM5TI6l+0SP"
Content-Disposition: inline


--F/8HLbM5TI6l+0SP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  1f371e8f495fb ("thermal/drivers/qcom: Fix missing spmi adc tm5 gen3 file")

Fixes tag

  Fixes: 948ee3a74f35 ("add support for PMIC5 Gen3 ADC thermal monitoring")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--F/8HLbM5TI6l+0SP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqDAUoACgkQJNaLcl1U
h9Ax/gf/WbizF4lHZXAPC6h3sL/o7W9pF1IgrT4dJPHEyQsidhVb6Xhh/6jU90Sg
D8kbwDEXENEdBp55ooQby8PtOxLOD7Ywhf80oLGjKVgYUKrmYXmLhKfUQKw9u6/P
KvqEBTQ7htZpkXbNBZBNfDHOihz68Qro8t1CpvGbxgpD8MbfykG/hBAhiR57V4a1
jplftE9RBgr/uz7ImUVSO0bWiaq0MqBZU3FOjQjeYXOT879CxCrwRAdgV9SEtdMi
ekNdqrfcbcd+6OCAo6nwlj4NQT6v/BFoA00hOQvZLM42s8RmVur8BsWl3c6L02Oj
N+yXIw5Ysm4bzqKFeci2qzbw7Crq8g==
=q0+C
-----END PGP SIGNATURE-----

--F/8HLbM5TI6l+0SP--
