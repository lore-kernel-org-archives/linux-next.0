From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the xen-tip tree with the tip tree
Date: Wed, 28 Jun 2017 14:21:36 +1000
Message-ID: <20170628142136.3cd8dfb4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34169 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751548AbdF1EVk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Jun 2017 00:21:40 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Anoob Soman <anoob.soman@citrix.com>

Hi all,

Today's linux-next merge of the xen-tip tree got a conflict in:

  drivers/xen/events/events_base.c

between commit:

  ef1c2cc88531 ("xen/events: Add support for effective affinity mask")

from the tip tree and commit:

  c48f64ab4723 ("xen-evtchn: Bind dyn evtchn:qemu-dm interrupt to next online VCPU")

from the xen-tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/xen/events/events_base.c
index 2e567d8433b3,813f1e86a599..000000000000
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@@ -1343,12 -1343,8 +1343,12 @@@ static int set_affinity_irq(struct irq_
  			    bool force)
  {
  	unsigned tcpu = cpumask_first_and(dest, cpu_online_mask);
- 	int ret = rebind_irq_to_cpu(data->irq, tcpu);
++	int ret = xen_rebind_evtchn_to_cpu(evtchn_from_irq(data->irq), tcpu);
  
 -	return xen_rebind_evtchn_to_cpu(evtchn_from_irq(data->irq), tcpu);
 +	if (!ret)
 +		irq_data_update_effective_affinity(data, cpumask_of(tcpu));
 +
 +	return ret;
  }
  
  static void enable_dynirq(struct irq_data *data)
