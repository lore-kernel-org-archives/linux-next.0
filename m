From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: acpi tree build failure
Date: Sat, 26 Sep 2009 12:15:28 +1000
Message-ID: <20090926121528.dfba135e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__26_Sep_2009_12_15_28_+1000_jnAgu+rGn97WoQ13"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34253 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752809AbZIZCPe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 25 Sep 2009 22:15:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Crane Cai <crane.cai@amd.com>, Bjorn Helgaas <bjorn.helgaas@hp.com>

--Signature=_Sat__26_Sep_2009_12_15_28_+1000_jnAgu+rGn97WoQ13
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Len,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/i2c/busses/i2c-scmi.c: In function 'acpi_smbus_cmi_add':
drivers/i2c/busses/i2c-scmi.c:374: error: implicit declaration of function =
'acpi_device_uid'
drivers/i2c/busses/i2c-scmi.c:374: warning: format '%s' expects type 'char =
*', but argument 5 has type 'int'

Caused by commit 6622d8cee73a26bce958484065c8f0e704911a62 ("ACPI: remove
acpi_device_uid() and related stuff") interacting with commit
dc9854212e0d7318d7133697906d98b78f3088b6 ("i2c: Add driver for SMBus
Control Method Interface") recently added to Linus' tree.

I have used the version of the acpi tree from next-20090925 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__26_Sep_2009_12_15_28_+1000_jnAgu+rGn97WoQ13
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkq9eUEACgkQjjKRsyhoI8w4HACgsB+8oSbofz6a7BCtYrX6mXb3
n7UAoLeCZ958XWwlBhhU4zX1XcbMtUgP
=76UL
-----END PGP SIGNATURE-----

--Signature=_Sat__26_Sep_2009_12_15_28_+1000_jnAgu+rGn97WoQ13--
