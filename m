From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of acpi tree
Date: Fri, 13 Jun 2008 14:53:57 +1000
Message-ID: <20080613145357.1ea9f643.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__13_Jun_2008_14_53_57_+1000_A9z4pI9gL6JA_ueI"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42127 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751979AbYFMEyG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 13 Jun 2008 00:54:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>

--Signature=_Fri__13_Jun_2008_14_53_57_+1000_A9z4pI9gL6JA_ueI
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Len, Rafael,

Today's linux-next merge of the acpi tree got a context conflict in
drivers/acpi/sleep/main.c between commit
d8f3de0d2412bb91639cfefc5b3c79dbf3812212 ("Suspend-related patches for
2.6.27") from the pci tree and a couple of commits that are duplicate in
the pci and acpi trees ("ACPI PM: acpi_pm_device_sleep_state() cleanup"
and "ACPI PM: Remove obsolete Toshiba workaround").

I used the version from the pci tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__13_Jun_2008_14_53_57_+1000_A9z4pI9gL6JA_ueI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhR/WUACgkQTgG2atn1QN95DQCeOmvDZ4c/x0UxfsfTsDZvNu+I
VSYAn3qoUNKoJFZ6PwIMu+/3kbZ2KcIO
=iNBx
-----END PGP SIGNATURE-----

--Signature=_Fri__13_Jun_2008_14_53_57_+1000_A9z4pI9gL6JA_ueI--
