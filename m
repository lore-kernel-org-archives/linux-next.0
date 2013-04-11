From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the tip
 tree
Date: Thu, 11 Apr 2013 06:26:20 -0700
Message-ID: <20130411132620.GB2909@kroah.com>
References: <20130411153023.7a987d1ef6f5cfc699eab672@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:47070 "EHLO
	out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753822Ab3DKN0c (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Apr 2013 09:26:32 -0400
Content-Disposition: inline
In-Reply-To: <20130411153023.7a987d1ef6f5cfc699eab672@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sasha Levin <sasha.levin@oracle.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>

On Thu, Apr 11, 2013 at 03:30:23PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> kernel/rtmutex-tester.c between commit 8184004ed7a0
> ("locking/rtmutex/tester: Set correct permissions on sysfs files") from
> the tip tree and commit 928c0c1571b0 ("rtmutex-tester: fix mode of sysfs
> files") from the driver-core tree.
> 
> Both patches do the same thing - I used the tip version and can carry the
> fix as necessary (no action is required).

Thanks for the heads up.

greg k-h
