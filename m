From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: semaphot-removal merge conflicts
Date: Fri, 16 May 2008 13:19:28 +1000
Message-ID: <20080516131928.b72ade85.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__16_May_2008_13_19_28_+1000_xI=kpQ5UPJT+8H3M"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38935 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753003AbYEPDTr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 15 May 2008 23:19:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matthew Wilcox <matthew@wil.cx>
Cc: linux-next@vger.kernel.org, Josef 'Jeff' Sipek <jeffpc@josefsipek.net>, Matthias Kaehlcke <matthias@kaehlcke.net>, Andrew Vasquez <andrew.vasquez@qlogic.com>, James Bottomley <James.Bottomley@HansenPartnership.com>, Daniel Walker <dwalker@mvista.com>

--Signature=_Fri__16_May_2008_13_19_28_+1000_xI=kpQ5UPJT+8H3M
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Willy,

Today's linux-next merge of the semaphore-removal tree git conflicts in
several files because it appears that the semaphore removals have been
done in upstream and scsi-rc-fixes (which should go to upstream soon)
trees.

So I reverted the following commits from the semaphore-removal tree
*before* remerging it:

3029b0c2f226a05f6866bf27cf7e90fbabe348e9 "Convert qla_os to use mutex inste=
ad of semaphore"
2c77d192c68a95a188dd326db1315b3492487c41 "9p: Convert from semaphore to spi=
nlock"
de99e091066295ab4abc5a1faec823b040db0ac4 "qla2xxx: Turn vport_sem into vpor=
t_mutex"

The conflicting commits (just for completeness):

c1549497e903a1ffa1c5808337a987180e480e7a "9p: use struct mutex instead of s=
truct semaphore"
	(in Linus' tree)
6c2f527cb84cbd7d2d8a668c979e70bf78980ccc "[SCSI] qla2xxx: Convert vport_sem=
 to a mutex"
e1e82b6f0df0c5175ddd3d4f8862507aa71da8e9 "[SCSI] qla2xxx: firmware semaphor=
e to mutex"
	(in the scsi-rc-fixes tree)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__16_May_2008_13_19_28_+1000_xI=kpQ5UPJT+8H3M
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFILP1ETgG2atn1QN8RArM9AJ9wH/GFmJU65cmh2Bh/N2wVkKTFHgCaAliK
EQEi1p4/dyFBJ4GprE6VOsQ=
=sjXf
-----END PGP SIGNATURE-----

--Signature=_Fri__16_May_2008_13_19_28_+1000_xI=kpQ5UPJT+8H3M--
