From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Tue, 28 Jul 2015 09:41:38 +0100
Message-ID: <55B74042.6070600@arm.com>
References: <20150728124324.40f44f01@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:57048 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752996AbbG1Ilm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Jul 2015 04:41:42 -0400
In-Reply-To: <20150728124324.40f44f01@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, "gregory.clement@free-electrons.com" <gregory.clement@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Jason Cooper <jason@lakedaemon.net>, "andrew@lunn.ch" <andrew@lunn.ch>, Sudeep Holla <sudeep.holla@arm.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Hi Stephen,

On 28/07/15 03:43, Stephen Rothwell wrote:
> Hi all,
>
> After merging the tip tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> arch/arm/mach-mvebu/board-v7.c: In function 'mvebu_init_irq':
> arch/arm/mach-mvebu/board-v7.c:138:3: error: implicit declaration of function 'gic_set_irqchip_flags' [-Werror=implicit-function-declaration]
>     gic_set_irqchip_flags(IRQCHIP_SKIP_SET_WAKE |
>     ^
>
> Caused by commit
>
>    e6f134f8e30e ("ARM: mvebu: Allow using the GIC for wakeup in standby mode")
>
> from the mvebu tree interacting with commit
>
>    0d3f2c92e004 ("irqchip/gic: Remove redundant gic_set_irqchip_flags")
>
> from the tip tree.
>
> I have applied the following merge fix patch for today:
>

Thanks for the fix, I was aware of this and asked Thomas Petazzoni
and Gregory CLEMENT to revert the commit e6f134f8e30e if possible
yesterday [1]

Regards,
Sudeep

[1] 
http://lists.infradead.org/pipermail/linux-arm-kernel/2015-July/359585.html
