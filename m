From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [Xen-devel] linux-next: Tree for Aug 18 (xen/apic)
Date: Wed, 19 Aug 2015 12:12:06 -0400
Message-ID: <20150819161206.GA14136@l.oracle.com>
References: <20150818214003.73bd846a@canb.auug.org.au>
 <55D3639C.401@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:44452 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751161AbbHSQMp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 19 Aug 2015 12:12:45 -0400
Content-Disposition: inline
In-Reply-To: <55D3639C.401@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, Jason@zx2c4.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org

On Tue, Aug 18, 2015 at 09:55:56AM -0700, Randy Dunlap wrote:
> On 08/18/15 04:40, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20150817:
> > 
> 
> on i386:
> 
> CONFIG_SMP is not enabled.
> # CONFIG_X86_UP_APIC is not set

I think this is related to fc5fee86bdd3d720e2d1d324e4fae0c35845fa63
Author: Jason A. Donenfeld <Jason@zx2c4.com>
Date:   Mon Aug 10 15:40:27 2015 +0200

    x86/xen: build "Xen PV" APIC driver for domU as well

CCing Jason
> 
> 
> ../arch/x86/xen/apic.c: In function 'xen_io_apic_read':
> ../arch/x86/xen/apic.c:18:2: error: implicit declaration of function 'mpc_ioapic_addr' [-Werror=implicit-function-declaration]
>   apic_op.apic_physbase = mpc_ioapic_addr(apic);
>   ^
> ../arch/x86/xen/apic.c: At top level:
> ../arch/x86/xen/apic.c:155:19: error: 'default_target_cpus' undeclared here (not in a function)
>   .target_cpus   = default_target_cpus,
>                    ^
> ../arch/x86/xen/apic.c:158:24: error: 'default_check_apicid_used' undeclared here (not in a function)
>   .check_apicid_used  = default_check_apicid_used, /* Used on 32-bit */
>                         ^
> ../arch/x86/xen/apic.c:160:30: error: 'flat_vector_allocation_domain' undeclared here (not in a function)
>   .vector_allocation_domain = flat_vector_allocation_domain,
>                               ^
> ../arch/x86/xen/apic.c:163:25: error: 'default_ioapic_phys_id_map' undeclared here (not in a function)
>   .ioapic_phys_id_map  = default_ioapic_phys_id_map, /* Used on 32-bit */
>                          ^
> ../arch/x86/xen/apic.c:165:28: error: 'default_cpu_present_to_apicid' undeclared here (not in a function)
>   .cpu_present_to_apicid  = default_cpu_present_to_apicid,
>                             ^
> ../arch/x86/xen/apic.c:167:31: error: 'default_check_phys_apicid_present' undeclared here (not in a function)
>   .check_phys_apicid_present = default_check_phys_apicid_present, /* smp_sanity_check needs it */
>                                ^
> ../arch/x86/xen/apic.c:174:29: error: 'flat_cpu_mask_to_apicid_and' undeclared here (not in a function)
>   .cpu_mask_to_apicid_and  = flat_cpu_mask_to_apicid_and,
>                              ^
> 
> 
> 
> -- 
> ~Randy
> 
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xen.org
> http://lists.xen.org/xen-devel
