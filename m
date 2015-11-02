From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: linux-next: manual merge of the pinctrl tree with the at91 tree
Date: Mon, 2 Nov 2015 10:06:54 +0100
Message-ID: <563727AE.5060408@atmel.com>
References: <20151102011619.0ff847db@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from eusmtp01.atmel.com ([212.144.249.243]:10276 "EHLO
	eusmtp01.atmel.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751677AbbKBJGs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 Nov 2015 04:06:48 -0500
In-Reply-To: <20151102011619.0ff847db@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ludovic Desroches <ludovic.desroches@atmel.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>

Le 01/11/2015 15:16, Stephen Rothwell a =E9crit :
> Hi Linus,
>=20
> Today's linux-next merge of the pinctrl tree got a conflict in:
>=20
>   arch/arm/boot/dts/sama5d2.dtsi
>=20
> between commit:
>=20
>   512fc048e4fd ("ARM: at91/dt: sama5d2: add missing devices")
>=20
> from the at91 tree and commit:
>=20
>   f6c804b08ca5 ("ARM: at91/dt: sama5d2: add pio controller node")
>=20
> from the pinctrl tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary (no acti=
on
> is required).

Hi Stephen,

The fix is good: thanks. (We tend to sort DT nodes by address which
would have given the pinctrl node before the tdes one but that not a bi=
g
deal: we still can correct this later with a trivial patch).

Bye,
--=20
Nicolas Ferre
