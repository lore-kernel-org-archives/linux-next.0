From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: acpi tree build failure
Date: Mon, 2 Feb 2009 13:22:54 +1100
Message-ID: <20090202132254.456b7725.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__2_Feb_2009_13_22_54_+1100_YIpqy70/9R7___BG"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38434 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750715AbZBBCXK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 Feb 2009 21:23:10 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Kay Sievers <kay.sievers@vrfy.org>, Greg KH <greg@kroah.com>

--Signature=_Mon__2_Feb_2009_13_22_54_+1100_YIpqy70/9R7___BG
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Len,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/platform/x86/oqo-wmi.c: In function 'oqo_kine_init':
drivers/platform/x86/oqo-wmi.c:595: error: 'struct device' has no member na=
med 'bus_id'

Caused by commit 03919980ad590ad5c5c181d1bd7d58513ad170bc ("platform/x86:
Add oqo-wmi driver for model 2 OQO backlight and rfkill control")
interacting with commit c44c8304353aa6da82cbf98040c6a9c254e68e1c ("driver
core: get rid of struct device's bus_id string array") from the
driver-core tree.

I have reverted the acpi tree commit above for today.  Please convert its
usage of bus_id to dev_set_name().

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__2_Feb_2009_13_22_54_+1100_YIpqy70/9R7___BG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmGWP4ACgkQjjKRsyhoI8xGDACgiNADzXLEd1fKPQsZ+WGbbkz2
7lUAoLnSX1kOM32Epk6312cAOSDSFWDb
=xtWA
-----END PGP SIGNATURE-----

--Signature=_Mon__2_Feb_2009_13_22_54_+1100_YIpqy70/9R7___BG--
