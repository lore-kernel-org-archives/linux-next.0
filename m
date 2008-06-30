From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the firmware tree
Date: Mon, 30 Jun 2008 19:09:07 +1000
Message-ID: <20080630190907.004cbb79.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__30_Jun_2008_19_09_07_+1000_N=M4w3qigirjLmVJ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40919 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753790AbYF3JJS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Jun 2008 05:09:18 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, Jaswinder Singh <jaswinder@infradead.org>, Chas Williams <chas@cmf.nrl.navy.mil>, David Miller <davem@davemloft.net>

--Signature=_Mon__30_Jun_2008_19_09_07_+1000_N=M4w3qigirjLmVJ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the firmware tree got a major conflict
between commit e92481f95375aa2702ea5018b0295792ae0fa9c1 ("atm: [fore200e]
convert to use request_firmware()") from the net tree and commit
ef15231d8a30e501b5471ad97a07359e39ceab00 ("fore200e: use request_firmware
()") from the firmware tree.

I reverted the latter from the firmware tree for now.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__30_Jun_2008_19_09_07_+1000_N=M4w3qigirjLmVJ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhoorMACgkQjjKRsyhoI8xOfgCeJtkO0G2ovtQGGVnTCF7609AL
gFEAoJXydFqn+Waj4wRSvER7a+Qk8O/Y
=UpGZ
-----END PGP SIGNATURE-----

--Signature=_Mon__30_Jun_2008_19_09_07_+1000_N=M4w3qigirjLmVJ--
