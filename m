From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: Re: linux-next: Tree for Oct 31 (input & leds)
Date: Fri, 1 Nov 2013 02:21:29 +0100
Message-ID: <20131101012129.GW7325@type.youpi.perso.aquilenet.fr>
References: <20131031210027.cb3604b9589e0b7a1599dbd2@canb.auug.org.au>
 <52729BCB.1000700@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from toccata.ens-lyon.org ([140.77.166.68]:40950 "EHLO
	toccata.ens-lyon.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754219Ab3KABVd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 31 Oct 2013 21:21:33 -0400
Content-Disposition: inline
In-Reply-To: <52729BCB.1000700@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, akpm@type.youpi.perso.aquilenet.fr

Randy Dunlap, le Thu 31 Oct 2013 11:04:59 -0700, a =E9crit :
> On 10/31/13 03:00, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > Changes since 20131030:
> >=20
> > The net-next tree gained a conflict against the net tree.
> >=20
> > The devicetree tree gained a conflict against the crypto tree.
> >=20
> > The tty tree gained a build failure so I used the version from
> > next-20131030.
> >=20
> > The arm-soc tree gained conflicts against the devicetree tree.
>=20
>=20
> on i386, when both
> CONFIG_INPUT=3Dm
> CONFIG_INPUT_LEDS=3Dm
>=20
> ERROR: "input_led_disconnect" [drivers/input/input-core.ko] undefined=
!
> ERROR: "input_led_connect" [drivers/input/input-core.ko] undefined!
>=20
>=20
> Full randconfig file is attached.

Ah, right, in that config an export is needed, here is a patch.

Samuel



Export input led symbols for input core module.

Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

--- drivers/input/leds.c.orig	2013-11-01 01:43:38.889584308 +0100
+++ drivers/input/leds.c	2013-11-01 01:44:02.060916781 +0100
@@ -210,6 +210,7 @@
 	input_led_delete(dev);
 	return error;
 }
+EXPORT_SYMBOL_GPL(input_led_connect);
=20
 /* Disconnected input device. Clean it, and deregister now-useless VT =
LEDs
  * and triggers.  */
@@ -241,6 +242,7 @@
 	}
 	mutex_unlock(&vt_led_registered_lock);
 }
+EXPORT_SYMBOL_GPL(input_led_disconnect);
=20
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("User LED support for input layer");
