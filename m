From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning
Date: Thu, 16 Oct 2008 17:04:10 +1100
Message-ID: <20081016170410.bf919b38.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__16_Oct_2008_17_04_10_+1100_KJdR8cTym=zpsk5k"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36919 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750992AbYJPGEV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Oct 2008 02:04:21 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Hannes Reinecke <hare@suse.de>, linux-next@vger.kernel.org

--Signature=_Thu__16_Oct_2008_17_04_10_+1100_KJdR8cTym=zpsk5k
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next build gives this warning:

drivers/net/wireless/iwlwifi/iwl3945-base.c: In function 'iwl3945_pci_probe=
':
drivers/net/wireless/iwlwifi/iwl3945-base.c:7871: warning: passing argument=
 1 of 'dev_get_drvdata' from incompatible pointer type

Git blame points at commit 64d3bd686e868597694bb3088bdfe2de362c8358
("Driver core: Use dev_get_drvdata() accessors").  I suspect that the
conversion in iwl3945_pci_probe should not have been done.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__16_Oct_2008_17_04_10_+1100_KJdR8cTym=zpsk5k
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj22VsACgkQjjKRsyhoI8xNtgCeP7oV8H568asLKAFza/5EXj2k
OycAnRNLUVPp0RgzeUPoeSLIRFTtFlRP
=O7pM
-----END PGP SIGNATURE-----

--Signature=_Thu__16_Oct_2008_17_04_10_+1100_KJdR8cTym=zpsk5k--
