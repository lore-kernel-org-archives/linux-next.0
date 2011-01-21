From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: [Intel-gfx] [PATCH 2/5] i915: Add native backlight control
Date: Fri, 21 Jan 2011 10:04:18 +0100
Message-ID: <AANLkTikuTi=t9+1nYNAx7uco+SriD4wwOiNXsYVizwDM@mail.gmail.com>
References: <AANLkTimogiJMKkcgfOCJHxpyZHcB36+xzRFgkqWPOiv_@mail.gmail.com>
	<20110120215502.2305532b.akpm@linux-foundation.org>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:56443 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753431Ab1AUJET convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 21 Jan 2011 04:04:19 -0500
In-Reply-To: <20110120215502.2305532b.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Matthew Garrett <mjg@redhat.com>, DRI <dri-devel@lists.freedesktop.org>, intel-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org

On Fri, Jan 21, 2011 at 6:55 AM, Andrew Morton
<akpm@linux-foundation.org> wrote:
> On Fri, 21 Jan 2011 06:36:54 +0100 Sedat Dilek <sedat.dilek@googlemai=
l.com> wrote:
>
>> ( Original posting from [1] )
>>
>> I have the backlight-type patchset for months in my patch-series (an=
d
>> maintained them if necessary against daily linux-next).
>> Also the last series from 14-Jan-2011 (see 1-5 patch from [2] and th=
e
>> following ones at dri-devel ML).
>>
>> If you couldn't find the updated v2 radeon-backlight-type patch, her=
e
>> the extract from my patch-series:
>> ...
>> # Patch from <https://patchwork.kernel.org/patch/491351/>
>> + backlight-type/v2-drm-radeon-kms-Expose-backlight-class-device-for=
-legacy-LVDS-encoder.patch
>> ...
>>
>> I can only speak for the radeon(-KMS) part with
>> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy set and against linux-next: It wor=
ked,
>> it works.
>>
>> I am a bit angry that someone of the "big 5" gets immediately an
>> answer where mine is ignored [3].
>
> Well, who were they sent to?
>
> If it was dri-devel then perhaps the people there felt it was
> inappropriate to their tree, or they were all busy fixing
> 100000000000000 regressions.
>
> If it was Richard then he's been distracted by other things for some
> time, which is why I recently started handling backlight and leds
> patches.
>
> If it was me then kick me, but I don't think it was.
>
> In general, if you think that patches aren't getting attention then l=
et
> me know and send them to me - harassing people for you is part of my
> job description.
>
>> So dear Mr. AKPM, if you can standstill for a few moments to answer
>> only one of my questions, through which kernel-tree will this patchs=
et
>> walk trough?
>
> leds and backlight patches are presently getting merged into my tree
> and I'm sending them into Linus. =C2=A0I make sure that Richard sees =
them
> all and when he finds time he helps review them for us.
>
> They should turn up in linux-next too - we're working on that.
>
>
> This particular patch series is theoretically a bit late for 2.6.38,
> but if anyone thinks that's a wrong decision, feel free to explain wh=
y.
>
>

Short answer:
No need to kick anybody.
As I said I am using the patchset for a long time, so I am just fine
seeing them in 2.6.38.
( Feel free to add a Tested-by... to all five patches. )

- Sedat -
