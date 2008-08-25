From: "Yinghai Lu" <yhlu.kernel@gmail.com>
Subject: Re: linux-next: sparseirq tree build failure
Date: Mon, 25 Aug 2008 10:45:22 -0700
Message-ID: <86802c440808251045j351756c1oc825fc6f39a026a@mail.gmail.com>
References: <20080825195024.d42b72e6.sfr@canb.auug.org.au>
	 <86802c440808251042t79b9a9a7nd6fef3b9c3d37b25@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.238]:17248 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753235AbYHYRpW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 Aug 2008 13:45:22 -0400
Received: by rv-out-0506.google.com with SMTP id k40so1728443rvb.1
        for <linux-next@vger.kernel.org>; Mon, 25 Aug 2008 10:45:22 -0700 (PDT)
In-Reply-To: <86802c440808251042t79b9a9a7nd6fef3b9c3d37b25@mail.gmail.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org

On Mon, Aug 25, 2008 at 10:42 AM, Yinghai Lu <yhlu.kernel@gmail.com> wrote:
> On Mon, Aug 25, 2008 at 2:50 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Hi Ingo,
>>
>> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
>>
>> arch/powerpc/platforms/cell/interrupt.c: In function 'handle_iic_irq':
>> arch/powerpc/platforms/cell/interrupt.c:257: error: 'struct kernel_stat' has no member named 'irqs'
>> arch/powerpc/kernel/irq.c: In function 'show_interrupts':
>> arch/powerpc/kernel/irq.c:193: error: 'struct kernel_stat' has no member named 'irqs'
>>
>> Presumably introduced by commit fb6dc57946f9ebfeac546dd0698d9f065c191668
>> ("x86: move kstat_irqs from kstat to irq_desc").
>>
>> Looks like there is more work here ...
>>
>> Its late, so I just dropped the whole tree for today.  We can try again
>> tomorrow.
>
> seems there is some merge problem...
> please check.
>
> diff --git a/include/linux/kernel_stat.h b/include/linux/kernel_stat.h
> index f106167..3cd7389 100644
> --- a/include/linux/kernel_stat.h
> +++ b/include/linux/kernel_stat.h
> @@ -28,7 +28,7 @@ struct cpu_usage_stat {
>
>  struct kernel_stat {
>        struct cpu_usage_stat   cpustat;
> -#ifndef CONFIG_GENERIC_HARDIRQS
> +#ifndef CONFIG_HAVE_SPARSE_IRQ
>        unsigned int irqs[NR_IRQS];
>  #endif
>  };

more than that, will double check that.

YH
