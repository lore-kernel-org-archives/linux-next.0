From: Christian Gmeiner <christian.gmeiner@gmail.com>
Subject: Re: [PATCH] leds-ot200: Fix error caused by shifted mask
Date: Fri, 1 Feb 2013 16:08:15 +0100
Message-ID: <CAH9NwWdciqHSkkMSk4CW4XX+d6JSZBnvw52Svu8M4o-PGMQsDA@mail.gmail.com>
References: <1358928657-15781-1-git-send-email-christian.gmeiner@gmail.com> <7AFBFD79B857054D97821A9BD3FBFA9744D05BD2@ATFKEX06.bachmann.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qc0-f178.google.com ([209.85.216.178]:50418 "EHLO
	mail-qc0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753942Ab3BAPOz convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 Feb 2013 10:14:55 -0500
In-Reply-To: <7AFBFD79B857054D97821A9BD3FBFA9744D05BD2@ATFKEX06.bachmann.at>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "GMEINER.Christian" <C.GMEINER@bachmann.info>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

ping
--
Christian Gmeiner, MSc


2013/1/23 GMEINER.Christian <C.GMEINER@bachmann.info>:
>> -----Urspr=C3=BCngliche Nachricht-----
>> Von: Christian Gmeiner [mailto:christian.gmeiner@gmail.com]
>> Gesendet: Mittwoch, 23. Januar 2013 09:11
>> An: linux-next@vger.kernel.org; akpm@linux-foundation.org;
>> rpurdie@rpsys.net; linux-kernel@vger.kernel.org; GMEINER.Christian
>> Cc: Christian Gmeiner
>> Betreff: [PATCH] leds-ot200: Fix error caused by shifted mask
>>
>> During the development of this driver an in-house register documenta=
tion
>> was used. The last weeks some integration tests were done and this p=
roblem
>> was found. It turned out that the released register documentation is=
 wrong.
>>
>> The fix is very simple: shift all masks by one.
>>
>> Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
>
>
> Acked-by: Christian Gmeiner <c.gmeiner@bachmann.info>
> Tested-by: Christian Gmeiner <c.gmeiner@bachmann.info>
>
>> ---
>>  drivers/leds/leds-ot200.c | 14 +++++++-------
>>  1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/leds/leds-ot200.c b/drivers/leds/leds-ot200.c i=
ndex
>> ee14662..98cae52 100644
>> --- a/drivers/leds/leds-ot200.c
>> +++ b/drivers/leds/leds-ot200.c
>> @@ -47,37 +47,37 @@ static struct ot200_led leds[] =3D {
>>       {
>>               .name =3D "led_1",
>>               .port =3D 0x49,
>> -             .mask =3D BIT(7),
>> +             .mask =3D BIT(6),
>>       },
>>       {
>>               .name =3D "led_2",
>>               .port =3D 0x49,
>> -             .mask =3D BIT(6),
>> +             .mask =3D BIT(5),
>>       },
>>       {
>>               .name =3D "led_3",
>>               .port =3D 0x49,
>> -             .mask =3D BIT(5),
>> +             .mask =3D BIT(4),
>>       },
>>       {
>>               .name =3D "led_4",
>>               .port =3D 0x49,
>> -             .mask =3D BIT(4),
>> +             .mask =3D BIT(3),
>>       },
>>       {
>>               .name =3D "led_5",
>>               .port =3D 0x49,
>> -             .mask =3D BIT(3),
>> +             .mask =3D BIT(2),
>>       },
>>       {
>>               .name =3D "led_6",
>>               .port =3D 0x49,
>> -             .mask =3D BIT(2),
>> +             .mask =3D BIT(1),
>>       },
>>       {
>>               .name =3D "led_7",
>>               .port =3D 0x49,
>> -             .mask =3D BIT(1),
>> +             .mask =3D BIT(0),
>>       }
>>  };
>>
>> --
>> 1.7.12.2.421.g261b511
>
