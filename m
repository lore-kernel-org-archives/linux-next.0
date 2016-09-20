From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20160920 build: 2 failures 5 warnings (next-20160920)
Date: Tue, 20 Sep 2016 12:18:48 +0100
Message-ID: <20160920111848.GQ10189@sirena.org.uk>
References: <E1bmIpL-0004P7-Bh@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4T94Hejb80K+e1gX"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:41930 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932165AbcITLTI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Sep 2016 07:19:08 -0400
Content-Disposition: inline
In-Reply-To: <E1bmIpL-0004P7-Bh@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: frank zago <fzago@cray.com>, James Simmons <uja.ornl@gmail.com>, Dmitry Eremin <dmitry.eremin@intel.com>, Oleg Drokin <oleg.drokin@intel.com>, James Simmons <jsimmons@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


--4T94Hejb80K+e1gX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 20, 2016 at 12:03:03PM +0100, Build bot for Mark Brown wrote:

Today's -next fails to build arm and arm64 allmodconfig due to:

> 	arm64-allmodconfig
> 	arm-allmodconfig
> ERROR: "lustre_swab_lov_mds_md" [drivers/staging/lustre/lustre/lov/lov.ko] undefined!
> ERROR: "lustre_swab_lov_mds_md" [drivers/staging/lustre/lustre/llite/lustre.ko] undefined!

due to the series of commits that were added yesterday removing
EXPORT_SYMBOL()s.

--4T94Hejb80K+e1gX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJX4RsXAAoJECTWi3JdVIfQRkQH/0ns8YCQMtC2GsgH+TUZmMkM
1VyF7V5wcXV8uTKZ63L84j2i/pj83mkVzcaukz20408bygU4NebyLaNUfXsb+0+M
bOtn+NrEq+TFLGgk7gG/EXU58Z6C4IDVDZKaKCTefMZgivhBwb48bh2aXPyPqKy3
GQQt9ZQG35j+fIwVAElwr/D+Ga1tq16JEnAQJTT4Xo2vvzbnHcHDSDcIc48g31fH
hkrJzbrS+d9sx7RPX4BAMOMCGvLuTWXTLTcWLtd/radMSgg+MOOt1v6qh0KRWFAZ
q1GT1GijfgPQIp+QPI3VHCF5qiE/vVbniZj1Uu8ofCgdVZxU9xlZpYJ0XYP6vkc=
=FIgh
-----END PGP SIGNATURE-----

--4T94Hejb80K+e1gX--
