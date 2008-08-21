From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the ftrace tree
Date: Wed, 20 Aug 2008 20:33:08 -0700
Message-ID: <20080821033308.GA23468@kroah.com>
References: <20080821130903.1df56278.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:47980 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752655AbYHUDsF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 Aug 2008 23:48:05 -0400
Content-Disposition: inline
In-Reply-To: <20080821130903.1df56278.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>, Jason Baron <jbaron@redhat.com>

On Thu, Aug 21, 2008 at 01:09:03PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> [I have reported this previously but something has changed slightly.]
> 
> Today's linux-next merge of the ftrace tree got a conflict in
> kernel/module.c between commit bf8b9a59e335ca159aa4b3878ced0e94ea74cbc4
> ("driver core: basic infrastructure for per-module dynamic debug
> messages") from the driver-core tree and commit
> e543dff1468a55cdff9932dd3a806524790cf0b3 ("tracing: Kernel Tracepoints")
> from the ftrace tree.
> 
> Just overlapping additions.  I fixed it up (see below).

Merge looks good to me.

thanks,

greg k-h
