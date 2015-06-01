From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm-soc tree with Linus' tree
Date: Mon, 1 Jun 2015 10:25:11 +1000
Message-ID: <20150601102511.316f0262@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1UrHG+E90Tu7YDsa3suFJ_0"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48495 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751642AbbFAAZR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 31 May 2015 20:25:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nathan Sullivan <nathan.sullivan@ni.com>, Michal Simek <michal.simek@xilinx.com>

--Sig_/1UrHG+E90Tu7YDsa3suFJ_0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm-soc tree got a conflict in
arch/arm/boot/dts/zynq-7000.dtsi between commit 9eeb5161397a ("ARM:
zynq: DT: Use the zynq binding with macb") from Linus' tree and commit
4481b18b7cf0 ("ARM: zynq: DT: Use the zynq binding with macb") from the
arm-soc tree.

I fixed it up (it looks like that latter is a newer version of the
former, so I used it) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/1UrHG+E90Tu7YDsa3suFJ_0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVa6ZrAAoJEMDTa8Ir7ZwVKNQP/3PeCCM3NQoXdFkHZwvwxnSv
ZMeXo+4jnJZmZA91HX+qhlW9K4UccYgKR8JBMOMM/jw55ztQSfpPjqT4KQM5X14y
+Tbp0iNlOwgDZDm69DyUQw43p2LljPLIIc2LauWWHEJf0lDyAV6n1DX7ngwvGZJC
+AGlnS8+rCHiNT6oK0Q02vx2YC6pSHK6glCNZrUO5OLSqlVl2dOCtVJQf/H0TPBQ
eyWzTpMFFnpAY1FxdaJRAIsaXtjAZm3sIuq5lbWeS1RerMomSif0FZjy5lZd8vOw
PYOcznaWbIdT7LXzvr9jeYblXWlNkUjHNveLWuBL5NiMSbD+PXn2PE2x7Vq+4fT8
qidSmoM6CjGuG7hnRJLuyzTkwpH8C/OkjIg4X5hs/NrPpqrlTPPRZmSq+pfETJ2X
xHuGk6Gutew36zQtO9W4TTSPDVg4BpZsnkkUng8KpGLB6Quh7Whb/NmeCmrvo2mz
rPm2Vwtzkg771Iply4siDFd0Ih3BDzhnCmBPkBL/uSaKon7uwKNDaVJcUBTgeIbD
3kh3I6JkkCREcrkSn8gXNrtGzMYk0isLyf8I4tL9YUZrr4kfkKPluVbxoDfa5Hv+
QX58dPkaIy4jwkfBK/1HNbW1Cv94J8IK6v/DzkX6FBcJi1EojUP/Gh+W7wj9GJwD
PM85Q/RJhvLUfJN2XtzI
=R4pu
-----END PGP SIGNATURE-----

--Sig_/1UrHG+E90Tu7YDsa3suFJ_0--
