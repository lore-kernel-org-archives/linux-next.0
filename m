From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Oct 31 (input & leds)
Date: Thu, 31 Oct 2013 19:02:49 -0700
Message-ID: <52730BC9.4040309@infradead.org>
References: <20131031210027.cb3604b9589e0b7a1599dbd2@canb.auug.org.au> <52729BCB.1000700@infradead.org> <20131101012129.GW7325@type.youpi.perso.aquilenet.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:56453 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753949Ab3KACDN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 31 Oct 2013 22:03:13 -0400
In-Reply-To: <20131101012129.GW7325@type.youpi.perso.aquilenet.fr>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, akpm@toccata.ens-lyon.org

On 10/31/13 18:21, Samuel Thibault wrote:
> Randy Dunlap, le Thu 31 Oct 2013 11:04:59 -0700, a =E9crit :
>> On 10/31/13 03:00, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20131030:
>>>
>>> The net-next tree gained a conflict against the net tree.
>>>
>>> The devicetree tree gained a conflict against the crypto tree.
>>>
>>> The tty tree gained a build failure so I used the version from
>>> next-20131030.
>>>
>>> The arm-soc tree gained conflicts against the devicetree tree.
>>
>>
>> on i386, when both
>> CONFIG_INPUT=3Dm
>> CONFIG_INPUT_LEDS=3Dm
>>
>> ERROR: "input_led_disconnect" [drivers/input/input-core.ko] undefine=
d!
>> ERROR: "input_led_connect" [drivers/input/input-core.ko] undefined!
>>
>>
>> Full randconfig file is attached.
>=20
> Ah, right, in that config an export is needed, here is a patch.
>=20
> Samuel
>=20
>=20
>=20
> Export input led symbols for input core module.
>=20
> Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

>=20
> --- drivers/input/leds.c.orig	2013-11-01 01:43:38.889584308 +0100
> +++ drivers/input/leds.c	2013-11-01 01:44:02.060916781 +0100
> @@ -210,6 +210,7 @@
>  	input_led_delete(dev);
>  	return error;
>  }
> +EXPORT_SYMBOL_GPL(input_led_connect);
> =20
>  /* Disconnected input device. Clean it, and deregister now-useless V=
T LEDs
>   * and triggers.  */
> @@ -241,6 +242,7 @@
>  	}
>  	mutex_unlock(&vt_led_registered_lock);
>  }
> +EXPORT_SYMBOL_GPL(input_led_disconnect);
> =20
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("User LED support for input layer");
> --


--=20
~Randy
