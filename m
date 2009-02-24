From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: acpi tree build failure
Date: Tue, 24 Feb 2009 15:37:42 +1100
Message-ID: <20090224153742.08562389.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__24_Feb_2009_15_37_42_+1100_ek1xOnxs_Pzgo64d"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39969 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751983AbZBXEh4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Feb 2009 23:37:56 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org, Greg KH <greg@kroah.com>, Kay Sievers <kay.sievers@vrfy.org>, Matthew Garrett <mjg59@srcf.ucam.org>

--Signature=_Tue__24_Feb_2009_15_37_42_+1100_ek1xOnxs_Pzgo64d
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Len,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/acpi/thermal.c: In function 'thermal_notify':
drivers/acpi/thermal.c:768: error: 'struct device' has no member named 'bus=
_id'

Caused by commit b1569e99c795bf83b4ddf41c4f1c42761ab7f75e ("ACPI: move
thermal trip handling to generic thermal layer") interacting with commit
d4a078fca590911cdf87a8eaffee1b6e643c2558 ("driver core: get rid of struct
device's bus_id string array").

I have dropped the acpi tree for today.

--
Cheers,
Stephen Rothwell

--Signature=_Tue__24_Feb_2009_15_37_42_+1100_ek1xOnxs_Pzgo64d
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmjeZYACgkQjjKRsyhoI8yHmQCghu2jAbyp/1+OqMItc69+mFuu
GW4An2Db8XhbVDjOK1eS0DbMyS4TXZm4
=HKpG
-----END PGP SIGNATURE-----

--Signature=_Tue__24_Feb_2009_15_37_42_+1100_ek1xOnxs_Pzgo64d--
