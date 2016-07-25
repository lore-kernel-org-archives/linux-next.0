From: Doug Anderson <dianders@chromium.org>
Subject: Re: linux-next: manual merge of the pwm tree with the regulator tree
Date: Mon, 25 Jul 2016 06:29:00 -0700
Message-ID: <CAD=FV=Ufs+NBgSmMeJNUwGUnJZOC1Tvpt6PvSCQLAkxxLULhUA@mail.gmail.com>
References: <20160711165648.029cb6f7@canb.auug.org.au> <CAD=FV=UBidDK2XN=uchV=Rr9LtYQ7m6Y6uRxe8xKhFLva6f5+w@mail.gmail.com>
 <20160711213059.GA12816@ulmo.ba.sec> <20160711213900.GA12942@ulmo.ba.sec> <20160725082906.GA4667@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vk0-f44.google.com ([209.85.213.44]:36220 "EHLO
	mail-vk0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751006AbcGYN3C (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 Jul 2016 09:29:02 -0400
Received: by mail-vk0-f44.google.com with SMTP id n129so197546028vke.3
        for <linux-next@vger.kernel.org>; Mon, 25 Jul 2016 06:29:01 -0700 (PDT)
In-Reply-To: <20160725082906.GA4667@ulmo.ba.sec>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Alexandre Courbot <acourbot@nvidia.com>

Hi,

On Mon, Jul 25, 2016 at 1:29 AM, Thierry Reding
<thierry.reding@gmail.com> wrote:
> On Mon, Jul 11, 2016 at 11:39:00PM +0200, Thierry Reding wrote:
>> On Mon, Jul 11, 2016 at 11:30:59PM +0200, Thierry Reding wrote:
>> > On Mon, Jul 11, 2016 at 09:47:34AM -0700, Doug Anderson wrote:
>> > > Hi,
>> > >
>> > > On Sun, Jul 10, 2016 at 11:56 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> > > > Hi Thierry,
>> > > >
>> > > > Today's linux-next merge of the pwm tree got a conflict in:
>> > > >
>> > > >   drivers/regulator/pwm-regulator.c
>> > > >
>> > > > between commit:
>> > > >
>> > > >   830583004e61 ("regulator: pwm: Drop unneeded pwm_enable() call")
>> > > >   27bfa8893b15 ("regulator: pwm: Support for enable GPIO")
>> > > >   c2588393e631 ("regulator: pwm: Fix regulator ramp delay for continuous mode")
>> > > >
>> > > > from the regulator tree and commit:
>> > > >
>> > > >   b0303deaa480 ("regulator: pwm: Adjust PWM config at probe time")
>> > > >   8bd57ca236d0 ("regulator: pwm: Switch to the atomic PWM API")
>> > > >   25d16595935b ("regulator: pwm: Retrieve correct voltage")
>> > > >   53f239af4c14 ("regulator: pwm: Support extra continuous mode cases")
>> > > >
>> > > > from the pwm tree.
>> > > >
>> > > > I fixed it up (I think, please check - see below) and can carry the fix
>> > > > as necessary. This is now fixed as far as linux-next is concerned, but
>> > > > any non trivial conflicts should be mentioned to your upstream maintainer
>> > > > when your tree is submitted for merging.  You may also want to consider
>> > > > cooperating with the maintainer of the conflicting tree to minimise any
>> > > > particularly complex conflicts.
>> > > >
>> > > > --
>> > > > Cheers,
>> > > > Stephen Rothwell
>> > >
>> > > [ cut ]
>> > >
>> > > >  -      /* Delay required by PWM regulator to settle to the new voltage */
>> > > >  -      usleep_range(ramp_delay, ramp_delay + 1000);
>> > > >  +      /* Ramp delay is in uV/uS. Adjust to uS and delay */
>> > > >  +      ramp_delay = DIV_ROUND_UP(abs(min_uV - old_uV), ramp_delay);
>> > >
>> > > This was what I was worried about and why I originally sent my patch
>> > > based upon Boris's series.  The above should be:
>> > >
>> > > ramp_delay = DIV_ROUND_UP(abs(req_min_uV - old_uV), ramp_delay);
>> > >
>> > > Specifically note the use of "req_min_uV" and not "min_uV".
>> >
>> > Okay, so this is something that needs to be fixed up in one of Boris'
>> > patches? Can you help point out where exactly? The conflict should be
>> > gone as of tomorrow's linux-next.
>>
>> Looks like the below should be squashed into commit:
>>
>>       4585082afab4 regulator: pwm: Support extra continuous mode cases
>>
>> Can you confirm?
>>
>> Thierry
>>
>> --- >8 ---
>> diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm-regulator.c
>> index 263a2d16d909..c24524242da2 100644
>> --- a/drivers/regulator/pwm-regulator.c
>> +++ b/drivers/regulator/pwm-regulator.c
>> @@ -237,7 +237,7 @@ static int pwm_regulator_set_voltage(struct regulator_dev *rdev,
>>               return 0;
>>
>>       /* Ramp delay is in uV/uS. Adjust to uS and delay */
>> -     ramp_delay = DIV_ROUND_UP(abs(min_uV - old_uV), ramp_delay);
>> +     ramp_delay = DIV_ROUND_UP(abs(req_min_uV - old_uV), ramp_delay);
>>       usleep_range(ramp_delay, ramp_delay + DIV_ROUND_UP(ramp_delay, 10));
>>
>>       return 0;
>
> Doug? Can you confirm?

Yes, right.  Sorry, previous email got lost in the shuffle since I was
on vacation.

Right, commit 4585082afab4 ("regulator: pwm: Support extra continuous
mode cases") is the one that renamed the parameters and so this use of
one of the parameters needs to be part of that commit.

Thanks!

-Doug
