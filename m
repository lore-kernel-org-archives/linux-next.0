Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB6F34676E;
	Mon, 26 Jan 2026 16:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769445948; cv=none; b=DPZ/hwuPLo/sSaFaLVnVKjzT0ULqVlWjloVI3fYdRDAN/I5YP4jJFLAx7eBkgaE0JA3QpM5y1llZC5QVv9Rbj+Z42ZaAh2qxvtPacLluwflv7sgyi1kGWKHrqhHlexoakIBybhLJHYPIuOfZ5Fg5WMDN1am0AEaW4UKdOvLLP7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769445948; c=relaxed/simple;
	bh=GT26Zpr29H5LRjogQakWTly1eg+89IM78ULh5nY5/48=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kPTM4O8DkAuxF83kXD+KK7g1+TbV8xi0VtFk2Flhor83Pk8aCGBoMXG1e2+xH8ePum+HVAUqmx1kdqCOEKVSij2/OKGQduIAjrD+A8KBD+NYc5ALGxH9OLVoQkoN1fNGkcDR4td0wS1l7CoFnK0vZivQjw6PKBVepoZ1MesFN3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GiH28SNt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GiH28SNt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDFBAC116C6;
	Mon, 26 Jan 2026 16:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769445947;
	bh=GT26Zpr29H5LRjogQakWTly1eg+89IM78ULh5nY5/48=;
	h=Date:From:To:Cc:Subject:From;
	b=GiH28SNto6/BgaZMVq9sSBTYM4i0hB18Gv1aA+AoG1jRFvPjebJJgcFnFUY4aUpgH
	 V5z/dQ4axVHY242/VJglOH4pkZ4PrUKg4OV7pUzTqiExYAqpySJb506ZLa0J0TD6vs
	 2cw5sY3F3Uw5bvF3MeOZjJT/vCkH+p5wkl4SS6Tul2WXotmY23IWAkR53W99Gnk80p
	 HHEm4v4YJct4ACP/LJ0BqKBCNnWXdpls9N3OEiIaCyM78YSldBJ/J6k9lHtIG+0aUT
	 E0aCZOLR9qVLWTsl1G1CBtAp2Q1TmLCqVfTZZYR6rjgQy5SzzJYtD96tqD9nTwpzGM
	 Urlzhe9YnkPFw==
Date: Mon, 26 Jan 2026 16:45:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Romain Gantois <romain.gantois@bootlin.com>
Subject: linux-next: manual merge of the thermal tree with the pm tree
Message-ID: <aXeaN2nPs3EexjXv@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CZVVSG7EsjTRb8Sq"
Content-Disposition: inline


--CZVVSG7EsjTRb8Sq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the thermal tree got a conflict in:

  tools/lib/thermal/libthermal.pc.template

between commit:

  5addf72e4f7ef ("tools: lib: thermal: Correct CFLAGS and LDFLAGS in pkg-co=
nfig template")

=66rom the pm tree and commit:

  965ef09a26f3e ("tools: lib: thermal: Correct CFLAGS and LDFLAGS in pkg-co=
nfig template")

=66rom the thermal tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc tools/lib/thermal/libthermal.pc.template
index b984c5ecd20a9,3b8a24d0a8b8c..0000000000000
--- a/tools/lib/thermal/libthermal.pc.template
+++ b/tools/lib/thermal/libthermal.pc.template

--CZVVSG7EsjTRb8Sq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml3mjYACgkQJNaLcl1U
h9B7mwf9FxPHePpf4NqbFQrIbdNYWy5AGWJXg8B4gLHPn7BGr0QYvzeoMtdDH6lh
TJFGgm3bVi9HtN6B9RuIFPgFU6TVhZFMw6RGzzQT4QyrLg8YRp6mHBsz7gukpZCq
FQWjxXTK2JPdFrsICgD9OWYIScXG3jQTP3yLYgeD/N8YxTS9RbYeCvYhMjQDOess
QCEX49XkxNUtQsh5dlbcv0N/NzOQB/RUvgUl6VHJDakVcwabUzxksXWY1YvT5J1x
9dZIwRr0bKv6KexAUfZv60BiKiOWjuWEYn2+qKEyaVis+qrArdtkjsGXB+rnh+oF
GWjT6SkxD6waiVhzOJEfF+vOLvmuBQ==
=B+9f
-----END PGP SIGNATURE-----

--CZVVSG7EsjTRb8Sq--
