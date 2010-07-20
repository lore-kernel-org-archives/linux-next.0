From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: build failure after merge of the final tree (workqueues
 tree related)
Date: Tue, 20 Jul 2010 10:42:52 +0200
Message-ID: <4C45618C.2040905@kernel.org>
References: <20100720151030.f874832e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:48275 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758275Ab0GTInA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 20 Jul 2010 04:43:00 -0400
In-Reply-To: <20100720151030.f874832e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/20/2010 07:10 AM, Stephen Rothwell wrote:
> Hi Tejun,
> 
> After merging the final tree, today's linux-next build (powerpc
> allnoconfig) failed like this:
> 
> kernel/workqueue.c: In function 'alloc_cwqs':
> kernel/workqueue.c:2634: error: 'CONFIG_SMP' undeclared (first use in this function)
> kernel/workqueue.c: In function 'free_cwqs':
> kernel/workqueue.c:2659: error: 'CONFIG_SMP' undeclared (first use in this function)
> 
> Caused by commit f34217977d717385a3e9fd7018ac39fade3964c0 ("workqueue:
> implement unbound workqueue").  Config symbols need to be checked for
> being defined ...

Heh, yeah, I have no idea what I was thinking.  Will fix up soon.

Thanks.

-- 
tejun
