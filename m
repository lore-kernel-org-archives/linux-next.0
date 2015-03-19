From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: linux-next: manual merge of the irqchip tree with Linus' tree
Date: Thu, 19 Mar 2015 14:19:44 +0000
Message-ID: <550ADB00.4080808@arm.com>
References: <20150316144727.488070cb@canb.auug.org.au> <5506989D.9050703@arm.com> <20150318175208.GC15137@io.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:37306 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755097AbbCSOTr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Mar 2015 10:19:47 -0400
In-Reply-To: <20150318175208.GC15137@io.lakedaemon.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jason Cooper <jason@lakedaemon.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>

On 18/03/15 17:52, Jason Cooper wrote:
> On Mon, Mar 16, 2015 at 08:47:25AM +0000, Marc Zyngier wrote:
>> Hi Stephen, Jason,
>>
>> On 16/03/15 03:47, Stephen Rothwell wrote:
>>> Hi Jason,
>>>
>>> Today's linux-next merge of the irqchip tree got a conflict in
>>> arch/arm/mach-exynos/suspend.c between commit ace283a04a4a ("ARM:
>>> EXYNOS: Fix wrong hwirq of RTC interrupt for Exynos3250 SoC") from
>>> Linus' tree and commit be42c9ea7b5f ("ARM: exynos4/5: convert pmu
>>> wakeup to stacked domains") from the irqchip tree.
>>>
>>> I fixed it up (I just randomly chose to use the irqchip tree version)
>>> and can carry the fix as necessary (no action is required).
>>>
>>
>> Actually, the fix is slightly less obvious, mostly because I introduced
>> a bug while converting the code to stacked domains. I noticed that
>> something was amiss in the Exynos code, but fixed it the wrong way
>> (I assumed the DT was wrong, while it was the code).
>>
>> Now, in the light of ace283a04a4a, the fix should be:
> 
> Squashed in and a new irqchip/stacked-exynos posted.  Result attached.

[...]

Looks good, thanks Jason. There will be a small fixup for the Exynos
tree, adjusting their RTC irqs in the right direction, but I'll provide
this independently.

Thanks again,

	M.
-- 
Jazz is not dead. It just smells funny...
