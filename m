From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the acpi tree
Date: Tue, 8 Jul 2008 13:03:57 +1000
Message-ID: <20080708130357.74eecea3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__8_Jul_2008_13_03_57_+1000_/AMDN+=e/4cKXhaa"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45636 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755576AbYGHDED (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Jul 2008 23:04:03 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org, David Brownell <dbrownell@users.sourceforge.net>, "Rafael J. Wysocki" <rjw@sisk.pl>, Jesse Barnes <jbarnes@virtuousgeek.org>

--Signature=_Tue__8_Jul_2008_13_03_57_+1000_/AMDN+=e/4cKXhaa
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Len,

Today's linux-next merge of the acpi tree got a trivial conflict in
include/acpi/acpi_bus.h between commit
eb9d0fe40e313c0a74115ef456a2e43a6c8da72f ("PCI ACPI: Rework PCI handling
of wake-up") from the acpi tree and commit
be9c73564e69729cda9ad2b3258eb0375d92a49c ("ACPI PM:
acpi_pm_device_sleep_state() cleanup") from the acpi tree (which is also
in the pci tree).

Its just an addition overlapping an unrelated change.  I can carry the
fixup.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__8_Jul_2008_13_03_57_+1000_/AMDN+=e/4cKXhaa
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhy2R0ACgkQjjKRsyhoI8x/xgCfW33+NB8gP4d+9rz+t/TvJ5sl
/ZAAnRjjo84ibTBLqsRHz6joYKFPEHWs
=89Du
-----END PGP SIGNATURE-----

--Signature=_Tue__8_Jul_2008_13_03_57_+1000_/AMDN+=e/4cKXhaa--
