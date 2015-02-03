From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the clk tree with the arm-soc tree
Date: Tue, 3 Feb 2015 16:28:19 +1100
Message-ID: <20150203162819.5693d5d1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/9ZA=rDQxryK_gAfDhGlN_U."; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55714 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S966020AbbBCF20 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 3 Feb 2015 00:28:26 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Turquette <mturquette@linaro.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>

--Sig_/9ZA=rDQxryK_gAfDhGlN_U.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mike,

Today's linux-next merge of the clk tree got a conflict in
arch/arm/mach-omap2/io.c between commit c27964b5d2f3 ("ARM: OMAP2+: Fix
ti81xx class type") from the arm-soc tree and commit eded36fe29e1
("ARM: OMAP3: use clock data from TI clock driver for legacy boot")
from the clk tree.

I fixed it up (the former seems to have incorporated the conflicting
part of the latter) and can carry the fix as necessary (no action is
required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/9ZA=rDQxryK_gAfDhGlN_U.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU0Fx4AAoJEMDTa8Ir7ZwV+8AP/1QG4JRPX0nfC2Vyao/ruURW
KQL6Gbm898PmpTizRWol7w6BvHCLtVedd+wwbEdYrURcoiZt7xuEDMiBMIswTUCb
9P996RRbx73HavjZtGjXLQe61M2JmKid4AhOQlf/wFpjvbF038Ids4ZcvPQ9NSPO
kqkaL741GDBMlhBOVh/vaymYYryV3/10pbWsrZHCU1Kjjdg4HsRlGUdfDAJTi0XS
qKYugnPMeaCwoD+YsbrDtRpJcEZeeONxMa7Nv/tzv2A35xUCwzHgywSbf5y4YhYd
EAOrIUPQDjrzxQvkfpuqPsYwDbceOM4CACMuOozxnkbPfK/cEksP7HldgTEB0r0v
pdtVycRNEOh+fb76970ScLnL2Fk9k8d9YzZ0OsdPh7zROWEs8gqWNnlmxUZwxWze
ZgAR7LniH1OMKR+H+04MqKBP0oy4cjWSSJzNLZuM5FZ0QB2xMF0lHJgOjqM2j+R7
y2pL6DgxBY0psOy+cKupf0AKkXv0U6HkrPnrf7ZbYDuyJ/uuBzHjyI03y98wqFBn
sZDUHj9pjexD6TrfmWiqPCaF0Z3Sc/TTK5MEsZLzaOr+7s//v0tAyUdXH3t9a97R
n3ncU77njCRq15EJMXuQ6DzE1afl5ztK7n9WaHDpkcddWXM4Cy1rIc5/Gg9J6Jz5
TTGN02XsjDp1XTnoWSA0
=UOJ8
-----END PGP SIGNATURE-----

--Sig_/9ZA=rDQxryK_gAfDhGlN_U.--
