From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the arm tree
Date: Fri, 29 May 2015 11:09:19 +1000
Message-ID: <20150529110919.2276365a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/kWYYfYTiv/=zDiKceYQpp_O"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38491 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755025AbbE2BJZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 28 May 2015 21:09:25 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <linux@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>

--Sig_/kWYYfYTiv/=zDiKceYQpp_O
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Russell,

After merging the arm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/built-in.o: In function `__sp804_clocksource_and_sched_clock_init':
(.init.text+0x1a0e7): undefined reference to `sched_clock_register'

Presumably caused by commit 5261ef2ea836 ("ARM: 8366/1: move Dual-Timer
SP804 driver to drivers/clocksource").

I have used the arm tree from next-20150528 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/kWYYfYTiv/=zDiKceYQpp_O
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVZ7xDAAoJEMDTa8Ir7ZwVyokP/A+ffdwftbOCaA8eiYZehEPc
qm2+CMpZihzpPrxEavUIzv47uU5Q0FlLoEtTAzaGGsn1oOxhQIbxIx1eoaMaYwEv
kSpyNIxBkfgHc/QTxtoUHbg0dH85EsxXqpOL9KplKpb0/XjUMA0oAibnvhYAQG4d
TL+vo5e6LMVZtKpBdK4wZqKU2PpquVNPr1L01VRXouUfhr67p0LI2G4vsppbCTq7
AGMfTWr5pQqTNzkeJiE0vn6Inh45jLXxoYtwPdpLdx+PYOLz3fS+u9zThpZclJME
fCMY7wPAy5Z9NeioZazARAolcYMRIhm1NqdtxfjuRSQWXc01WiQiA4K1gvmaSykU
/+EOu+myBB2JuEAaZkozI0IF+1aJNRbpprT9X10AklSE3wZUPuj8THEE8qPNjX7o
n8wyDSfMeXvMK9L3EcOKQGKtBZ1i6xugJTga61POq22fw247cdsFwk6X2L4ZD1DP
fLWze5KoDK9nOPHaIU/W5ubZZDYngbZ1kOcn0E2PMz/l52HUMRSqb5WodzKfU+7+
BfK+Dm/SK37jkPEXozWzlYC8XH1Gft1U6pxvndk6vIYlkTSRRHg2gEOUzq3nSUIe
BEIy7demok52UMx35EiOMmCPmJPgqbVv+k+WT+pPFVJz6dvWrrB/VFEeO9VHD9xO
QxAkqQ/kr86slQcD7/4W
=GKAZ
-----END PGP SIGNATURE-----

--Sig_/kWYYfYTiv/=zDiKceYQpp_O--
