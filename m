From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the jdelvare-hwmon tree with Linus'
 tree
Date: Wed, 23 Sep 2009 11:42:57 +1000
Message-ID: <20090923114257.e6e101cf.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__23_Sep_2009_11_42_57_+1000_sMsBsdFOHSm=.uqM"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45325 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753563AbZIWBm7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 22 Sep 2009 21:42:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jean Delvare <khali@linux-fr.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rudolf Marek <r.marek@assembler.cz>, Michael Riepe <michael.riepe@googlemail.com>, Andrew Morton <akpm@linux-foundation.org>

--Signature=_Wed__23_Sep_2009_11_42_57_+1000_sMsBsdFOHSm=.uqM
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jean,

Today's linux-next merge of the jdelvare-hwmon tree got a conflict in
drivers/hwmon/coretemp.c between commit
0bf41d9f414a5cf558aff234a0ff486257537574 ("drivers/hwmon/coretemp.c:
enable the Intel Atom") from Linus' tree and commit
af663ff4d88e09c4e45661251e3c1eeff147ffc1 ("hwmon: (coretemp) Add support
for Atom CPUs") from the jdelvare-hwmon tree.

I used the version from the jdelvare-hwmon for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__23_Sep_2009_11_42_57_+1000_sMsBsdFOHSm=.uqM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkq5fSEACgkQjjKRsyhoI8yiXwCglPk0FAslayPp6fOaYL3Ih/rL
HHQAnAnURWC2pE3JPHzSSaAhTLHlMx3E
=6jUk
-----END PGP SIGNATURE-----

--Signature=_Wed__23_Sep_2009_11_42_57_+1000_sMsBsdFOHSm=.uqM--
