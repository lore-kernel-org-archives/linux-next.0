From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the voltage tree
Date: Tue, 10 May 2011 12:44:34 +1000
Message-ID: <20110510124434.b30a7631.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__10_May_2011_12_44_34_+1000_ovD4ArwMd5mT.Xxi"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lrg@slimlogic.co.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Graeme Gregory <gg@slimlogic.co.uk>, Jorge Eduardo Candelaria <jedu@slimlogic.co.uk>
List-Id: linux-next.vger.kernel.org

--Signature=_Tue__10_May_2011_12_44_34_+1000_ovD4ArwMd5mT.Xxi
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Liam,

After merging the voltage tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: "tps65910_gpio_init" [drivers/mfd/tps65910.ko] undefined!
ERROR: "tps65910_irq_init" [drivers/mfd/tps65910.ko] undefined!
ERROR: "irq_modify_status" [drivers/mfd/tps65910-irq.ko] undefined!
ERROR: "irq_set_chip_and_handler_name" [drivers/mfd/tps65910-irq.ko] undefi=
ned!
ERROR: "handle_edge_irq" [drivers/mfd/tps65910-irq.ko] undefined!

I have used the voltage tree from next-20110509 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__10_May_2011_12_44_34_+1000_ovD4ArwMd5mT.Xxi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJNyKaSAAoJEDMEi1NhKgbsG2cH/1yJL5gYXwC7sULLMfSobAuZ
cZ9mpyKDUKOxrHMtDuaS7aT2ejB1xHWFsL37tBbsmT70iZ3PktmDgtLvtnIprGEX
b4bpEKMBnoe7nJ5MArkQEDZf/z63Get61EkZsC7ldq+oKYi2X1sBWBcen7lhFVWa
YYYVuZQeW7cs07B8qkQ3jdYMznc7PSgNh6tjKdCnVOS3Utv05+WzTasS0Ju/TFsY
zvya24jM8a9YpYc1N3vQvgy8ZV6qphd/w5mOJTb5nqWt8CCkSr9iVo9H9kKc/OF/
WuNrbRpMlJx/RGZBbIGSzRL3G9Om47hfuwEV1cwXv5+2pI8xlNInaeDZ2zx6Ve4=
=NLaJ
-----END PGP SIGNATURE-----

--Signature=_Tue__10_May_2011_12_44_34_+1000_ovD4ArwMd5mT.Xxi--
