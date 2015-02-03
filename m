From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the clk tree with the arm-soc tree
Date: Tue, 3 Feb 2015 16:31:40 +1100
Message-ID: <20150203163140.3edfe607@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/y8x1EsziUO=Vs3LsBS5UpqJ"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54060 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S966020AbbBCFbr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 3 Feb 2015 00:31:47 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Turquette <mturquette@linaro.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, Tony Lindgren <tony@atomide.com>

--Sig_/y8x1EsziUO=Vs3LsBS5UpqJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mike,

Today's linux-next merge of the clk tree got a conflict in
arch/arm/mach-omap2/cclock3xxx_data.c between commit ca662ee7b8a8
("ARM: OMAP2+: Remove unused ti81xx platform init code") from the
arm-soc tree and commit d6540b193719 ("ARM: OMAP3: remove legacy clock
data") from the clk tree.

I fixed it up (the latter removed the file, so I did that) and can
carry the fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/y8x1EsziUO=Vs3LsBS5UpqJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU0F1BAAoJEMDTa8Ir7ZwVwUsQAI+Mp/WQycBCtuJXUjSN71mY
HIeUD6AeFoctEawQpDCiRbZhW5jtMgSehEOUFTa0tcxLQ35NnFAimWyxwM0gTD0O
6SqrHtjSU5GWEMr3wlAFgb2nbVgabPjYxo88NWsyN4/HQBsIMclgWSPdlTqUkmJC
59DHrJzgJpNBekSV7iEnz4RgtEb5ssYj273w1GhmQzzLbym+7PGg5Az1FtYoUocv
NOOSHl4A+BGfhol6B6gSwLTY1iKq650zEAqUcN3QuEPynkbUi0ZMvMJU3OVW8YVe
ReTkjpCW0UAgFlib0o1LfixefHCwBIAKkolWp6nh8GlM4XV2l2c03Am0n9f6ZM/P
9XIAXKXbQsVkeB46tOt17/aKn93ENR5Flkarb9/3ODEt6iQO1FbBtSxhjcy0VeBC
En0jBwVn4oR1GOPRtIJlVaKCzvhtJoRUZimH1GVjzCz01N7UYMDuQiTf42i8k9T8
BKBD/EZ4mvJASZR2FzfnQWRZFPekMXlNhkHtVYCpsdPQT1+++WgkLWVKYosBMfDf
MGJsA8G0GQ5qfi5tF8yuahRM138Et8LshD9o0KZM1WclFvgctbOARn5xmThpSbyB
kSUIKeGbm/wXhquxHdS45LjV4AxUxGydrBIE21Rz/e1f30AIuA30i6nSDvcLEnPg
AsSkZzgQWl3Qo+WLPS6Z
=3Awh
-----END PGP SIGNATURE-----

--Sig_/y8x1EsziUO=Vs3LsBS5UpqJ--
