From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: scsi tree build warnings
Date: Mon, 7 Sep 2009 13:00:24 +1000
Message-ID: <20090907130024.d67c032d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__7_Sep_2009_13_00_24_+1000_=CTRovQU6tJUWo/C"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53780 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753111AbZIGDAe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 6 Sep 2009 23:00:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Love <robert.w.love@intel.com>

--Signature=_Mon__7_Sep_2009_13_00_24_+1000_=CTRovQU6tJUWo/C
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi James,

Today's linux-next build (x86_64 allmodconfig) produced these warnings:

usr/include/scsi/fc/fc_els.h:165: found __[us]{8,16,32,64} type without #in=
clude <linux/types.h>
usr/include/scsi/fc/fc_fs.h:32: found __[us]{8,16,32,64} type without #incl=
ude <linux/types.h>
usr/include/scsi/fc/fc_gs.h:29: found __[us]{8,16,32,64} type without #incl=
ude <linux/types.h>
usr/include/scsi/fc/fc_ns.h:71: found __[us]{8,16,32,64} type without #incl=
ude <linux/types.h>

Introduced by commit 171bb4f9f6a20d405a3cb5111ce92ad83aae2302 ("[SCSI]
libfc: Export FC headers").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__7_Sep_2009_13_00_24_+1000_=CTRovQU6tJUWo/C
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqkd0gACgkQjjKRsyhoI8xdTQCgmn5p2bILNPvJHq+/hdByqcdh
VYkAni1niZBynwgNcM/CMV46s4yHmn0/
=YuWS
-----END PGP SIGNATURE-----

--Signature=_Mon__7_Sep_2009_13_00_24_+1000_=CTRovQU6tJUWo/C--
