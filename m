From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: rr tree build failure
Date: Mon, 24 Nov 2008 14:31:58 +1100
Message-ID: <20081124143158.6de384f8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33951 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751586AbYKXDcM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 23 Nov 2008 22:32:12 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>

Hi Rusty,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

arch/powerpc/kernel/irq.c: In function 'fixup_irqs':
arch/powerpc/kernel/irq.c:240: error: incompatible type for argument 2 of 'irq_desc[irq].chip->set_affinity'
arch/powerpc/sysdev/mpic.c: In function 'mpic_alloc':
arch/powerpc/sysdev/mpic.c:1069: warning: assignment from incompatible pointer type
arch/powerpc/sysdev/mpic.c:1074: warning: assignment from incompatible pointer type
arch/powerpc/platforms/pseries/xics.c:385: warning: initialization from incompatible pointer type
arch/powerpc/platforms/pseries/xics.c:394: warning: initialization from incompatible pointer type
arch/powerpc/platforms/pseries/xics.c: In function 'xics_migrate_irqs_away':
arch/powerpc/platforms/pseries/xics.c:864: error: incompatible type for argument 2 of 'desc->chip->set_affinity'

caused by commit 5b03e170d524383a34a89fd73ec9d1bda0922d63
("cpumask:irq-functions-take-cpumask_t-ptr") which changed the
set_affinity callback but didn't update all the instances.

I have dropped the rr tree again today.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
