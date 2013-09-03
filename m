From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree (arm tree
 related)
Date: Tue, 3 Sep 2013 18:18:24 +1000
Message-ID: <20130903181824.796e74465274b23387d3e715@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__3_Sep_2013_18_18_24_+1000_Vo7TE_.TH=BmtE7/"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:51022 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759429Ab3ICISf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Sep 2013 04:18:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>

--Signature=_Tue__3_Sep_2013_18_18_24_+1000_Vo7TE_.TH=BmtE7/
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the final tree, today's linux-next build (arm defconfig)
failed like this:

arch/arm/kernel/built-in.o: In function `setup_arch':
io.c:(.init.text+0x594): undefined reference to `erratum_a15_798181_init'

Presumably caused by commit 34905a33184a ("ARM: 7804/2: Add check for
Cortex-A15 errata 798181 ECO").  This build does not have CONFIG_SMP set.

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Tue__3_Sep_2013_18_18_24_+1000_Vo7TE_.TH=BmtE7/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBCAAGBQJSJZtUAAoJEECxmPOUX5FEhdEP/A+HRpLywse2dMJwMv+CDt3r
BmUnLYLlTRrso2dJ6Rk63RWc/dZYZOHMmYjHneoFYUjnQol/P+hF8ER1TonntsvX
ZDso+E128XBdN2ZO5HHBl8LI6rdnjOptYHDmDhh7L0Xp9ccN9nTaoQQfY43EYxRz
fQ58hFBy8T1C2TXI45WpoZrQ+ctbBroGqLAlQ37fcexmF01bbGJn4igD/uHkl9Xf
zGIvrWtov1Nm5I10yc7QInS/xHN8u2IQcETN266McWRy0wgsbTpSOluiKDlV2dTz
nFNu+d+K7tUW221rGzvF+1+vpkrt4YuRhUAP8F2e0yT4cQYo+KLkqbj0xZ7dgMur
qy8Kz7juHOIDhaoL5YFxdu+p21A4KuHCWO8bBnk+8rYtlyyZDB6UQGaV9Nx99kzE
od4MgHOX2NnYeby+GZxnVvrm9ZgKO+pcNuHYeXisIKAc3BJZelUlQIubXqOHkRWp
sxksTh/wIgShWBhx56dUOalVc0+vXMKFrn7l6eqs+daHYmv9XJWDhuTpMtwQgjm4
kjKRRzsOl5GMK1Coui7dY+n9eUh26xmx5XrRkUrlrLusLcbQz3m3xROjY0elLPsr
BBmgs6ehSJVPHSXqIX+D/vZU5eHFyizhJNXLyMcwoBG6uTu9c+EogLPVsmVw5uBU
7k3FPSxtz/aUWC4/3Smc
=IIzA
-----END PGP SIGNATURE-----

--Signature=_Tue__3_Sep_2013_18_18_24_+1000_Vo7TE_.TH=BmtE7/--
