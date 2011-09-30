From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH] KVM: x86: Use do_div for tsc deadline calculation
Date: Fri, 30 Sep 2011 10:35:53 -0700
Message-ID: <4E85FDF9.7060502@xenotime.net>
References: <20110929165730.661cf28c9bb27b8a85432cd2@canb.auug.org.au> <4E84CC00.8090702@xenotime.net> <20110930085810.11bc8e2e38e1400a8b0b4cec@canb.auug.org.au> <4E85ACFC.1090509@siemens.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy1-pub.bluehost.com ([66.147.249.253]:48428 "HELO
	oproxy1-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1754911Ab1I3Rf4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 30 Sep 2011 13:35:56 -0400
In-Reply-To: <4E85ACFC.1090509@siemens.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Avi Kivity <avi@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "Liu >> \"Liu, Jinsong\"" <jinsong.liu@intel.com>, "Tian, Kevin" <kevin.tian@intel.com>

On 09/30/11 04:50, Jan Kiszka wrote:
> Required on i386 hosts.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>

Reported-by: Randy Dunlap <rdunlap@xenotime.net>
Acked-by: Randy Dunlap <rdunlap@xenotime.net>

Thanks.

> ---
>  arch/x86/kvm/lapic.c |    7 ++++---
>  1 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
> index f9385ec..92390dc 100644
> --- a/arch/x86/kvm/lapic.c
> +++ b/arch/x86/kvm/lapic.c
> @@ -740,9 +740,10 @@ static void start_apic_timer(struct kvm_lapic *apic)
>  
>  		now = apic->lapic_timer.timer.base->get_time();
>  		guest_tsc = kvm_x86_ops->read_l1_tsc(vcpu);
> -		if (likely(tscdeadline > guest_tsc))
> -			ns = (tscdeadline - guest_tsc)
> -				* 1000000L / this_tsc_khz;
> +		if (likely(tscdeadline > guest_tsc)) {
> +			ns = (tscdeadline - guest_tsc) * 1000000ULL;
> +			do_div(ns, this_tsc_khz);
> +		}
>  		hrtimer_start(&apic->lapic_timer.timer,
>  			ktime_add_ns(now, ns), HRTIMER_MODE_ABS);
>  


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
