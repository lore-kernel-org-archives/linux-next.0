From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] Fix build without CONFIG_INPUT_LEDS [Was: mmotm 2013-10-29-16-22
 uploaded (input)]
Date: Wed, 30 Oct 2013 11:12:08 -0700
Message-ID: <52714BF8.5040008@infradead.org>
References: <20131029232351.D2E6F31C173@corp2gmr1-1.hot.corp.google.com> <52706790.9090602@infradead.org> <20131030114624.GY5442@type.youpi.perso.aquilenet.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:51015 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750882Ab3J3SMK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 30 Oct 2013 14:12:10 -0400
In-Reply-To: <20131030114624.GY5442@type.youpi.perso.aquilenet.fr>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org

On 10/30/13 04:46, Samuel Thibault wrote:
> Randy Dunlap, le Tue 29 Oct 2013 18:57:36 -0700, a =E9crit :
>> arc_ps2.c:(.text+0x500): multiple definition of `input_led_connect'
>=20
> D'oh.  I indeed hadn't tested the inlines, sorry about this.
>=20
> Andrew, could you add the following patch on top of
> input-route-kbd-leds-through-the-generic-leds-layer.patch
> or perhaps rather fold into it?
>=20
> Samuel
>=20
>=20
>=20
> Really mark inlines as static inlines, so they are not defined multip=
le
> times.
>=20
> Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

>=20
> --- include/linux/input.h.orig	2013-10-30 12:42:41.169038670 +0100
> +++ include/linux/input.h	2013-10-30 12:42:42.908987157 +0100
> @@ -540,12 +540,12 @@
> =20
>  #else
> =20
> -int input_led_connect(struct input_dev *dev)
> +static inline int input_led_connect(struct input_dev *dev)
>  {
>  	return 0;
>  }
> =20
> -void input_led_disconnect(struct input_dev *dev)
> +static inline void input_led_disconnect(struct input_dev *dev)
>  {
>  }
> =20
> --


--=20
~Randy
