From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: firmware build failure
Date: Fri, 6 Jun 2008 17:47:23 +1000
Message-ID: <20080606174723.05ae4f28.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__6_Jun_2008_17_47_23_+1000_yHs4vlJ=f+iwTBQV"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37378 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753842AbYFFHr3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 Jun 2008 03:47:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__6_Jun_2008_17_47_23_+1000_yHs4vlJ=f+iwTBQV
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next build (x86_64 allmodconfig) failed like this:

  IHEX2FW firmware/atmsar11.fw
Bad EOF record (type 01) format
make[2]: *** [firmware/atmsar11.fw] Error 1

I reverted the obvious candidate - commit
62836d89ead6bd0502cb56b31ebccae818db157f ("firmware: convert Ambassador
ATM driver to request_firmware()").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__6_Jun_2008_17_47_23_+1000_yHs4vlJ=f+iwTBQV
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhI64sACgkQTgG2atn1QN9MQgCfQPhrf79CN6vP3i0r1nfNtr34
FzEAniBDbRQB+55mT4c6c+/epE6VB5NG
=qcCJ
-----END PGP SIGNATURE-----

--Signature=_Fri__6_Jun_2008_17_47_23_+1000_yHs4vlJ=f+iwTBQV--
