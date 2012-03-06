From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ARM: pxa: fix build failure for regulator consumer in
 em-x270.c
Date: Tue, 6 Mar 2012 12:16:28 +0000
Message-ID: <20120306121627.GM19635@opensource.wolfsonmicro.com>
References: <1330989122-6323-1-git-send-email-paul.gortmaker@windriver.com>
 <4F55CEDB.90909@compulab.co.il>
 <CAN1soZxdT=N1BtK5Jf4+Qu3GGCHPuKK1BqgfEV-D7QorjnsLpg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4oQnj4jcM03NhqPN"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:52397 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1759177Ab2CFMQa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 6 Mar 2012 07:16:30 -0500
Content-Disposition: inline
In-Reply-To: <CAN1soZxdT=N1BtK5Jf4+Qu3GGCHPuKK1BqgfEV-D7QorjnsLpg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: Igor Grinberg <grinberg@compulab.co.il>, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, Haojian Zhuang <haojian.zhuang@marvell.com>


--4oQnj4jcM03NhqPN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 06, 2012 at 05:12:18PM +0800, Haojian Zhuang wrote:

> Could you pick up this patch since it's depend on latest change on regulator?

There's no direct dependency, there's been no need to use that struct
member for years - should be safe to just apply via the PXA tree.  If
you do want it to go via regulator please resend, I didn't keep a copy
of the patch.

--4oQnj4jcM03NhqPN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPVgAVAAoJEBus8iNuMP3dZWIP/0CGzlHpVJq4vCkCL8XUFihP
+2AF5bYmO6ohkBJ27zTM+2meOBjwLIm8J80kCgY6MXpAPInyld/9RUstYlhBAJbi
wZ415dWNgbdy5KMr242E17foH7f3UqAvTDvPwekvUZarqChXYI/ReeFDz43SOe2f
UiTpXj1g/WF6+rE+Ttfn5qxUqtBGkSSu2dmR+gmHlnHWaM+Gm9stvPt/y0s2Najg
3YtuIszo69n4QM73hjk/MjyIw7vu4zAwZfJrW0UTJb6LCATKymecXmMfAN3M1eAp
R4yVeOiLErJfGd444JRw3CApuQWwW6vnSsE16Ab32R6DcHmuuVfF7cHlW0UbvKyx
fZYzqE6MQh9F7k/5IVSqhtrzYF/1302xfCFAV0sw0sVc1Y4OjL8T1MY6ggtbBrdY
h0VYXaVtc47aXyPAoKPNaSaKF82wmch1jTWn+0VB0W2jArpyMgXsG1onG2crZnTw
j0O43npI0FnhpedvYcA6OwSXhZPrK1kqiP6C8YOdZYKXe6S8bplATGhjH6cT3J5G
ftbJa5ZJQjicOyLj2vu7kvPVugxkn25H/U5FrsYZlGJe+znWrnFC0xCuagZTRwir
+vlM6Vtut7kUADAgNv1LphdZqHU2UwiQ/pTGCxLHA4yLbM7sSXeSqogs7dSh1tp0
if7XxEaR2eV7H+QMYHkT
=cjn2
-----END PGP SIGNATURE-----

--4oQnj4jcM03NhqPN--
