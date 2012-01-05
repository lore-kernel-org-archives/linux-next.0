From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Thu, 5 Jan 2012 15:52:33 -0800
Message-ID: <20120105155233.0d367bc3.akpm@linux-foundation.org>
References: <20120105182949.e35b2430b915b50e4bb9bc04@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:44027 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932448Ab2AEXwe (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 5 Jan 2012 18:52:34 -0500
In-Reply-To: <20120105182949.e35b2430b915b50e4bb9bc04@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dimitri Sivanich <sivanich@sgi.com>, Kay Sievers <kay.sievers@vrfy.org>, Greg KH <greg@kroah.com>

On Thu, 5 Jan 2012 18:29:49 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Andrew,
> 
> After merging the akpm tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> kernel/time/tick-sched.c:874:7: warning: 'struct sysdev_attribute' declared inside parameter list [enabled by default]
>
> ...
>
> Caused by commit 629d589817da ("tick-sched: add specific do_timer_cpu
> value for nohz off mode") interacting with the removal of sysdevs in the
> driver-core tree.  This patch will need reworking for that.
> 
> I have reverted that commit for today.

Bah.  I dropped it.

I must say, this week was a maximally inappropriate time to merge all this
sysdev stuff into linux-next.
