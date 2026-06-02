Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35701349CDE;
	Tue,  2 Jun 2026 16:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780418067; cv=none; b=JrNPe7E9CQXOXBvNyTY1DjxbtOnbPobnLp74acKlIMCbOp7tBZSICsGX4imJuxW3B8IUgCyJWCfggATbVAuvfMaBbdP4pnweCq0e33oPx4wVKR5hYr+GmJH7TKUfceVhz+nfEfalMvLKqdGvRZ4qDBCBDa+lCdF3ZVPCrXswH3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780418067; c=relaxed/simple;
	bh=aEsRKkGFeBbnxyegk+dCCjIffPOcQMHsEUwemb/fY6U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OARV8FixtOyZGzCvifwJ7KUjpfDJGZHf6V9ru7IFaGAFvAsAloK8R4rmidPWxHtnY/9eAbWnsh38Wg65Lo6nP3xouY5MtnQ6hzfY6s+qEz4+/Dk1t1PHvN1eGkA7d9zytUH8v7/Akrnqx4+GT74ZYgXMiiGBBvNil/667Xiejew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XEhh0PoD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XEhh0PoD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EFEB1F00893;
	Tue,  2 Jun 2026 16:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780418065;
	bh=Ja5v+axfS+uGYzJHbPiGPR/lmJ3BhQRKDweF1G/HmnM=;
	h=Date:From:To:Cc:Subject;
	b=XEhh0PoDhE94F3yJ6PRq5HPUDzTDwRFxs9Z194htELYfDp7XeJ+abBoz4X1tK5pS/
	 v8nw6IIFWIg3kgKYu4NrKLLbTPnoj6Pexw3vIJ8G3gIbB8Ifge+klOtV+nwOwDm4YW
	 u82MdW0tzHppQhQ142dCG/cXim9sNEevpZzD3o5i1sDtxXOck+J/1AWO4TjQ2mtj/+
	 G0ePFYUkZZqzhc6nBPSF19MjNnVyCeh09GJEmzNvruxA2Lz2Ur8+kGuiB4xpeDkce/
	 LrC/Gejxdea/w/nCcJ3DU0PMPA47GJugK7NidirrN2eZOb03a8Ed9IghMHwONxfEyu
	 z2UVRTWJK+TSQ==
Date: Tue, 2 Jun 2026 17:34:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Dan Williams <dan.j.williams@intel.com>,
	Dave Jiang <dave.jiang@intel.com>
Cc: Alison Schofield <alison.schofield@intel.com>,
	Ira Weiny <ira.weiny@intel.com>, Ira Weiny <iweiny@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the cxl tree with the nvdimm tree
Message-ID: <ah8GDU5JoXYr1J0x@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wzqq66vtO96LxUyt"
Content-Disposition: inline


--wzqq66vtO96LxUyt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the cxl tree got a conflict in:

  MAINTAINERS

between commit:

  a6e0072cfa82f ("MAINTAINERS: Update address for Ira Weiny")

=66rom the nvdimm tree and commit:

  43ad501987391 ("MAINTAINERS: Add CXL reviewer")

=66rom the cxl tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc MAINTAINERS
index ff2abbdaed574,158dc82dd3076..0000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -6505,8 -6431,9 +6505,9 @@@ M:	Jonathan Cameron <jic23@kernel.org
  M:	Dave Jiang <dave.jiang@intel.com>
  M:	Alison Schofield <alison.schofield@intel.com>
  M:	Vishal Verma <vishal.l.verma@intel.com>
 -M:	Ira Weiny <ira.weiny@intel.com>
  M:	Dan Williams <djbw@kernel.org>
 +R:	Ira Weiny <iweiny@kernel.org>
+ R:	Li Ming <ming.li@zohomail.com>
  L:	linux-cxl@vger.kernel.org
  S:	Maintained
  F:	Documentation/driver-api/cxl

--wzqq66vtO96LxUyt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmofBgwACgkQJNaLcl1U
h9Byugf+K81iD40EaVpdFURT3gjSYUrFliytnpHqbb+2b6jFKXsGliMvDwPvZky/
45E92ZPXPN8C0Qi1xFpfD4Ih3jH/TB0DdE6XnbOuAzst43NariaUlxZiBCNeCzNt
um4sUTJlY7JfuOH/Uw/GJ6d52eMDkSwz+N/R55HHEU5ob3g8cbAYz/ubuekq510p
CS+II69EUy4hTxGUtX8VenEqGxjGJXhbytmVOgVGT5rHpkyxfSp/qCBtyrQctHqo
8Kt3pli1nAy7mWKb9JCYA7p+Xa+iuS/HVIU1VNgeJBaQhyzSw7Du507Uh2q1QcBO
TyvfaBchYwGGWdnzIf5yK2n4lliNYw==
=QpXD
-----END PGP SIGNATURE-----

--wzqq66vtO96LxUyt--
