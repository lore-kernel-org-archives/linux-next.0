From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: m68k build failure
Date: Thu, 28 Aug 2008 16:50:04 +1000
Message-ID: <20080828165004.4d833de6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__28_Aug_2008_16_50_04_+1000_aomiHyNPJD5jskqf"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35201 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752286AbYH1GuN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 28 Aug 2008 02:50:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-next@vger.kernel.org, Yinghai Lu <yhlu.kernel@gmail.com>, Ingo Molnar <mingo@elte.hu>

--Signature=_Thu__28_Aug_2008_16_50_04_+1000_aomiHyNPJD5jskqf
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

The m68k allmodconfig build of linux-next (next-20080827) failed like
this:

ERROR: "nr_irqs" [drivers/serial/serial_core.ko] undefined!
ERROR: "nr_irqs" [drivers/serial/8250.ko] undefined!
ERROR: "nr_irqs" [drivers/net/hamradio/baycom_ser_fdx.ko] undefined!

Introduced by the sparseirq tree.

nr_irqs is not exported for m68k.  I will add a patch to add the export to
linux-next today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__28_Aug_2008_16_50_04_+1000_aomiHyNPJD5jskqf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAki2SpwACgkQjjKRsyhoI8y1MgCePaFvYpSsmu6Ut+2Ho2IWiSMx
T04An2nCBkpUtVelt/tE7xvqH639GzkD
=NUKL
-----END PGP SIGNATURE-----

--Signature=_Thu__28_Aug_2008_16_50_04_+1000_aomiHyNPJD5jskqf--
