From: Christian Gmeiner <christian.gmeiner@gmail.com>
Subject: Re: [PATCH] leds-ot200: Fix error caused by shifted mask
Date: Mon, 17 Dec 2012 09:13:08 +0100
Message-ID: <CAH9NwWfcKYexxDw4XVbdvyjkc=oPdsAGP7enusoMseqpM1aTiw@mail.gmail.com>
References: <1354800098-4118-1-git-send-email-christian.gmeiner@gmail.com> <CAH9NwWeTO==SB4XiAuy-2Q3_MSMwn_Tzd_4uw6Fz0HZ=qskVMw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAH9NwWeTO==SB4XiAuy-2Q3_MSMwn_Tzd_4uw6Fz0HZ=qskVMw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Richard Purdie <rpurdie@rpsys.net>, LKML <linux-kernel@vger.kernel.org>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
List-Id: linux-next.vger.kernel.org

2012/12/13 Christian Gmeiner <christian.gmeiner@gmail.com>:
>> During the development of this driver an in-house register
>> documentation was used. The last weeks some integration tests
>> were done and this problem was found. It turned out that
>> the released register documentation is wrong.
>>
>> The fix is very simple: shift all masks by one.
>>
>> Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
>> ---
>>  drivers/leds/leds-ot200.c |   14 +++++++-------
>>  1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/leds/leds-ot200.c b/drivers/leds/leds-ot200.c
>> index c464682..676e729 100644
>> --- a/drivers/leds/leds-ot200.c
>> +++ b/drivers/leds/leds-ot200.c
>> @@ -47,37 +47,37 @@ static struct ot200_led leds[] = {
>>         {
>>                 .name = "led_1",
>>                 .port = 0x49,
>> -               .mask = BIT(7),
>> +               .mask = BIT(6),
>>         },
>>         {
>>                 .name = "led_2",
>>                 .port = 0x49,
>> -               .mask = BIT(6),
>> +               .mask = BIT(5),
>>         },
>>         {
>>                 .name = "led_3",
>>                 .port = 0x49,
>> -               .mask = BIT(5),
>> +               .mask = BIT(4),
>>         },
>>         {
>>                 .name = "led_4",
>>                 .port = 0x49,
>> -               .mask = BIT(4),
>> +               .mask = BIT(3),
>>         },
>>         {
>>                 .name = "led_5",
>>                 .port = 0x49,
>> -               .mask = BIT(3),
>> +               .mask = BIT(2),
>>         },
>>         {
>>                 .name = "led_6",
>>                 .port = 0x49,
>> -               .mask = BIT(2),
>> +               .mask = BIT(1),
>>         },
>>         {
>>                 .name = "led_7",
>>                 .port = 0x49,
>> -               .mask = BIT(1),
>> +               .mask = BIT(0),
>>         }
>>  };
>>
>> --
>> 1.7.10.4
>>
>
> Is something missing to get this patch merged?
> --
> Christian Gmeiner, MSc


ping
--
Christian Gmeiner, MSc
