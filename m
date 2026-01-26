Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFD93446C8;
	Mon, 26 Jan 2026 16:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769445704; cv=none; b=oCm68UWHF1M5U+eURwy6p6tfAnjS94sGZKdZQyOKJZCXTb81wxbUFuwrUwbnvhYuF3eXXu8cx6bc+IGYSacmmWG4+A3mSWfwOnPm2vSQB6DVcNFKRK9ngKniXz93V0wZqGaorIqP8KWHeFzUn2/odXA5sbZwe2M26WkyYI5aoCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769445704; c=relaxed/simple;
	bh=9os1/9VL4i6srmXQflSFe3sOQzc73/L+WBkKavM6CiI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ieOAo4z/197moYUssXB2g8UFIw+TzEqqvvOdui2a7NvWRoUfXKTgMJZheLPYnrSw1hEjjPqkDe+3iUF0ojfVqYd4gPmkR1rPM42SkErwvJcLV8Gc/rMvRxKVE2JAuHytYWZ3hwo4scQV7SLTGj2pEa/O4ewF1cQWLeCLEty0tV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eKisdULy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eKisdULy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98D1AC2BCB0;
	Mon, 26 Jan 2026 16:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769445704;
	bh=9os1/9VL4i6srmXQflSFe3sOQzc73/L+WBkKavM6CiI=;
	h=Date:From:To:Cc:Subject:From;
	b=eKisdULypygUZlZaj3FEgIoh5XVyBOu9rUmGsLbg7iuavAAYwvk9Q7VatD1ND/jZr
	 pgvGmtYv91p5eOLf9SbVfZybinM2vaoVe+oE9+iefoNdRd002DMt3PWPliSoHkv2qT
	 /fV96Tm91GrLjdeWfhzgr0hWQvj3Q+FaUDFoflhAAU6LxHm0lyfMlYTIUFrCjGp/MT
	 QezszE0Pa43nNSdI3qdLho1Lxjum+3msNaXj5bNzNP3LJb76fHBzfEy3505tHd+VTe
	 KSijIm96V5+nU1QnpY8g3PomvMSHvsMcv5OHR+EhsRuGMhewxNNorySVfxYH8vgc2W
	 f9nggUVfP6EnQ==
Date: Mon, 26 Jan 2026 16:41:39 +0000
From: Mark <broonie@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mike Rapoport <rppt@kernel.org>
Subject: linux-next: manual merge of the jc_docs tree with the mm-nomm-stable
 tree
Message-ID: <aXeZQy24nAzwEKF3@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VXigG6u5s6cIcQCA"
Content-Disposition: inline


--VXigG6u5s6cIcQCA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the jc_docs tree got a conflict in:

  Documentation/core-api/kho/index.rst

between commit:

  35c554410d81c ("kho: docs: combine concepts and FDT documentation")

=66rom the mm-nomm-stable tree and commit:

  a592a36e49372 ("Documentation: use a source-read extension for the index =
link boilerplate")

=66rom the jc_docs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc Documentation/core-api/kho/index.rst
index dcc6a36cc134c,51ea41c6a20d5..0000000000000
--- a/Documentation/core-api/kho/index.rst
+++ b/Documentation/core-api/kho/index.rst

--VXigG6u5s6cIcQCA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml3mUMACgkQJNaLcl1U
h9AqrQf+NcIVKvmLApRBNpWQEa27pxq0pausZXvusYigIaSxLNJ8P5AOJIjP40Xu
wSc2MulO1CT3/N1l7TTo1dJyQ2T3GKfbnlCv5Tt4Gjdi1M4fSjpPVMiW/kh1mWeP
gpKd7VMA7gE2vVnP8/vtVGWEaC8qGW5PSgfI7afQ9lHAPStUxZ+MFhOr3DGUJjid
tCRHzm2xtLQmPjlXqbgPU4HGCes8agmhuKyIkbrTYF3arviy8uQn0SUlZuwFG+Oe
/KUv5id2sWrnp635ZSmDTPQyrUVpK5Mr4zHqq3mlFMHm/6s+Wto6fLqQ4jokwzhy
WJk7gfgt/aX+avbqkxZhsNH1Mi5GEA==
=hBO5
-----END PGP SIGNATURE-----

--VXigG6u5s6cIcQCA--
