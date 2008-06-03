From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: upstream/rr merge conflict
Date: Tue, 3 Jun 2008 14:16:15 +1000
Message-ID: <20080603141615.b5b34ff5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__3_Jun_2008_14_16_15_+1000_kgHnGIdm4pH.Nn3W"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46563 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750860AbYFCEQY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 3 Jun 2008 00:16:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Christian Borntraeger <borntraeger@de.ibm.com>

--Signature=_Tue__3_Jun_2008_14_16_15_+1000_kgHnGIdm4pH.Nn3W
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next merge of the rr tree got conflicts in
drivers/char/hw_random/Kconfig and drivers/char/hw_random/virtio-rng.c
between commit f7f510ec195781c857ab76366a3e1c59e1caae42 ("virtio: An
entropy device, as suggested by hpa.") from Linus' tree and commit
15336e56adc531fba3cf52123464e2b22b85c1cc ("virtio:entropy-device") from
the rr tree.  I used the versions in Linus' tree and I assume that the
latter patch needs removing from the rr tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__3_Jun_2008_14_16_15_+1000_kgHnGIdm4pH.Nn3W
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIRMWTTgG2atn1QN8RAgmYAJ9eTumZ7o9niKLdJWeV5kcw0NVe3ACeJWes
1a97O8sp/zGMCgcyLobpX2U=
=OEK0
-----END PGP SIGNATURE-----

--Signature=_Tue__3_Jun_2008_14_16_15_+1000_kgHnGIdm4pH.Nn3W--
