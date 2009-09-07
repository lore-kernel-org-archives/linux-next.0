From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: async_tx tree build failure
Date: Mon, 7 Sep 2009 13:08:31 +1000
Message-ID: <20090907130831.c0180edd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__7_Sep_2009_13_08_31_+1000_paBU3T4VOmcVUmk4"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54048 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758630AbZIGDIg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 6 Sep 2009 23:08:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Maciej Sosnowski <maciej.sosnowski@intel.com>

--Signature=_Mon__7_Sep_2009_13_08_31_+1000_paBU3T4VOmcVUmk4
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dan,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/dma/ioat/dma_v2.c: In function 'ioat2_enumerate_channels':
drivers/dma/ioat/dma_v2.c:346: error: too few arguments to function 'i7300_=
idle_platform_probe'

Caused by commit feed1bce2e6dc7e3307f122ac95be6741840bee8 ("ioat2,3:
convert to a true ring buffer").

I have used the version of the async_tc tree from next-20090904 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__7_Sep_2009_13_08_31_+1000_paBU3T4VOmcVUmk4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqkeS8ACgkQjjKRsyhoI8xgbwCfReFQ59qazenRoPlYTtyFwCFR
7z4AninUeLnVje/2GhZdaYRHEw0fnHiS
=lfdO
-----END PGP SIGNATURE-----

--Signature=_Mon__7_Sep_2009_13_08_31_+1000_paBU3T4VOmcVUmk4--
