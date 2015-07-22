From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20150722 build: 2 failures 75 warnings (next-20150722)
Date: Wed, 22 Jul 2015 19:43:45 +0100
Message-ID: <20150722184345.GB11162@sirena.org.uk>
References: <E1ZHv2t-0004JI-0H@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="e080i1BlFqO+k9+3"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:35090 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752203AbbGVSn5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 22 Jul 2015 14:43:57 -0400
Content-Disposition: inline
In-Reply-To: <E1ZHv2t-0004JI-0H@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joachim Eastwood <manabian@gmail.com>, Olof Johansson <olof@lixom.net>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--e080i1BlFqO+k9+3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 22, 2015 at 03:30:56PM +0100, Build bot for Mark Brown wrote:

Today's linux-next fails to build an ARM allmodconfig due to:

> ERROR: "of_default_bus_match_table" [drivers/memory/pl172.ko] undefined!

17c50b700c3b4 (memory: add ARM PL172 MultiPort Memory Controller
driver).  The symbol of_default_bus_match_table isn't exported by the OF
core code so can't be referenced from modules.

--e080i1BlFqO+k9+3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVr+RgAAoJECTWi3JdVIfQeUcH/RNwRROKUq2MknP6yreTXPMW
KaJOB/Uz0b4MCPe7Fw/bEN7UBOkXx5vlqLBhwOqSPPTZKPHF0v5DFSMlkb8L1hdG
HzWLThuKxqapmpzCCeQ+Agb11wE4e5GBni0EfPeGGcVCbUCrQeRCKOICWkfe7fsA
5ldcqP+3cXLeUTxUHTrSk/8TZHaFeBf81B9Skm1/7XlHlvdcv4WpAqix7poeTlSs
q47TJm4gITHecosfL8bh6TV583fPcpwy1UrGp84CojXcZDyd2pY+O8f+1nJV3+9r
3uPFw6YZgxNH1LdbASRLJ63utshKg7LZjUGkv3ld+XyIOHDtj5NLgHdl9ZN0s94=
=zerf
-----END PGP SIGNATURE-----

--e080i1BlFqO+k9+3--
