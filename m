From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the pinctrl tree
Date: Mon, 9 Dec 2013 15:18:49 +1100
Message-ID: <20131209151849.d36d6374e622f44b821ec3d8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Mon__9_Dec_2013_15_18_49_+1100_5L225CdilyEPuJAu"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:60186 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760357Ab3LIESz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 8 Dec 2013 23:18:55 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>

--Signature=_Mon__9_Dec_2013_15_18_49_+1100_5L225CdilyEPuJAu
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

After merging the pinctrl tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/pinctrl/pinctrl-msm.c:103:21: error: 'pinconf_generic_dt_node_to_ma=
p_group' undeclared here (not in a function)
  .dt_node_to_map  =3D pinconf_generic_dt_node_to_map_group,
                     ^
drivers/pinctrl/pinctrl-msm.c: In function 'msm_gpio_init':
drivers/pinctrl/pinctrl-msm.c:905:6: error: 'struct gpio_chip' has no membe=
r named 'of_node'
  chip->of_node =3D pctrl->dev->of_node;
      ^

Probably caused by commit f365be092572 ("pinctrl: Add Qualcomm TLMM
driver").

I have used the pinctrl tree from next-20131206 for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Mon__9_Dec_2013_15_18_49_+1100_5L225CdilyEPuJAu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJSpUStAAoJEMDTa8Ir7ZwV8ksQAJdV4hGZrRC8qaG48iWSDg9r
VBif0XhscZVat4F4nm1B6ilKHGGb/6m9Tr3mDrisG8ARBTBY8NQjxfwVgb/bGmtF
ev4fypl5TQfuOVfujjrPFOxj5rVVP9KrDwjRROTxgeAgBe9Z5wRaO4JjzGCsE4sB
BcGevlYBKthej8zYiQeylQC7jN1WN+yHSHkx785em6r1CpvjeW5e4FUlcOrconlK
kc/JTEXIIM6RKQBFz7nTDe3qTj1vhChH8oc6pQ+MlEMpnBM3XsoG5kPoHfYkAcRm
5l4Jq90iAdCWBZ78PI8f0aZpVxC2k22dIcteQAfR7nhaZRm8Y0Myp5CYWkOfd5z6
B8D5eJmuLykLEtEGPXklsvYn8Lx6rZiT5/1JtDPbvGKCwbCQoDT/V/llST/paKGA
rX7MPKzzrqdvansNL9NNfQYLb84sJ5penUsSuzAE0wyqDeqUeqKfOWdrBuyuycsh
2D9YO//wbnEHPErsT7AMrZi+/EWuX0AmQwqj0VX+yW6xcdAOoJ3kf8fqbtuyLWLW
CVlhNBJH2JMMpzEjZ6NWZrOtUh2QXtnR9qVizCldeOXwHr4aQ0/hJYzma6sIFBBM
36v/yXlibEOKmbMNHgqQhiD4Ha/wEW9T8rmWhfRcB/V7t/bRxUQZ0fa+LeTMBqvO
QfdIXs7KueIhJMHMDsGp
=Y7qe
-----END PGP SIGNATURE-----

--Signature=_Mon__9_Dec_2013_15_18_49_+1100_5L225CdilyEPuJAu--
