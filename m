From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the acpi tree
Date: Tue, 8 Jul 2008 12:59:26 +1000
Message-ID: <20080708125926.5bf64056.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__8_Jul_2008_12_59_26_+1000_kz.H13DDxQhljju2"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48896 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755984AbYGHC7c (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Jul 2008 22:59:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Jesse Barnes <jbarnes@virtuousgeek.org>

--Signature=_Tue__8_Jul_2008_12_59_26_+1000_kz.H13DDxQhljju2
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Len,

Today's linux-next merge of the acpi tree got conflicts in
drivers/pci/pci.c and drivers/pci/pci.h between commit
961d9120fa6f078492a1c762dd91f2c097e56c83 ("PCI: Introduce
platform_pci_power_manageable function") from the pci tree and commit
d40f76ca5c165c9ff1490bbbdb34c520d7155c1f ("PCI ACPI: Drop the second
argument of platform_pci_choose_state") from the acpi tree (which is also
in the pci tree).

The former removes the code that the latter modifies.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__8_Jul_2008_12_59_26_+1000_kz.H13DDxQhljju2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhy2A4ACgkQjjKRsyhoI8wbXwCfVD0v/53sHZ+1Z6wXc5iTUrEf
7I4AoKuyNc4eLU4+R5GTPmgzhAhlUTzK
=CsL9
-----END PGP SIGNATURE-----

--Signature=_Tue__8_Jul_2008_12_59_26_+1000_kz.H13DDxQhljju2--
