From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the xen-tip tree with the tip tree
Date: Tue, 26 Jul 2016 14:02:39 +1000
Message-ID: <20160726140239.364b2281@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57238 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752821AbcGZECl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 26 Jul 2016 00:02:41 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, boris.ostrovsky@oracle.com, david.vrabel@citrix.com, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vitaly Kuznetsov <vkuznets@redhat.com>

Hi all,

Today's linux-next merge of the xen-tip tree got a conflict in:

  arch/x86/xen/smp.c

between commit:

  4c9075835511 ("xen/x86: Move irq allocation from Xen smp_op.cpu_up()")

from the tip tree and commit:

  ad5475f9faf5 ("x86/xen: use xen_vcpu_id mapping for HYPERVISOR_vcpu_op")

from the xen-tip tree.

I fixed it up (I think - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/x86/xen/smp.c
index 09d5cc062dbe,0b4d04c8ab4d..000000000000
--- a/arch/x86/xen/smp.c
+++ b/arch/x86/xen/smp.c
@@@ -486,7 -495,11 +493,7 @@@ static int xen_cpu_up(unsigned int cpu
  
  	xen_pmu_init(cpu);
  
- 	rc = HYPERVISOR_vcpu_op(VCPUOP_up, cpu, NULL);
 -	rc = xen_smp_intr_init(cpu);
 -	if (rc)
 -		return rc;
 -
+ 	rc = HYPERVISOR_vcpu_op(VCPUOP_up, xen_vcpu_nr(cpu), NULL);
  	BUG_ON(rc);
  
  	while (cpu_report_state(cpu) != CPU_ONLINE)
