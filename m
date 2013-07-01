From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: next-20130627 breaks i.MX6 sabre sd UART console
Date: Mon, 01 Jul 2013 13:54:36 -0700
Message-ID: <51D1EC8C.4050101@codeaurora.org>
References: <F7C43F8B2814514CA05F3436BC68046EF1EB72@039-SN2MPN1-013.039d.mgd.msft.net> <alpine.DEB.2.02.1306281403530.4013@ionos.tec.linutronix.de> <51CDB26A.9060500@codeaurora.org> <F7C43F8B2814514CA05F3436BC68046EF2297D@039-SN2MPN1-013.039d.mgd.msft.net> <51CDC2B3.1030907@codeaurora.org> <20130629020738.GG11625@codeaurora.org> <F7C43F8B2814514CA05F3436BC68046EF2EF29@039-SN2MPN1-011.039d.mgd.msft.net> <alpine.DEB.2.02.1307011425500.4013@ionos.tec.linutronix.de> <F7C43F8B2814514CA05F3436BC68046EF2F708@039-SN2MPN1-011.039d.mgd.msft.net> <alpine.DEB.2.02.1307011531210.4013@ionos.tec.linutronix.de> <51D1DD6D.8050805@codeaurora.org> <alpine.DEB.2.02.1307012153060.4013@ionos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.11.231]:60894 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753269Ab3GAUyi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 1 Jul 2013 16:54:38 -0400
In-Reply-To: <alpine.DEB.2.02.1307012153060.4013@ionos.tec.linutronix.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Stehle Vincent-B46079 <B46079@freescale.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, John Stultz <john.stultz@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>

On 07/01/13 13:14, Thomas Gleixner wrote:
> The issue is very subtle. What happens is:
>
> CPU0						CPU1
>
> Switch to oneshot mode
>
>  Copy the bits from tick_broadcast_mask to
>  tick_broadcast_oneshot_mask. We need to do
>  that so the other cpus reach the timer irq
>  and the softirq which switches them to
>  oneshot.
>
>  Kick the broadcast device into oneshot.
>
> 						Timer interrupt fires
> 						
> 						irq_enter sees the cpu in
> 						tick_broadcast_oneshot_mask and
> 						sets the device to oneshot mode
> 						
> 						handle_periodic:
> 						 Sees oneshot mode and adds
> 						 period to
> 						 dev->next_event(KTIME_MAX)
> 			

Yep. It is also racing with the timer interrupt so having more than two
CPUs must help widen the window (which is why we see it on the higher
numbered CPUs).

> 			 
> So we need two fixes:
>
> 1) The replacement of the dummy timer and the effect on the broadcast
>    mask/device
>
> 2) tick_check_oneshot_broadcast needs a sanity check
>
> Patch below.

Looks good.

Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>

One minor typo in the comment below.

> +		switch (tick_broadcast_device.mode) {
> +		case TICKDEV_MODE_ONESHOT:
> +			/*
> +			 * If the system is in oneshot mode we can
> +			 * unconditionally clear the oneshot mask,
> +			 * because the CPU is running and therefor not

s/therefor/therefore/

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
