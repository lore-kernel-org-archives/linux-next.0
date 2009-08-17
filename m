From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sfi tree with the acpi tree
Date: Mon, 17 Aug 2009 18:06:10 +1000
Message-ID: <20090817180610.0de34cab.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__17_Aug_2009_18_06_10_+1000_orMxWP_nFfo6rrx6"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42868 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757268AbZHQIGQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 17 Aug 2009 04:06:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfi-devel@simplefirmware.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Len Brown <len.brown@intel.com>

--Signature=_Mon__17_Aug_2009_18_06_10_+1000_orMxWP_nFfo6rrx6
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sfi tree got a conflict in
drivers/acpi/tables.c between commit
44043a4299724bb386ac7915a57a18b176e9df07 ("ACPI: check acpi_disabled in
acpi_table_parse()") from the acpi tree and commit
55ec50ee899aa3199c126bb4b740abb9a4ab51df ("ACPI: check acpi_disabled in
acpi_table_parse() and acpi_table_parse_entries()") from the sfi tree.

I used the sfi tree version.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__17_Aug_2009_18_06_10_+1000_orMxWP_nFfo6rrx6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqJD3IACgkQjjKRsyhoI8ylcgCgqXMnR740dNXds3nLSwQP4IYQ
kAoAniGAQjUOTijQmAZrXIuta4iLlo8a
=j2QE
-----END PGP SIGNATURE-----

--Signature=_Mon__17_Aug_2009_18_06_10_+1000_orMxWP_nFfo6rrx6--
