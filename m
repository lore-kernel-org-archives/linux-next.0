From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: firmware/bkl-removal merge conflict
Date: Thu, 12 Jun 2008 16:18:03 +1000
Message-ID: <20080612161803.de11eace.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__12_Jun_2008_16_18_03_+1000_WKOhwR4Tnw.0Sxp8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51363 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751323AbYFLGSO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Jun 2008 02:18:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>

--Signature=_Thu__12_Jun_2008_16_18_03_+1000_WKOhwR4Tnw.0Sxp8
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the firmware tree got a trivial conflict in
drivers/char/ip2/ip2main.c between commit
023c37d20b8a85438869f22e962bbf905644883f ("Add a bunch of
cycle_kernel_lock() calls") form the bkl-removal tree and commit
6d28e8abf294260b52efd1ba1d59ced169ba4a7a ("ip2: use request_firmware()")
from the firmware tree.

It was just a case of overlapping additions of includes.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__12_Jun_2008_16_18_03_+1000_WKOhwR4Tnw.0Sxp8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhQv5sACgkQTgG2atn1QN8yugCfe+H5K5zI98xERVKxXH207qAz
RAYAnjUgA+f+iqiHgveaptATk4uXOI/g
=H/L+
-----END PGP SIGNATURE-----

--Signature=_Thu__12_Jun_2008_16_18_03_+1000_WKOhwR4Tnw.0Sxp8--
