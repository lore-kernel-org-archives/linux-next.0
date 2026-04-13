Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893A0360745;
	Mon, 13 Apr 2026 10:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776076876; cv=none; b=g6uYvWQgpEQ8wNmZXh5h6ks0djD+KsLc8xtPIp0QzMiUifI/tqhAP6EbsekqXccbuSwSmvXELxoLJtmJEM8LMOXGufZRdJEjXEwPtSek4qDyOkOhN/NxfC8QSWL6+LLw7Ts5Bziuf5qsSX/mlGBHZeaAlALeJMGL//V8QPtrRIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776076876; c=relaxed/simple;
	bh=uDmsqn363lB7t12/HLot1J3NJh6Tu3MAjxATgBmtL/g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tztiePw9oFxpBxhjTrKqFI71TihWwznHi5Etm96LsQS4q0UbXzhQFy5IviMp5iVSYjyWMFWrHQWjSRMIv6TeVxulKw8FRmSUBsrQyvGtu+liMEJwXULfMPHcgGASnZExZsoUa2n2l9tfpu8ENghGke5grdt7G7PJlN0zNxVDLcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tz3IwjPS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tz3IwjPS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70165C116C6;
	Mon, 13 Apr 2026 10:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776076876;
	bh=uDmsqn363lB7t12/HLot1J3NJh6Tu3MAjxATgBmtL/g=;
	h=Date:From:To:Cc:Subject:From;
	b=Tz3IwjPSoC7BRr8s2HhMEl/+WapHLvesVIx0kmuCOe8x+rhqNlqtJAjfjqstMDZPS
	 4B+/KEwo2cLsJDtXf5TAuDW2jcZm6umBXtV25IqvAZn8mQwHf1cMw7mQkghoKCBFd6
	 KiOkjGFVwq1SLV5CHvI3sC4FvQt+loB8TeK1D2A/hJrlKAqX8+dJam5ENS1ox+/8IL
	 q9Ci2UXjYvur3+Q/iJhwFM2lI8WAoSWGf+gbuvTfWi5J1/tSpT5fws6gDDvIa3k0st
	 dhIe/KskSyDWVkhCoIhNzLsaYwSjYbwmYP95HTXZti5Aijg1r2v45KwNvw4qFXaaR6
	 pFkKRrG8mE7BA==
Date: Mon, 13 Apr 2026 11:41:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the clk tree
Message-ID: <adzISAzZe9EuM-2U@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z7WvH1WM1DchKRj3"
Content-Disposition: inline


--z7WvH1WM1DchKRj3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  cf6e6ac63c62c ("clk: qcom: rpmh: Add support for Nord rpmh clocks")

is missing a Signed-off-by from its author

--z7WvH1WM1DchKRj3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmncyEcACgkQJNaLcl1U
h9BZuQf+OjBY8ljtMKRq4qpY+MpkWZ/hXVSnhC7BimyOwnfYgT0AyosqgaCMTJxb
IdL6HF1uiQ9+yr3zPbvn5+siY+tdJMxTYV2JRDsso9FTcYDp8TRPePd+CHUXnU13
mNCf8EbzQ+V1a6hbe1Bc4itNAquD89stTl0WqRJad780gwdECPal+mcpf9MaLlfr
1C/lDxLG5HrGXBT4L7T6oWiQZ/OOWNsJmfyQbUN/kn1MjObjqle2r5wZN4TaYCWn
aWDhEmWIOc904087ToT2TlhyOhPAg1wEC7ngO/L0UtQU88WwhjEXYWNd273HFxU/
h13cS7Cfk8HJ85Jxe0E0ScIF+9E55g==
=Y7lM
-----END PGP SIGNATURE-----

--z7WvH1WM1DchKRj3--
