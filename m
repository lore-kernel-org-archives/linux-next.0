From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: mmotm 2017-11-03-13-00 uploaded
Date: Sun, 5 Nov 2017 08:17:00 +1100
Message-ID: <20171105081700.50e04162@canb.auug.org.au>
References: <59fccb0b.sRkbr0rZ7jKYyY01%akpm@linux-foundation.org>
        <7137ff17-e194-2896-f471-91395b447f59@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36255 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751895AbdKDVRE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 4 Nov 2017 17:17:04 -0400
In-Reply-To: <7137ff17-e194-2896-f471-91395b447f59@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: akpm@linux-foundation.org, mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, mhocko@suse.cz, broonie@kernel.org, X86 ML <x86@kernel.org>

Hi Randy,

On Fri, 3 Nov 2017 15:41:35 -0700 Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 11/03/2017 01:01 PM, akpm@linux-foundation.org wrote:
> > 
> > This mmotm tree contains the following patches against 4.14-rc7:
> > (patches marked "*" will be included in linux-next)
> > 
> >   origin.patch  
> origin.patch has a problem.  When CONFIG_SMP is not enabled (on x86_64 e.g.):
> 
> -	if (cpu_has(c, X86_FEATURE_TSC))
> +	if (cpu_has(c, X86_FEATURE_TSC)) {
> +		unsigned int freq = arch_freq_get_on_cpu(cpu);
> 
> 
> arch/x86/kernel/cpu/proc.o: In function `show_cpuinfo':
> proc.c:(.text+0x13d): undefined reference to `arch_freq_get_on_cpu'
> /local/lnx/mmotm/mmotm-2017-1103-1300/Makefile:994: recipe for target 'vmlinux' failed

That would be because the conflist in arch/x86/kernel/cpu/Makefile has
been resolved the wrong way.  In the linux-next import, I have resolved
it like this:

diff --cc arch/x86/kernel/cpu/Makefile
index 236999c54edc,90cb82dbba57..000000000000
--- a/arch/x86/kernel/cpu/Makefile
+++ b/arch/x86/kernel/cpu/Makefile
@@@ -22,7 -22,8 +22,8 @@@ obj-y                 += common.
  obj-y                 += rdrand.o
  obj-y                 += match.o
  obj-y                 += bugs.o
 -obj-$(CONFIG_CPU_FREQ)        += aperfmperf.o
 +obj-y                 += aperfmperf.o
+ obj-y                 += cpuid-deps.o
  
  obj-$(CONFIG_PROC_FS) += proc.o
  obj-$(CONFIG_X86_FEATURE_NAMES) += capflags.o powerflags.o

so it should bo OK there on Monday. [mmotm retained the:

obj-$(CONFIG_CPU_FREQ)        += aperfmperf.o
]
-- 
Cheers,
Stephen Rothwell
