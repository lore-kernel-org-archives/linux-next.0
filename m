From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: linux-next: manual merge of the l2-mtd tree with the slave-dma
 tree
Date: Thu, 22 Mar 2012 11:32:33 +0200
Message-ID: <1332408753.18717.1.camel@sauron.fi.intel.com>
References: <20120322140410.2f9af2f25906a3cdc9497d72@canb.auug.org.au>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-dbBx2ff+7S19jSBBtGDx"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:49443 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754867Ab2CVJ3n (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 22 Mar 2012 05:29:43 -0400
In-Reply-To: <20120322140410.2f9af2f25906a3cdc9497d72@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Bounine <alexandre.bounine@idt.com>, Vinod Koul <vinod.koul@intel.com>, Huang Shijie <b32955@freescale.com>


--=-dbBx2ff+7S19jSBBtGDx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-03-22 at 14:04 +1100, Stephen Rothwell wrote:
> Hi Artem,
>=20
> Today's linux-next merge of the l2-mtd tree got a conflict in
> drivers/mtd/nand/gpmi-nand/gpmi-lib.c between commit 16052827d98f
> ("dmaengine/dma_slave: introduce inline wrappers") from the slave-dma
> tree and commit c790d78c631f ("mxs-dma : rewrite the last parameter of
> mxs_dma_prep_slave_sg()") from the l2-mtd tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary.

Looks like Vinod merged a lot of changes recently. Thanks for fixing
this up in linux-next!

--=20
Best Regards,
Artem Bityutskiy

--=-dbBx2ff+7S19jSBBtGDx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPavGxAAoJECmIfjd9wqK0xncP/RLr4rZh9PpHB5fBP9Z+2/4w
Glqk/jOueZWOBjStrIfFV4EF/GD8t8nTZJy2N/gwS3pmBQUSTw5ZpZpfdwQZhuth
JwhQII/Kolz9gXFcM+HeWeuofzGbPxr3ayrsg1kui7QntdRgqLmoxnFD7NEMklYF
k3dUPv2NaCH2WIV6hVbMbr+SZh8w1ogZpAWbIk4Lx7NLGVPUSzv4slhaG/3SRUUG
jscFgXoXN9wcS7xOUAR9oVffgtrhSRM5EJvspm5+gDKoPy+Vmu00WIDCJG7jP2Ry
vsXwIvAw6ISuHZE6fGdg/NBcfzo0+1GhkjadmhBdkbHz5lqZ8Hm3eYvKuMMDi4Ds
vZO+93dGbCA7/ht4ETe1ulDLUy8dccvSmKoWc0VifImDTZx144cNX0C2+5ezua66
+wmwX5VU7dZ1n+E9DPCLE0ogIbJdLbLzosM9qt3sqor7gVvvi9dfo9oka0PNHnY2
7S6tOcvFzLIdHKqyRH++RwfK20yyCxJrgPB4ZRII1CHjMTWNVWR0qfxzBg3oGAp6
Jr+Z6bHhVRTvf1BMuXzXzK93hXe+Dj2AOQkMohvDlcQdyDRCQ6bLgaZ5FwtudTZe
auNMa82tAXYO3Red9GHogFuefuIFuMr0UyyZtNBMwAOgFKYakRNA/dqkc5M8sr7b
ox3kiJ5tn7DiqpRMr3s7
=B4ms
-----END PGP SIGNATURE-----

--=-dbBx2ff+7S19jSBBtGDx--
