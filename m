From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the tip
 tree
Date: Wed, 4 Jan 2012 14:52:20 -0800
Message-ID: <20120104225220.GA24583@kroah.com>
References: <20111228155707.f4554d3d6b624189e4216aed@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out5.smtp.messagingengine.com ([66.111.4.29]:49485 "EHLO
	out5.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757179Ab2ADXFD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Jan 2012 18:05:03 -0500
Received: from compute5.internal (compute5.nyi.mail.srv.osa [10.202.2.45])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id A53C920DC8
	for <linux-next@vger.kernel.org>; Wed,  4 Jan 2012 18:05:02 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20111228155707.f4554d3d6b624189e4216aed@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Kay Sievers <kay.sievers@vrfy.org>

On Wed, Dec 28, 2011 at 03:57:07PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> include/linux/cpu.h between commit 2987557f52b9 ("driver-core/cpu: Expose
> hotpluggability to the rest of the kernel") from the tip tree and commit
> 8a25a2fd126c ("cpu: convert 'cpu' and 'machinecheck' sysdev_class to a
> regular subsystem") from the driver-core tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary

Looks fine, thanks.

greg k-h
