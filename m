From: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Subject: Re: [bisected 1c0eaf0f] Today's next kernel fails to
 boot on ppc bare-metal
Date: Mon, 17 Jul 2017 11:37:06 +0530
Message-ID: <1500271626.27017.3.camel@abdul.in.ibm.com>
References: <1500025360.5335.37.camel@abdul.in.ibm.com>
         <87mv8324p8.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:58339 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751259AbdGQGHW (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 17 Jul 2017 02:07:22 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v6H64Zrb023249
        for <linux-next@vger.kernel.org>; Mon, 17 Jul 2017 02:07:21 -0400
Received: from e23smtp06.au.ibm.com (e23smtp06.au.ibm.com [202.81.31.148])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2brnekcneg-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Mon, 17 Jul 2017 02:07:21 -0400
Received: from localhost
        by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <abdhalee@linux.vnet.ibm.com>;
        Mon, 17 Jul 2017 16:07:18 +1000
In-Reply-To: <87mv8324p8.fsf@concordia.ellerman.id.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, sachinp <sachinp@linux.vnet.ibm.com>, benh@kernel.crashing.org, mikey@neuling.org

On Mon, 2017-07-17 at 12:10 +1000, Michael Ellerman wrote:
> Hi Abdul,
> 
> Thanks for the bug report.
> 
> Abdul Haleem <abdhalee@linux.vnet.ibm.com> writes:
> > Hi 
> >
> > Today's linux-next fails to boot on ppc bare-metal
> >
> > Test: Boot
> > Machine: Power 8 bare-metal
> > kernel: 4.12.0-next-20170713
> > gcc: version 4.8.5
> > config : Tul-NV-config attached.
> 
> [swearing redacted]
> 
> Does this help?

Yes, it fixes the boot issue. Thanks for the fix.

With below patch, I was able to successfully boot
4.13.0-rc1-next-20170717 kernel on ppc bare-metal

Reported-and-tested-by: Abdul Haleem <abdhalee@linux.vnet.ibm.com>

> 
> diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
> index 9b87abb178f0..cad6b57ce494 100644
> --- a/arch/powerpc/platforms/powernv/opal.c
> +++ b/arch/powerpc/platforms/powernv/opal.c
> @@ -78,7 +78,7 @@ void opal_configure_cores(void)
>  	 *  ie. Host hash  supports  hash guests
>  	 *      Host radix supports  hash/radix guests
>  	 */
> -	if (cpu_has_feature(CPU_FTR_ARCH_300)) {
> +	if (early_cpu_has_feature(CPU_FTR_ARCH_300)) {
>  		reinit_flags |= OPAL_REINIT_CPUS_MMU_HASH;
>  		if (early_radix_enabled())
>  			reinit_flags |= OPAL_REINIT_CPUS_MMU_RADIX;
> 


-- 
Regard's

Abdul Haleem
IBM Linux Technology Centre
