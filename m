From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: rr tree build warning
Date: Fri, 24 Oct 2008 14:44:09 +1100
Message-ID: <200810241444.09760.rusty@rustcorp.com.au>
References: <20081024133407.8c4df5f6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:48357 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751474AbYJXDoF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Oct 2008 23:44:05 -0400
In-Reply-To: <20081024133407.8c4df5f6.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>, travis@sgi.com

On Friday 24 October 2008 13:34:07 Stephen Rothwell wrote:
> Hi Rusty,
>
> Today's linux-next build (powerpc ppc64_defconfig) got this warning:
>
> kernel/workqueue.c: In function 'work_on_cpu':
> kernel/workqueue.c:1009: warning: passing argument 1 of 'flush_workqueue'
> from incompatible pointer type
>
> You are passing a "struct work_struct *" to fluxh_workqueue which wants a
> "struct workqueue_struct *".

Please s/flush_workqueue/flush_work/.  Somehow I missed that warning (and
didn't re-test after that trivial change).

Tested, even.

diff -r 4d829bda1768 kernel/workqueue.c
--- a/kernel/workqueue.c	Fri Oct 24 14:10:09 2008 +1100
+++ b/kernel/workqueue.c	Fri Oct 24 14:10:58 2008 +1100
@@ -1006,7 +1006,7 @@ long work_on_cpu(unsigned int cpu, long 
 		wfc.ret = -EINVAL;
 	else {
 		schedule_work_on(cpu, &wfc.work);
-		flush_workqueue(&wfc.work);
+		flush_work(&wfc.work);
 	}
 	put_online_cpus();
 
Sorry,
Rusty.
