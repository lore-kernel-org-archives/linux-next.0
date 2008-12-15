From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: scsi tree build failure
Date: Tue, 16 Dec 2008 01:37:04 +1100
Message-ID: <20081216013704.2496da40.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__16_Dec_2008_01_37_04_+1100_Q2+kDffss1mqIMAC"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39649 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752427AbYLOOhN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Dec 2008 09:37:13 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: linux-next@vger.kernel.org, Robert Love <robert.w.love@intel.com>

--Signature=_Tue__16_Dec_2008_01_37_04_+1100_Q2+kDffss1mqIMAC
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi James,

Today's linux-next build (powerpc allyesconfig) failed like this:

drivers/scsi/libfc/fc_fcp.c: In function 'fc_eh_host_reset':
drivers/scsi/libfc/fc_fcp.c:1987: error: implicit declaration of function '=
msleep'

That file needs to include <linux/delay.h>.

Introduced by commit 389571f347629d879f9044582bbbafb43e4fe00b ("[SCSI]
libfc: A modular Fibre Channel library") from the scsi tree.  I reverted
that commit and commit 7aba33c5cfc7a9c104cc7469558c7849f373c3da ("[SCSI]
fcoe: Fibre Channel over Ethernet") which depended on it.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__16_Dec_2008_01_37_04_+1100_Q2+kDffss1mqIMAC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklGa5AACgkQjjKRsyhoI8ybOQCgvHAkqc6uR3MVHr/qgRWAGS2D
OL0AoKO0xQsVYG00Lxwtd76S8hdioLk1
=KdY8
-----END PGP SIGNATURE-----

--Signature=_Tue__16_Dec_2008_01_37_04_+1100_Q2+kDffss1mqIMAC--
