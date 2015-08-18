From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Aug 18 (xen/apic)
Date: Tue, 18 Aug 2015 09:55:56 -0700
Message-ID: <55D3639C.401@infradead.org>
References: <20150818214003.73bd846a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150818214003.73bd846a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
List-Id: linux-next.vger.kernel.org

On 08/18/15 04:40, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20150817:
> 

on i386:

CONFIG_SMP is not enabled.
# CONFIG_X86_UP_APIC is not set


../arch/x86/xen/apic.c: In function 'xen_io_apic_read':
../arch/x86/xen/apic.c:18:2: error: implicit declaration of function 'mpc_ioapic_addr' [-Werror=implicit-function-declaration]
  apic_op.apic_physbase = mpc_ioapic_addr(apic);
  ^
../arch/x86/xen/apic.c: At top level:
../arch/x86/xen/apic.c:155:19: error: 'default_target_cpus' undeclared here (not in a function)
  .target_cpus   = default_target_cpus,
                   ^
../arch/x86/xen/apic.c:158:24: error: 'default_check_apicid_used' undeclared here (not in a function)
  .check_apicid_used  = default_check_apicid_used, /* Used on 32-bit */
                        ^
../arch/x86/xen/apic.c:160:30: error: 'flat_vector_allocation_domain' undeclared here (not in a function)
  .vector_allocation_domain = flat_vector_allocation_domain,
                              ^
../arch/x86/xen/apic.c:163:25: error: 'default_ioapic_phys_id_map' undeclared here (not in a function)
  .ioapic_phys_id_map  = default_ioapic_phys_id_map, /* Used on 32-bit */
                         ^
../arch/x86/xen/apic.c:165:28: error: 'default_cpu_present_to_apicid' undeclared here (not in a function)
  .cpu_present_to_apicid  = default_cpu_present_to_apicid,
                            ^
../arch/x86/xen/apic.c:167:31: error: 'default_check_phys_apicid_present' undeclared here (not in a function)
  .check_phys_apicid_present = default_check_phys_apicid_present, /* smp_sanity_check needs it */
                               ^
../arch/x86/xen/apic.c:174:29: error: 'flat_cpu_mask_to_apicid_and' undeclared here (not in a function)
  .cpu_mask_to_apicid_and  = flat_cpu_mask_to_apicid_and,
                             ^



-- 
~Randy
