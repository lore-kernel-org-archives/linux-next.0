From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: build failure lin Linus' tree
Date: Thu, 10 Mar 2011 00:54:58 +0000
Message-ID: <20110310005458.GD22723@ZenIV.linux.org.uk>
References: <20110310112543.5ae7fb7e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:53420 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753045Ab1CJAzD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 9 Mar 2011 19:55:03 -0500
Content-Disposition: inline
In-Reply-To: <20110310112543.5ae7fb7e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus <torvalds@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Mar 10, 2011 at 11:25:43AM +1100, Stephen Rothwell wrote:
> Hi Linus,
> 
> After merging the spi-current tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> include/linux/sysctl.h:28: included file 'linux/rcupdate.h' is not exported
> 
> Caused by commit dfef6dcd35cb ("unf*ck proc_sysctl ->d_compare()").
> 
> I applied this patch for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 10 Mar 2011 11:14:17 +1100
> Subject: [PATCH] sysctl: the include of rcupdate.h is only needed in the kernel
> 
> Fixes this built error:
> 
> include/linux/sysctl.h:28: included file 'linux/rcupdate.h' is not exported
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

ACKed-by: Al Viro <viro@zeniv.linux.org.uk>
