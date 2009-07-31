From: Sachin Sant <sachinp@in.ibm.com>
Subject: Re: Boot failure on x86_64 (OOPS set_cpu_sibling_map() )
Date: Fri, 31 Jul 2009 16:11:35 +0530
Message-ID: <4A72CA5F.5040301@in.ibm.com>
References: <20090730182143.eadf36e6.sfr@canb.auug.org.au> <4A718338.6050907@in.ibm.com> <20090730135623.GB16659@aftab>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp02.in.ibm.com ([59.145.155.2]:40992 "EHLO
	e28smtp02.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752139AbZGaKlh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 31 Jul 2009 06:41:37 -0400
In-Reply-To: <20090730135623.GB16659@aftab>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Borislav Petkov <borislav.petkov@amd.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>

Borislav Petkov wrote:
> I can't trigger it here, please send me your .config. In the meantime,
> you could try the following:
>
> --
> diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
> index 3ede593..5fd57fe 100644
> --- a/arch/x86/kernel/smpboot.c
> +++ b/arch/x86/kernel/smpboot.c
> @@ -1070,6 +1070,7 @@ void __init native_smp_prepare_cpus(unsigned int max_cpus)
>  	for_each_possible_cpu(i) {
>  		zalloc_cpumask_var(&per_cpu(cpu_sibling_map, i), GFP_KERNEL);
>  		zalloc_cpumask_var(&per_cpu(cpu_core_map, i), GFP_KERNEL);
> +		zalloc_cpumask_var(&per_cpu(cpu_node_map, i), GFP_KERNEL);
>  		zalloc_cpumask_var(&cpu_data(i).llc_shared_map, GFP_KERNEL);
>  	}
>  	set_cpu_sibling_map(0);
>   
Thanks for the patch Borislav. With this patch i can boot next on my x86_64 box.

Regards
-Sachin

-- 

---------------------------------
Sachin Sant
IBM Linux Technology Center
India Systems and Technology Labs
Bangalore, India
---------------------------------
