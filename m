From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: linux-next: Tree for May 2
Date: Fri, 3 May 2019 02:43:44 +0200
Message-ID: <991a8520-5bb9-a4cd-8dc0-38ac2f76571d@linaro.org>
References: <20190502201028.707453d8@canb.auug.org.au>
 <CADYN=9LHJpDyvA=3wkcqdS5f3kahD0vdXFY415k8UmLHMDzL+Q@mail.gmail.com>
 <20190502190845.GA19485@archlinux-i9>
 <0a28f5b8-296a-451c-c2f4-c0057833fb00@linaro.org>
 <20190503080331.0ccc2419@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190503080331.0ccc2419@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Nathan Chancellor <natechancellor@gmail.com>, Anders Roxell <anders.roxell@linaro.org>, maxime.ripard@bootlin.com, andre.przywara@arm.com, samuel@sholland.org, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 03/05/2019 00:03, Stephen Rothwell wrote:
> Hi Daniel,
> 
> On Thu, 2 May 2019 22:09:49 +0200 Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>>
>> Yes, I picked the patch and it was merged it via the tip tree [1] as
>> requested by Marc Zyngier [2] and notified [3].
>>
>> In any case, this patch should have go through my tree initially, so if
>> it is found somewhere else that's wrong.
>>
>> I did a respin of my branch and pushed it again in case there was
>> something wrong from it.
> 
> The patch ("clocksource/drivers/arch_timer: Workaround for Allwinner
> A64 timer instability") was merged into v5.1-rc1 via the tip tree as
> you say, however the version of your clockevents tree in yesterday's
> linux-next was based on v5.0-rc1 and contained the patch again ...
> 
> Today's should be better.

Oh, ok. As I updated the branch today before having this merge conflict
I thought the problem was coming from somewhere else. Thanks for the update.



-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
