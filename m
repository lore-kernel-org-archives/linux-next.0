From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the acpi tree
Date: Tue, 8 Jul 2008 18:18:17 +1000
Message-ID: <20080708181817.c50a1b12.sfr@canb.auug.org.au>
References: <20080708130357.74eecea3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__8_Jul_2008_18_18_17_+1000_10EkJ5K_3BNJ/WV_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59934 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752524AbYGHISZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Jul 2008 04:18:25 -0400
In-Reply-To: <20080708130357.74eecea3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org, David Brownell <dbrownell@users.sourceforge.net>, "Rafael J. Wysocki" <rjw@sisk.pl>, Jesse Barnes <jbarnes@virtuousgeek.org>

--Signature=_Tue__8_Jul_2008_18_18_17_+1000_10EkJ5K_3BNJ/WV_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Len,

On Tue, 8 Jul 2008 13:03:57 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the acpi tree got a trivial conflict in
> include/acpi/acpi_bus.h between commit
> eb9d0fe40e313c0a74115ef456a2e43a6c8da72f ("PCI ACPI: Rework PCI handling
> of wake-up") from the acpi tree and commit
                        ^^^^
pci

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__8_Jul_2008_18_18_17_+1000_10EkJ5K_3BNJ/WV_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEUEARECAAYFAkhzIskACgkQjjKRsyhoI8w0WwCgsEhIcQYaDm/0JR/nQUn4tGwW
wbQAl0OEDdtv/HUo+Ax3IKMM4oVjnZY=
=Vd4F
-----END PGP SIGNATURE-----

--Signature=_Tue__8_Jul_2008_18_18_17_+1000_10EkJ5K_3BNJ/WV_--
