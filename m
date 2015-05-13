From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] bus: arm-ccn: Use hrtimer_start()
Date: Wed, 13 May 2015 17:32:05 +0200
Message-ID: <2646197.ZVRR8xztig@wuerfel>
References: <alpine.DEB.2.11.1505131712320.4225@nanos> <1431530484-3389-1-git-send-email-pawel.moll@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:64888 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965383AbbEMPcl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 13 May 2015 11:32:41 -0400
In-Reply-To: <1431530484-3389-1-git-send-email-pawel.moll@arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org
Cc: Pawel Moll <pawel.moll@arm.com>, arm@kernel.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org

On Wednesday 13 May 2015 16:21:24 Pawel Moll wrote:
> diff --git a/drivers/bus/arm-ccn.c b/drivers/bus/arm-ccn.c
> index df5f307..7d9879e 100644
> --- a/drivers/bus/arm-ccn.c
> +++ b/drivers/bus/arm-ccn.c
> @@ -921,9 +921,8 @@ static void arm_ccn_pmu_event_start(struct perf_event *event, int flags)
>          * attribute).
>          */
>         if (!ccn->irq)
> -               __hrtimer_start_range_ns(&ccn->dt.hrtimer,
> -                               arm_ccn_pmu_timer_period(), 0,
> -                               HRTIMER_MODE_REL_PINNED, 0);
> +               hrtimer_start(&ccn->dt.hrtimer, arm_ccn_pmu_timer_period(),
> +                               HRTIMER_MODE_REL_PINNED);
>  
>         /* Set the DT bus input, engaging the counter */
>         arm_ccn_pmu_xp_dt_config(event, 1);

Is this correct by itself, or do we need to pull in the branch that
contains c6eb3f70d44828 ("hrtimer: Get rid of hrtimer softirq")
from Thomas? The other similar patches that Thomas did contain a
comment about the conversion being safe after hrtimer_start()
no longer uses a softirq, but it is still in use in 4.1-rc3.

	Arnd
