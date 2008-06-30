From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the firmware tree
Date: Mon, 30 Jun 2008 19:14:27 +1000
Message-ID: <20080630191427.f16ece08.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__30_Jun_2008_19_14_27_+1000_n_47tqN1IQ7dBfz6"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38075 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752685AbYF3JOe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Jun 2008 05:14:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, Chas Williams <chas@cmf.nrl.navy.mil>, "David S. Miller" <davem@davemloft.net>

--Signature=_Mon__30_Jun_2008_19_14_27_+1000_n_47tqN1IQ7dBfz6
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the firmware tree got a conflict in
drivers/atm/Makefile between commit
e92481f95375aa2702ea5018b0295792ae0fa9c1 ("atm: [fore200e] convert to use
request_firmware()") from the net tree and commit
1bf8d922fe44bdec0126f8cc2e3477c8bc044c3f ("firmware: convert Ambassador
ATM driver to request_firmware()") from the firmware tree.

I fixed it up (just overlapping removals).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__30_Jun_2008_19_14_27_+1000_n_47tqN1IQ7dBfz6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhoo/MACgkQjjKRsyhoI8yanwCgndUpIOZMKMPZUUssmobur2s6
lxAAn3HAwzyx7hZy7OUEGs6+Doh2AjSH
=p5qE
-----END PGP SIGNATURE-----

--Signature=_Mon__30_Jun_2008_19_14_27_+1000_n_47tqN1IQ7dBfz6--
