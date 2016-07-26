From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the xen-tip tree with the tip tree
Date: Tue, 26 Jul 2016 14:01:45 +1000
Message-ID: <20160726140145.63ef0519@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41796 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750806AbcGZEBs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 26 Jul 2016 00:01:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, boris.ostrovsky@oracle.com, david.vrabel@citrix.com, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vitaly Kuznetsov <vkuznets@redhat.com>

Hi all,

Today's linux-next merge of the xen-tip tree got a conflict in:

  arch/x86/xen/enlighten.c

between commit:

  4c9075835511 ("xen/x86: Move irq allocation from Xen smp_op.cpu_up()")

from the tip tree and commit:

  88e957d6e47f ("xen: introduce xen_vcpu_id mapping")

from the xen-tip tree.

I fixed it up (I think - see below) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/x86/xen/enlighten.c
index dc96f939af88,85ef4c0442e0..000000000000
--- a/arch/x86/xen/enlighten.c
+++ b/arch/x86/xen/enlighten.c
@@@ -1803,49 -1823,21 +1824,53 @@@ static void __init init_hvm_pv_info(voi
  	xen_domain_type = XEN_HVM_DOMAIN;
  }
  
 -static int xen_hvm_cpu_notify(struct notifier_block *self, unsigned long action,
 -			      void *hcpu)
 +static int xen_cpu_notify(struct notifier_block *self, unsigned long action,
 +			  void *hcpu)
  {
  	int cpu = (long)hcpu;
 +	int rc;
 +
  	switch (action) {
  	case CPU_UP_PREPARE:
 -		if (cpu_acpi_id(cpu) != U32_MAX)
 -			per_cpu(xen_vcpu_id, cpu) = cpu_acpi_id(cpu);
 -		else
 -			per_cpu(xen_vcpu_id, cpu) = cpu;
 -		xen_vcpu_setup(cpu);
 -		if (xen_have_vector_callback) {
 -			if (xen_feature(XENFEAT_hvm_safe_pvclock))
 -				xen_setup_timer(cpu);
 +		if (xen_hvm_domain()) {
 +			/*
 +			 * This can happen if CPU was offlined earlier and
 +			 * offlining timed out in common_cpu_die().
 +			 */
 +			if (cpu_report_state(cpu) == CPU_DEAD_FROZEN) {
 +				xen_smp_intr_free(cpu);
 +				xen_uninit_lock_cpu(cpu);
 +			}
 +
++			if (cpu_acpi_id(cpu) != U32_MAX)
++				per_cpu(xen_vcpu_id, cpu) = cpu_acpi_id(cpu);
++			else
++				per_cpu(xen_vcpu_id, cpu) = cpu;
 +			xen_vcpu_setup(cpu);
  		}
 +
 +		if (xen_pv_domain() ||
 +		    (xen_have_vector_callback &&
 +		     xen_feature(XENFEAT_hvm_safe_pvclock)))
 +			xen_setup_timer(cpu);
 +
 +		rc = xen_smp_intr_init(cpu);
 +		if (rc) {
 +			WARN(1, "xen_smp_intr_init() for CPU %d failed: %d\n",
 +			     cpu, rc);
 +			return NOTIFY_BAD;
 +		}
 +
 +		break;
 +	case CPU_ONLINE:
 +		xen_init_lock_cpu(cpu);
 +		break;
 +	case CPU_UP_CANCELED:
 +		xen_smp_intr_free(cpu);
 +		if (xen_pv_domain() ||
 +		    (xen_have_vector_callback &&
 +		     xen_feature(XENFEAT_hvm_safe_pvclock)))
 +			xen_teardown_timer(cpu);
  		break;
  	default:
  		break;
