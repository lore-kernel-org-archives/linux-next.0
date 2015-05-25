From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the extcon tree with the battery tree
Date: Mon, 25 May 2015 18:47:41 +1000
Message-ID: <20150525184741.5f9d55c7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/p9NjXvtiWu4pzFDVQxO9WB1"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47479 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750843AbbEYIru (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 May 2015 04:47:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chanwoo Choi <cw00.choi@samsung.com>, Sebastian Reichel <sre@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ramakrishna Pallala <ramakrishna.pallala@intel.com>

--Sig_/p9NjXvtiWu4pzFDVQxO9WB1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Chanwoo,

Today's linux-next merge of the extcon tree got a conflict in
include/linux/mfd/axp20x.h between commit 843735b788a4 ("power:
axp288_charger: axp288 charger driver") from the battery tree and
commit f03123783d4e ("extcon: axp288: Add axp288 extcon driver
support") from the extcon tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc include/linux/mfd/axp20x.h
index 02f97dc568ac,4ed8071d062e..000000000000
--- a/include/linux/mfd/axp20x.h
+++ b/include/linux/mfd/axp20x.h
@@@ -361,11 -275,9 +361,16 @@@ struct axp20x_fg_pdata=20
  	int thermistor_curve[MAX_THERM_CURVE_SIZE][2];
  };
 =20
 +struct axp20x_chrg_pdata {
 +	int max_cc;
 +	int max_cv;
 +	int def_cc;
 +	int def_cv;
 +};
 +
+ struct axp288_extcon_pdata {
+ 	/* GPIO pin control to switch D+/D- lines b/w PMIC and SOC */
+ 	struct gpio_desc *gpio_mux_cntl;
+ };
+=20
  #endif /* __LINUX_MFD_AXP20X_H */

--Sig_/p9NjXvtiWu4pzFDVQxO9WB1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVYuGxAAoJEMDTa8Ir7ZwVbuwQAIr2/wC0gqq6dFjBkdTuPL3t
2HJHpAi1+z4xuOR3o2PAek0J/PnCxqREHI+tQyyEhgQzeBky+L2JMZ+Il1s7L05a
YTKgsSl3xB2dqKvNJ/lmU3jxfUekGYYvv6X/fgyiNriUq58c75nJEWUP3drimtVa
sqRzF0tH/+8wEh/6yP1J+swMzthwJIF9dRToJ12As5av6ArM443xcDdh/B1qgtRO
eJoIwHRjohlyEoFh2orVQx6VCLngdczMcq9aoO0h9offk9jF5/OTHfmJ3w7rIa4z
rhZ8EyC+wuNebGleCA8pk6zu2TtVMmUoanBPkquNWtZlFMSct23P7h2tzVCulEjk
GWxwQmkR/Uq7l3yM5qaYgy6035fG/BjSAxtNI1oKie3d3i8qxbC/RzjhKhGwXKEV
8mTJweMu/OgAfdBoxKQFJpXv8nZT8hB8t8uRcT24poUuymN6xJbiSadFblyLcYJh
iO/CSzgbPj/fwBSD2XQSp+lDE7scralSL4NviXOLuaqkXVwanqMlHUfnLyXYa15q
aIxkyERssGPZuy+BCzPsQfuUIzECrrrF2llJ0hHtHf/Ay8iVMdvzMhuvTela96+I
7llumCRvRUHIw/TAPi5R3HbOpWP0ER0Tk8UUFg6nZxBRnhp9TDFebarudT7o6vs1
kzVP9dHoiF+zlxBknLVn
=QJqU
-----END PGP SIGNATURE-----

--Sig_/p9NjXvtiWu4pzFDVQxO9WB1--
