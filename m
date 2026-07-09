Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97456423147;
	Thu,  9 Jul 2026 12:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600507; cv=none; b=UBJZZpL0f3BjHGFoEBC/0Y+ozzLTIq6VAyHxytehzvNVfyNLImcR9m7c7vdhOio1L0MG2KGS7bOdJDpip7/eaYRdDGMOXMO23pto3rJZK5rGUy9bKAmb140My+KJrn1VVdkZLJM3e+jq3jP7raJmDHvWvwFtbtMp+ICF3TpGg+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600507; c=relaxed/simple;
	bh=sDKsUvUIPXAGTBMa5igEjqebu8ajD/Jdgghqy/kgmzU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b5J0XnQmxVzOXhwFyztzsVKR57nR0s5J9pE1pw/rWU6PgloppEM2l1C3GP31Ul2RyXfNJGaOILfDgix4cCjhO795qnBHWpUV2aDzPfpkS2sBQOG8lUhTgXSV6S9wsuXc8xJVVA0ZqqedYP/1p4frxAt7KbohW9It4s9JPoubRgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pe5n3JPW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pe5n3JPW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E6681F00A3A;
	Thu,  9 Jul 2026 12:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783600506;
	bh=fKaMNVIiJ+fcKBPW5gCCemKgW5j/bqj5fL8eoqzY9F8=;
	h=Date:From:To:Cc:Subject;
	b=Pe5n3JPWeNaFRMmXm8FnzP2jAf19HM2bl6q+GeN9JD1ZlGBEgkbHQchPqgu5avQRB
	 FICMZuIS+QQOcU2WTibzhPsmMaVuQIYyzyCYrVW77PFH2BaCLHHCxCSso0t5TtAydu
	 TUiU1f60PS+Iggz1dPPq+6CyDunuvL0SEiKf8h79soy6ptL3pol6BwHUe9l5/9MkXI
	 6sn4enX5yW4Hzxh7cNDGGh4MlBpcpoSTzXwGZ2W49BaB+pndu/4WuYsExFShNtLFPn
	 glOYdraGAuA3DzFnhlbzlTWuYkZS1okmJmioEHLpl2NiY2wyRVJFykXJ7Fba/kMrNZ
	 Lu/gYfbYAf5QA==
Date: Thu, 9 Jul 2026 13:35:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Sumit Gupta <sumitg@nvidia.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Subject: linux-next: manual merge of the drivers-memory tree with the origin
 tree
Message-ID: <ak-VdgGMc6xFyDjw@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZylUbrKH0DCnjSKs"
Content-Disposition: inline


--ZylUbrKH0DCnjSKs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drivers-memory tree got a conflict in:

  drivers/memory/tegra/tegra186-emc.c

between commit:

  995832b2cebe6 ("Replace <linux/mod_devicetable.h> by more specific <linux=
/device-id/*.h> (c files)")

=66rom the origin tree and commit:

  5239692170f18 ("memory: tegra: add multi-socket support to the memory int=
erconnect")

=66rom the drivers-memory tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/memory/tegra/tegra186-emc.c
index 2a4cb64c4c4c5,e25f485e136e3..0000000000000
--- a/drivers/memory/tegra/tegra186-emc.c
+++ b/drivers/memory/tegra/tegra186-emc.c
@@@ -3,9 -3,13 +3,12 @@@
   * Copyright (C) 2019-2025 NVIDIA CORPORATION.  All rights reserved.
   */
 =20
+ #include <linux/cleanup.h>
  #include <linux/clk.h>
  #include <linux/debugfs.h>
+ #include <linux/fs.h>
  #include <linux/module.h>
 -#include <linux/mod_devicetable.h>
+ #include <linux/mutex.h>
  #include <linux/of_platform.h>
  #include <linux/platform_device.h>
 =20

--ZylUbrKH0DCnjSKs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpPlXUACgkQJNaLcl1U
h9Dt3gf8C8eGpt5YbTNy6bXQqO4omca4zQyYHybJzhhBhOiw0md+hQ8CtRwSkQU9
+I4BhiJ7Td28LxgyBayalhR/HbsOJOcJRgwAnta2z5WaUnHtGxo3ze2qnrv1CGaR
6TFEshB6GeL928FWgjUnG0FHF1jjn2lVnRBuYhdt8XziM8In1E4JxJl3NkMk1ujZ
e0yUgGPQ4V+E+k6CApofWgsqtgDUoXt4PANP2Oh5F1K2VPQ1szlKx2L7cizm8MsH
o6TFPazr3ayE7VncLhGooNgC7oUh+zZ5gjJ5ZZgGaYG0Wd0wSLbm3yTyYVf7/NJT
pkkzAZCgk7TOze/i1AUo8fcOohFROw==
=8/e6
-----END PGP SIGNATURE-----

--ZylUbrKH0DCnjSKs--
