From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the firmware tree
Date: Tue, 25 Nov 2008 18:21:22 +1100
Message-ID: <20081125182122.076d70e2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__25_Nov_2008_18_21_22_+1100_B/4XZZNt099avjfp"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47294 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750932AbYKYHVi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Nov 2008 02:21:38 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, Matt Carlson <mcarlson@broadcom.com>, "David S. Miller" <davem@davemloft.net>

--Signature=_Tue__25_Nov_2008_18_21_22_+1100_B/4XZZNt099avjfp
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the firmware tree got a conflict in
drivers/net/tg3.c between commit d5fe488a7b59e41b98b91137805159466b7b49c2
("tg3: Embrace pci_ioremap_bar()") from the net tree and commit
aadd3ed38a6745e21dc8d2f388bbba42ead0a085 ("firmware: convert tg3 driver
to request_firmware()") from the firmware tree.

The former removed some code that the latter modified.  I have fixed it
up (by removing the hunk of code) and can carry the fix as
necessary.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__25_Nov_2008_18_21_22_+1100_B/4XZZNt099avjfp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkrp3IACgkQjjKRsyhoI8xZ9QCgni0KoPAoOIbvNT1ZzvPqSWIG
bzIAn1Lm32mnPDNoDaq+UtzSzUqxEGtR
=UOM+
-----END PGP SIGNATURE-----

--Signature=_Tue__25_Nov_2008_18_21_22_+1100_B/4XZZNt099avjfp--
