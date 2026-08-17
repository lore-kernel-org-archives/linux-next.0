Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A85644A3FD;
	Mon, 17 Aug 2026 16:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786983313; cv=none; b=f/LkMz297pPXADRBaExVdVX49hJXgLndCsQofH+KADS83GdVBdxeDV8IesIcHBxiYGJbvz/Y8TtgZ6RyGVqa235KQcN1osesrHRn4rqKAJX4UTzDpxeIOHhjpUGYAindOeUE1Hom3YpOJwsPkX26e04k6r/Fy+ZclXrxqyRPKdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786983313; c=relaxed/simple;
	bh=qW3O/nFCi404tNULBZSwp2BBm72dkYsRMGwfsbZNJWw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l1sCq6F59uGQgK4VZCGlGenKmQKwaL6oTJnMCtX2UjFmVPe9YphV9l6nOUnpKaMK9alxVKc/XaCYmcJGBXGDaxdIs/w9OcLSKwYC7enmFs7W9Hya12Ge/cXGiQbUIgwqK6jDRLq3HDKLekMzSvkaSmRMnunVicyyKalNi0NcWN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iIxUin4J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iIxUin4J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 825721F000E9;
	Mon, 17 Aug 2026 16:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786983311;
	bh=bh4hMtFW3n43VfOyyYkYfU+27930FtHCXuKoJ/Vao4A=;
	h=Date:From:To:Cc:Subject;
	b=iIxUin4Jiu33d26xVmcFEpsqwJ0ltasAxZoeaW3/pJIUNy7MAREtGXbxsGk+jkaxs
	 OAAwFdQseEzAViNUDgi94U1xiKiFH6xsq+/tqcoOfDaq56ncuFCmXOJdl1iCum5ZI6
	 osmcRDl7Fn0SqsPr2oZ/XhhIECK9ePfv/cNSoJBc16UNYSSYp0Z7KuB6+kw3gbm9Z7
	 YhhrhNjs04GkavlAiV6Xg2JocTFcmo4hc+103etPuBFS32lgv2CNcSBGKzaoE84zWD
	 Vvo3oCw/2g0QSovlISgJ0M8PHyFxg+mK8J2oQfZuX9sL/Yn/YIdfunl2ngN9wq7Gnb
	 aPOVup2R0ZMeA==
Date: Mon, 17 Aug 2026 17:15:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Honghui Jiang <jiang_hh2019@163.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the kunit-next tree with the spi tree
Message-ID: <aoMzi1nY87yEXDI4@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d9ynk7SO5azdNgAQ"
Content-Disposition: inline


--d9ynk7SO5azdNgAQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kunit-next tree got a conflict in:

  tools/testing/kunit/configs/all_tests.config

between commit:

  9b81a87c5244b ("spi: Add KUnit coverage for DMA mapping error paths")

=66rom the spi tree and commit:

  34b5c0132952c ("kunit: configs: enable GPIO kunit test cases in all_tests=
=2Econfig")

=66rom the kunit-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc tools/testing/kunit/configs/all_tests.config
index 7bdcbdec2cab0,6825c2e855a55..0000000000000
--- a/tools/testing/kunit/configs/all_tests.config
+++ b/tools/testing/kunit/configs/all_tests.config
@@@ -21,7 -21,7 +21,8 @@@ CONFIG_VFAT_FS=3D
  CONFIG_PCI=3Dy
  CONFIG_USB4=3Dy
  CONFIG_I2C=3Dy
 +CONFIG_SPI=3Dy
+ CONFIG_GPIOLIB=3Dy
 =20
  CONFIG_NET=3Dy
  CONFIG_MCTP=3Dy

--d9ynk7SO5azdNgAQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqDM4sACgkQJNaLcl1U
h9AKJAf/QG7U/qHHCBdN9ldcKOPQLA9JEjHnilTH+Oq+Z4gyVToAqkxJLt+WBqFA
bZy+4qK/F/JRKuH3/59haxU3UjL+PL4D+ESfSvL+KGM2109DqzgfYgEKNxFhQ5Sj
Zmk76FFmf9xU8iNnfPEJ6fsyA8l2EP0tP7gswK6YPTtwV9gPVDuKGQzK0DjJVcIE
JoHX9zSNKUDRU8JZcN6CwUy2QXGbZ1X6SdMzBPm/c4sXFIiJu4Bm2VCPeZxJ4K2k
5jxZthWFgLziTsZFJ+s3AUQzZ/TKPUEIOb2isewCWU24G6gd3ZgwnRakPw6Y60bX
2jIXlPrllsS+hd269EUvrZaa8fL5cw==
=8ioT
-----END PGP SIGNATURE-----

--d9ynk7SO5azdNgAQ--
