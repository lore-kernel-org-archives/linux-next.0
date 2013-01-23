From: "GMEINER.Christian" <C.GMEINER@bachmann.info>
Subject: AW: [PATCH] leds-ot200: Fix error caused by shifted mask
Date: Wed, 23 Jan 2013 07:53:23 +0000
Message-ID: <7AFBFD79B857054D97821A9BD3FBFA9744D05BD2@ATFKEX06.bachmann.at>
References: <1358928657-15781-1-git-send-email-christian.gmeiner@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.bachmann.info ([213.33.91.3]:36639 "EHLO
	mail.bachmann.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750915Ab3AWIKA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 23 Jan 2013 03:10:00 -0500
In-Reply-To: <1358928657-15781-1-git-send-email-christian.gmeiner@gmail.com>
Content-Language: de-DE
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christian Gmeiner <christian.gmeiner@gmail.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

> -----Urspr=FCngliche Nachricht-----
> Von: Christian Gmeiner [mailto:christian.gmeiner@gmail.com]
> Gesendet: Mittwoch, 23. Januar 2013 09:11
> An: linux-next@vger.kernel.org; akpm@linux-foundation.org;
> rpurdie@rpsys.net; linux-kernel@vger.kernel.org; GMEINER.Christian
> Cc: Christian Gmeiner
> Betreff: [PATCH] leds-ot200: Fix error caused by shifted mask
>=20
> During the development of this driver an in-house register documentat=
ion
> was used. The last weeks some integration tests were done and this pr=
oblem
> was found. It turned out that the released register documentation is =
wrong.
>=20
> The fix is very simple: shift all masks by one.
>=20
> Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>


Acked-by: Christian Gmeiner <c.gmeiner@bachmann.info>
Tested-by: Christian Gmeiner <c.gmeiner@bachmann.info>

> ---
>  drivers/leds/leds-ot200.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/leds/leds-ot200.c b/drivers/leds/leds-ot200.c in=
dex
> ee14662..98cae52 100644
> --- a/drivers/leds/leds-ot200.c
> +++ b/drivers/leds/leds-ot200.c
> @@ -47,37 +47,37 @@ static struct ot200_led leds[] =3D {
>  	{
>  		.name =3D "led_1",
>  		.port =3D 0x49,
> -		.mask =3D BIT(7),
> +		.mask =3D BIT(6),
>  	},
>  	{
>  		.name =3D "led_2",
>  		.port =3D 0x49,
> -		.mask =3D BIT(6),
> +		.mask =3D BIT(5),
>  	},
>  	{
>  		.name =3D "led_3",
>  		.port =3D 0x49,
> -		.mask =3D BIT(5),
> +		.mask =3D BIT(4),
>  	},
>  	{
>  		.name =3D "led_4",
>  		.port =3D 0x49,
> -		.mask =3D BIT(4),
> +		.mask =3D BIT(3),
>  	},
>  	{
>  		.name =3D "led_5",
>  		.port =3D 0x49,
> -		.mask =3D BIT(3),
> +		.mask =3D BIT(2),
>  	},
>  	{
>  		.name =3D "led_6",
>  		.port =3D 0x49,
> -		.mask =3D BIT(2),
> +		.mask =3D BIT(1),
>  	},
>  	{
>  		.name =3D "led_7",
>  		.port =3D 0x49,
> -		.mask =3D BIT(1),
> +		.mask =3D BIT(0),
>  	}
>  };
>=20
> --
> 1.7.12.2.421.g261b511
