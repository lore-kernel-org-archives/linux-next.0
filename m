From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the suspend tree with the cpus4096 tree
Date: Mon, 16 Mar 2009 20:00:05 +1100
Message-ID: <20090316200005.2a98d95b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49742 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760589AbZCPJAL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Mar 2009 05:00:11 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: linux-next@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>, Mike Travis <travis@sgi.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

Hi Rafael,

Today's linux-next merge of the suspend tree got a conflict in
drivers/xen/manage.c between commit
f7df8ed164996cd2c6aca9674388be6ef78d8b37 ("cpumask: convert misc driver
functions") from the cpus4096 tree and commit
73263bc09332c5c8de7c60cb76b5b24e2da66b42 ("PM: Rework handling of
interrupts during suspend-resume") from the suspend tree.

I fixed it up (see below) and can carry the fix as necessary.  As you
said, it is trivial.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/xen/manage.c
index 3ccd348,2f1d082..0000000
--- a/drivers/xen/manage.c
+++ b/drivers/xen/manage.c
@@@ -108,7 -101,13 +101,13 @@@ static void do_suspend(void
  	/* XXX use normal device tree? */
  	xenbus_suspend();
  
+ 	err = device_power_down(PMSG_SUSPEND);
+ 	if (err) {
+ 		printk(KERN_ERR "device_power_down failed: %d\n", err);
+ 		goto resume_devices;
+ 	}
+ 
 -	err = stop_machine(xen_suspend, &cancelled, &cpumask_of_cpu(0));
 +	err = stop_machine(xen_suspend, &cancelled, cpumask_of(0));
  	if (err) {
  		printk(KERN_ERR "failed to start xen_suspend: %d\n", err);
  		goto out;
