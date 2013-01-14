From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm-soc tree with the crypto tree
Date: Mon, 14 Jan 2013 13:49:08 +1100
Message-ID: <20130114134908.094003722be0612c20574338@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Mon__14_Jan_2013_13_49_08_+1100_+3Z/uBlNXKA0fS1Z"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:56009 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751897Ab3ANCtT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 13 Jan 2013 21:49:19 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>, "Mark A. Greer" <mgreer@animalcreek.com>, Herbert Xu <herbert@gondor.apana.org.au>

--Signature=_Mon__14_Jan_2013_13_49_08_+1100_+3Z/uBlNXKA0fS1Z
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm-soc tree got a conflict in
drivers/crypto/omap-sham.c between commit dfd061d5a8f5 ("crypto:
omap-sham - Add code to use dmaengine API") from the crypto tree and
commit a62a6e98c370 ("ARM: OMAP2+: Disable code that currently does not
work with multiplaform") from the arm-soc tree.

I fixed it up (the former removed the include that the latter protected)
and can carry the fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Mon__14_Jan_2013_13_49_08_+1100_+3Z/uBlNXKA0fS1Z
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQ83IkAAoJEECxmPOUX5FE5RUP/iqIEn6pVtLSRJgw0+zCXfaQ
JS67Jc9BpK4OOv9ze51M3cw+e/F+iGFt4nbEbHqXSBZcPQyKpPu1w2SKgF2qzUGW
MhxpocnFSfLNKz5NJM2J6lVGbGd8FUE7WEDTo92OGNbdLGRd35A5uZUIXY4jSi81
siVrQMtEqKEDPJKPBRjaTPVheBO+AudNqobyKRwhY4msK4+48AVI4GEVq7AqIRLp
yzoUkLko8hy1gEpTCifoj88byIlcYDx/ombuJTRhnn8mPAxC+OXMceZM9HZ94axt
LLUL2BNsjMiBX0Bu6mXl36ZClFu8b3VKzBCXIfgfPraHO/P5nRslHoHhd+soCxeV
ZvvRBa4tHBtGJ5H+QpQCMPEUst3tGC4xxH7HXexb0StSc7ppaZ/7hlz2wlQHC6OT
6fnyuztavohTBpwwCoiaMQ5CWHHL/wa8SDlDBBe9zLGp2JyZc/x9xQF+hM2OQ8pM
rqQEdlWQ+/5Q8FeK+y1BE7XNAKXyJXQOpSbT2wlRO/JZIbOlqJBvmwv5s1lWDmYq
xlw+DUAS8JMcw6lAq5Fu7vFiglKLiY+rCfMHXH72oFJ7nkXjvPMjq8l8Ze911RZn
XUQxBvrBLT78irkZXbsw7SzRGF9ay1mqdihZIBluVpTcnEYnn9Qx9lQQJElKolpQ
6g+A1gNPjW8XBQ4oezy1
=qasW
-----END PGP SIGNATURE-----

--Signature=_Mon__14_Jan_2013_13_49_08_+1100_+3Z/uBlNXKA0fS1Z--
