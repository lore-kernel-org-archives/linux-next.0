Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5217C2FDC30;
	Mon, 26 Jan 2026 22:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769464997; cv=none; b=O8Tu1iFOZsBFo225mQQUAYMxIFYZex1iEJj/jA4il4nkICjj+8ACu/GBZTliwn3+V0PCup1HGXDfSej1OTrWEzK2uLlqqOIYSTdDCF5vkgB4K8umV2k4uqDMIjK0LRG4z3vLD2v8xpYjaaj3DGqchWL+FHvntToAkqVgkD4pdn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769464997; c=relaxed/simple;
	bh=YtDhm9GdeQG+3p465ZfEq6dQtIHZfLQsLnKWE5Rgi+A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BulcwkUAYCHO+b7p5b6Gsc+YB8uDBEwgywLBOSsxbr0fujAfVWhIbpZ2wzAkYH2HwNuAlChmQsf6StDXf3RdKlDzFOZV+GxLmtARDJ+IEIvTSSlrqvCyR6eN8W0ZkkLyknPnyc4Diu29xp9pNYMCZUkdSDAyjaTPRBQmHnJwpOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gykwWKt/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gykwWKt/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 092D2C19422;
	Mon, 26 Jan 2026 22:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769464996;
	bh=YtDhm9GdeQG+3p465ZfEq6dQtIHZfLQsLnKWE5Rgi+A=;
	h=Date:From:To:Cc:Subject:From;
	b=gykwWKt/oRVaHLhmEkwdEW66wfj8oIwnSbvnaV7rdtyHf5mlAX4QCDG7Lg8hRxoX7
	 1VKTtL66LKn8Oc4NaW4kcxdqkhyMwSOcWR7AdEOv+H5uOBD6fgEY+943GmAJtrOnNu
	 BTPaudvUlrSWPvM1/2dcxG3rXxWHJiqr74mnz5WmO7bAN2E/T3O5Z+xUW7lyciQazA
	 Xw1VuvOOgMOB9HOrt73GT/W+Rfooomnp1oqm/VOORGZzvaaBudsYwwvAU5jp8jOLx7
	 YEmWj2zE9Vhk4s4wKzI3XQky9SURgNqqFs+ZjKnJ+NLjLyV03GpSiDRXCD2qgjA5zU
	 v5x0jsI4oKw9A==
Date: Mon, 26 Jan 2026 22:03:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: linux-next: manual merge of the driver-core tree with the jc_docs
 tree
Message-ID: <aXfkoKZ01qTrAlDJ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Lo4s0J3LILnj5WKR"
Content-Disposition: inline


--Lo4s0J3LILnj5WKR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the driver-core tree got a conflict in:

  Documentation/driver-api/driver-model/index.rst

between commit:

  a592a36e49372 ("Documentation: use a source-read extension for the index =
link boilerplate")

=66rom the jc_docs tree and commit:

  62eb557580eb2 ("revocable: Revocable resource management")

=66rom the driver-core tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc Documentation/driver-api/driver-model/index.rst
index abeb4b36636b6,8e1ee21185dfb..0000000000000
--- a/Documentation/driver-api/driver-model/index.rst
+++ b/Documentation/driver-api/driver-model/index.rst
@@@ -14,3 -14,11 +14,4 @@@ Driver Mode
     overview
     platform
     porting
+    revocable
 -
 -.. only::  subproject and html
 -
 -   Indices
 -   =3D=3D=3D=3D=3D=3D=3D
 -
 -   * :ref:`genindex`

--Lo4s0J3LILnj5WKR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml35J8ACgkQJNaLcl1U
h9CRlwf/SdmNzhQAAkRljlss9p6hqWBroFVc9QAaCQguGPWPcbR50+sRNUkjsE6D
EOmOj8i8yqOsDUDESYg+DMTBaTwIHJVA3x7tg5KxYlVkBlVBiGEuzJi2poOq55LB
jy1RLR3lSMAvtWfMWHbOoNu+8xFtpYXNJQCBqxW4SCEBJNvM0CAXLXsphHvpdTg3
xtLP6wrkpcdNLMyMPKMuu1Omdb7KFmgGd/79MVW/EDe9EWFICg9RKSDsf+EG99VB
hMPUskxnDneOGPH92zpTT2ozK6cxSNnuv/9cyM+YW5X2pmP8ZVnLXNP0O9m4gWVf
S49DWU7W4g4v4vVxXadWxMT8pXIqnQ==
=v2hH
-----END PGP SIGNATURE-----

--Lo4s0J3LILnj5WKR--
