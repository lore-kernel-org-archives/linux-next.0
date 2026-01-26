Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88DC3375A6;
	Mon, 26 Jan 2026 16:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769445715; cv=none; b=aInBmhqs73inkWlqwHXpXlJFu3P6zJjG7/Hxq7r8IgzwOhcTg/vX1SWYBsO9KL+XPUcc/X1ollO2sViwEUVpeing5mhCi/vGYOZ0TDoV5dRGrzLgkO4+xMXKrDntDKYYFo+hpWlJQYrAH6zO+dALEp+Og9KBY3Oi08a4TG4Ufb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769445715; c=relaxed/simple;
	bh=fd2EhuaIQolD9fN48YZldF8d6n2I8GC+FGQKQwylFuM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KHJsiEgBVn3ajEnkAJ6qDbP3S3ylZEm7H2lGlwYTeM4BNQVdtW0Ay0fi2aAH6ldvPlrViZWzXvWxlzRY43iSl66ZmyGk7FuSl4zU1T7vyxf7oRUsgdUE6ooMqap/NleEsN51iBswtRd/LNcGOrpcwDyNGZAbjtZDKdiIeXSFMuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i2MU4Fu5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i2MU4Fu5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26179C116C6;
	Mon, 26 Jan 2026 16:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769445715;
	bh=fd2EhuaIQolD9fN48YZldF8d6n2I8GC+FGQKQwylFuM=;
	h=Date:From:To:Cc:Subject:From;
	b=i2MU4Fu5hi6mE50545RqxG96I4IFq3LjnR2tjsJBahp3mWmgGyQsehDy2DgnG9lnS
	 7wpuiatVO04sidkYdlXlqp9bOrkQJSEpoPdrWuTj2jhFAe7puvMK2VYdZssHWIA9AQ
	 4xaE33JZDQEtsoiJ82kjLfC06sWv0i+WxBfxUwxiImnS11ybjdLCLz3E2KTXmoV0o1
	 bYkwH1jqAn5ehemVci3OUfi4D65xGWZQpiilrDPP6AedZDJHzuGKoZ0LoydlDxioNN
	 l/vZhxJidRKinDETngQ0hZIqrMytebyPEftDKWQS+C7PEU6JPzH1M5O/vhcjSHWhWE
	 noEqE9Uk9xOUQ==
Date: Mon, 26 Jan 2026 16:41:51 +0000
From: Mark <broonie@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Guillaume Tucker <gtucker@gtucker.io>,
	Jani Nikula <jani.nikula@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: linux-next: manual merge of the jc_docs tree with the kbuild tree
Message-ID: <aXeZT4VGXCf3a6CF@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X40wF7pY6yuhnbn1"
Content-Disposition: inline


--X40wF7pY6yuhnbn1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the jc_docs tree got a conflict in:

  Documentation/dev-tools/index.rst

between commit:

  6eac13c876805 ("Documentation: dev-tools: add container.rst page")

=66rom the kbuild tree and commit:

  a592a36e49372 ("Documentation: use a source-read extension for the index =
link boilerplate")

=66rom the jc_docs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc Documentation/dev-tools/index.rst
index 527a0e4cf2ed8,4fc9d15f91d09..0000000000000
--- a/Documentation/dev-tools/index.rst
+++ b/Documentation/dev-tools/index.rst
@@@ -38,12 -38,3 +38,4 @@@ Documentation/process/debugging/index.r
     gpio-sloppy-logic-analyzer
     autofdo
     propeller
 +   container
-=20
-=20
- .. only::  subproject and html
-=20
-    Indices
-    =3D=3D=3D=3D=3D=3D=3D
-=20
-    * :ref:`genindex`

--X40wF7pY6yuhnbn1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml3mU4ACgkQJNaLcl1U
h9DZSgf/elMF+/T+mrIQs5O7t35bUuXVJcXjNv3LSCWCeYms07KuspHruXBwNaUW
fuSkyqkZHJWqbaLqCn0kixQdon7gL0B065e0rdUxl7/yw9+RWG2xhNPTJcKSGpxP
Q4vsqbfKHDdpfAnXDD2Wzw7PDKWM1LBeDFJPiH3LCKbLfVs0QRRkPZaOwSCZNPo6
YW/zPkQcgTwb/9b8jgFdJqIyIRGznJOGyfh/+ld7Y87u6uH86jrfeoCxMJxcu9Kn
uzsvt+G0xNh+IHc+nNtbZj26uDjQ0Z9HPYSStQrf80ssch7nNrAraPf3Zi2XZabH
cOZW8fQ/w4R37BYioUAP/oq3dA7EKA==
=wt8Y
-----END PGP SIGNATURE-----

--X40wF7pY6yuhnbn1--
