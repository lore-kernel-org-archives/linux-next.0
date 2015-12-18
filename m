From: Jiang Liu <jiang.liu@linux.intel.com>
Subject: Re: Problems with x86/x86_64 qemu tests in linux-next due to 'Enhance
 __assign_irq_vector() to rollback ...'
Date: Fri, 18 Dec 2015 17:14:41 +0800
Message-ID: <5673CE81.1030502@linux.intel.com>
References: <56734C4C.2050202@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56734C4C.2050202@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Joe Lawrence <joe.lawrence@stratus.com>
List-Id: linux-next.vger.kernel.org

On 2015/12/18 7:59, Guenter Roeck wrote:
> Hi folks,
> 
> several of my qemu tests of linux-next started failing a couple of days
> ago.
> Logs are available at http://server.roeck-us.net:8010/builders, in the
> 'next' column.
> 
> Bisect points to 'x86/irq: Enhance __assign_irq_vector() to rollback in
> case of failure'.
> Bisect log is attached below. Reverting this patch as well as the
> subsequent patches
> in arch/x86/kernel/apic/vector.c fixes the problem.
Hi Guenter,
	Thanks for reporting this issue. We have already had a fix
for it, and will send the new patch out once it passes function tests.
Thanks,
Gerry

> 
> Guenter
> 
> ---
> # bad: [57036847fee7aa782ea834af770426517f1efc96] Add linux-next
> specific files for 20151216
> # good: [9f9499ae8e6415cefc4fe0a96ad0e27864353c89] Linux 4.4-rc5
> git bisect start 'HEAD' 'v4.4-rc5'
> # good: [cd61a37515d48ce6603e681f18f0ae59025c733a] Merge remote-tracking
> branch 'crypto/master'
> git bisect good cd61a37515d48ce6603e681f18f0ae59025c733a
> # bad: [e12cc3355bf7fc7fdca05d12ae1aa53a2561af84] Merge remote-tracking
> branch 'irqchip/irqchip/for-next'
> git bisect bad e12cc3355bf7fc7fdca05d12ae1aa53a2561af84
> # good: [2e27153f14236cc20bf1cad16da202b5a8fb6189] Merge remote-tracking
> branch 'sound-asoc/for-next'
> git bisect good 2e27153f14236cc20bf1cad16da202b5a8fb6189
> # good: [95ecee8d876ddabcbe32fc48ec8c7272d1738645] Merge remote-tracking
> branch 'mailbox/mailbox-for-next'
> git bisect good 95ecee8d876ddabcbe32fc48ec8c7272d1738645
> # good: [05a927fb715bd97ce3baed157b157c16a3216f55] Merge branch
> 'timers/core'
> git bisect good 05a927fb715bd97ce3baed157b157c16a3216f55
> # bad: [acae1b21abdc2b1a0a8809d4263b7b06c380c065] Merge remote-tracking
> branch 'tip/auto-latest'
> git bisect bad acae1b21abdc2b1a0a8809d4263b7b06c380c065
> # bad: [f45b7ee9ed0632acc1c7404a1e8f47a40146a07e] Merge branch 'x86/fpu'
> git bisect bad f45b7ee9ed0632acc1c7404a1e8f47a40146a07e
> # bad: [41c19d8bf8540c9016563b649b2034d1804ca0af] Merge branch 'x86/asm'
> git bisect bad 41c19d8bf8540c9016563b649b2034d1804ca0af
> # bad: [ba207f77e6e5642ad7c3dc7f2217c590cf1352cb] Merge branch
> 'x86/urgent' into x86/apic
> git bisect bad ba207f77e6e5642ad7c3dc7f2217c590cf1352cb
> # good: [c61a0d31ba0ce75cb1b88bb4eb2f41a1b80bc90f] x86/apic: Wire up
> single IPI for apic_numachip
> git bisect good c61a0d31ba0ce75cb1b88bb4eb2f41a1b80bc90f
> # good: [2fde46b79e2fdbc90d0d97cf992782732b5a371c] x86/smpboot:
> Re-enable init_udelay=0 by default on modern CPUs
> git bisect good 2fde46b79e2fdbc90d0d97cf992782732b5a371c
> # bad: [21a1b3bf35018b446c943c15f0a6225e6f6497ae] x86/irq: Fix a race
> window in x86_vector_free_irqs()
> git bisect bad 21a1b3bf35018b446c943c15f0a6225e6f6497ae
> # bad: [4c24cee6b2aeaee3dab896f76fef4fe79d9e4183] x86/irq: Enhance
> __assign_irq_vector() to rollback in case of failure
> git bisect bad 4c24cee6b2aeaee3dab896f76fef4fe79d9e4183
> # good: [6dd7cb991fcbfef55d8bf3d22b8a87f9d5007e20] x86/irq: Do not reuse
> struct apic_chip_data.old_domain as temporary buffer
> git bisect good 6dd7cb991fcbfef55d8bf3d22b8a87f9d5007e20
> # first bad commit: [4c24cee6b2aeaee3dab896f76fef4fe79d9e4183] x86/irq:
> Enhance __assign_irq_vector() to rollback in case of failure
