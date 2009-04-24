From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: acpi tree build failure
Date: Fri, 24 Apr 2009 14:46:35 +1000
Message-ID: <20090424144635.9fd42a2e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__24_Apr_2009_14_46_35_+1000_0s+ZV2IDsmb48706"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57277 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752043AbZDXEqp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 24 Apr 2009 00:46:45 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>

--Signature=_Fri__24_Apr_2009_14_46_35_+1000_0s+ZV2IDsmb48706
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Len,

Today's linux-next build (i386 defconfig) failed like this:

drivers/built-in.o: In function `acpi_video_bus_put_devices':
video.c:(.text+0x34319): undefined reference to `video_output_unregister'
drivers/built-in.o: In function `acpi_video_bus_add':
video.c:(.text+0x35995): undefined reference to `video_output_register'

Probably caused by commit 4b10fee2ec45eae912c2c81730f4eee82e61a247
("ACPI/i915: build fix").

I reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__24_Apr_2009_14_46_35_+1000_0s+ZV2IDsmb48706
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknxRCsACgkQjjKRsyhoI8xNpQCfTLfjw6vqnaYvAIoECWrkEdnM
wroAnjZrBRccSqX32GwEegwEcH/NESiu
=0T8r
-----END PGP SIGNATURE-----

--Signature=_Fri__24_Apr_2009_14_46_35_+1000_0s+ZV2IDsmb48706--
