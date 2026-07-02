Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C613A71AD;
	Thu,  2 Jul 2026 18:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783016801; cv=none; b=sB0eH3H3L9gSm6lezpflL5c+emrNJU6kItkTyD9skTUC75SAbPb7UjICV9kqUSqGh0Lkb9yymcbTIsovRDspL+JiFeq3lCx+dKu7luNwT0jR9ogJoOJqZQAQw/oVS5u+gcCtmLA22Y3u8r8oC/bzITRjWU1fw07m3uoSCARlz/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783016801; c=relaxed/simple;
	bh=XyLQzu0gNQ1kgQHSBRQWzEcRg7kvwC4rRZavsCp04Dc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AqcIkAGJ1iH1CgFAeE94wcOTKFeW2TLoiOvGQ0P54o1EBlvU1l9/L4fgd6CI4YZ6xvR68q1vxcY5jhmv7u+DniWqazFoClKNH40eIxl3h7P2rm30RbkUizvzXbqKZFkrejaDxpq13A3d4b8uhoDx8wfb5p4tJkpDgeNbhsShIgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gQ9yrwc3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gQ9yrwc3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 647EE1F000E9;
	Thu,  2 Jul 2026 18:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783016800;
	bh=7oLh7t+Nm4BUtxTbDXxaPfkRgIpubd5gkSGHylj6s7k=;
	h=Date:From:To:Cc:Subject;
	b=gQ9yrwc3br6eSFZAXc3gsPnFG0wGXtTlovj6JFX3ZcKFihzlOwPSHLmFZXkDXX2gD
	 FNa2NAyQk8oZ1pLGZP+X9Qo2sZap03CtwgVi+O12XKMGidofSKjK1S5uvN0nCG4zKb
	 O3Yvn3f1bd3nsy4FzLCPDJR2Agn78DlqB3acXAMvHKnekhkLBVe3N/uWJ+g449UHY0
	 o7drF7h8sZxs4OwU/xjC29xPNJwFTgsYpSFkAxUurvJ0f+rpIsmdVl2XuJV+MCHGUM
	 y5NkKib/LnsnFVhzeppQjwZyHNXUYi6dad/YCqmfXrA5bYtoNDwuNgdb1qX/wBpoEw
	 dWIKPtZVkdaEQ==
Date: Thu, 2 Jul 2026 19:26:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Kir Chou <note351@hotmail.com>, David Gow <davidgow@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure in final build
Message-ID: <akatWxAOMy_S1G2Y@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F2SQt6OPIMXeVyJg"
Content-Disposition: inline


--F2SQt6OPIMXeVyJg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the kthread tree, today's linux-next build
(powerpc pseries_le_defconfig) failed like this:

ERROR: modpost: module random32_kunit uses symbol prandom_warmup from namespace EXPORTED_FOR_KUNIT_TESTING, but does not import it.
make[3]: *** [/tmp/next/build/scripts/Makefile.modpost:147: Module.symvers] Error 1
make[2]: *** [/tmp/next/build/Makefile:2134: modpost] Error 2
make[1]: *** [/tmp/next/build/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

Caused by commit

  2ee1282ed36ff (lib/random32: convert selftest to KUnit)

This appears to be showing up in this specific PowerPC configuration
because ppc64_defconfig turns on

  CONFIG_KUNIT=m
  CONFIG_KUNIT_ALL_TESTS=m

which is an unusual choice, normally defconfigs don't turn on KUnit and
when KUnit is enabled it is built in.

I have ignored this for today.

--F2SQt6OPIMXeVyJg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpGrVoACgkQJNaLcl1U
h9Dxrwf+PHHy25G2b/QrPvsZKRKxI9aqDuQOprlpbqHf/m1XtyJgumkD11jQnG9b
gKBCYqWisc7r+pEDGky43ytroHGyoA3MwOhbU5HeWcX/gPeR23hhmgMNEhPmPBE3
bbDFFkn0+JJYMwv9XhdbHOiou5KQLr+JP+J/7yYhh3dMB78p8OH8nHyY9Gux9/n5
MOTdDXMG3lxytmHY+K+YaZ58irVhY3TkbJLjuJwC/RD8vwpZMr3j/6h3oSNK4vur
sz2+HhWO5Lcprm8mCJjX1Y3gJr0ewJqV71DwHYbuIq0d1pQ/E94MCwjW2cJhONYX
dN5lFcoulSj0LnmxG1zOpy6E9EpguA==
=jOZJ
-----END PGP SIGNATURE-----

--F2SQt6OPIMXeVyJg--
