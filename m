From: Sage Weil <sage@newdream.net>
Subject: Re: linux-next: nfs/ceph tree build failure
Date: Thu, 7 Jan 2010 20:51:45 -0800 (PST)
Message-ID: <Pine.LNX.4.64.1001072048420.7474@cobra.newdream.net>
References: <20100108111136.3feae8c6.sfr@canb.auug.org.au>
 <1262909913.2659.47.camel@localhost> <20100108121903.6a096bc1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cobra.newdream.net ([66.33.216.30]:38729 "EHLO
	cobra.newdream.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751259Ab0AHEvk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 Jan 2010 23:51:40 -0500
In-Reply-To: <20100108121903.6a096bc1.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Trond Myklebust <trond.myklebust@fys.uio.no>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Wu Fengguang <fengguang.wu@intel.com>

On Fri, 8 Jan 2010, Stephen Rothwell wrote:

> Hi Trond,
> 
> On Thu, 07 Jan 2010 19:18:33 -0500 Trond Myklebust <trond.myklebust@fys.uio.no> wrote:
> >
> > The patch itself looks correct to me.
> 
> Thanks for the confirmation.

Yep, looks good.

> > How would you like me to proceed? Should I revert the VM changes from
> > the NFS linux-next tree, or would you be OK with keeping the above patch
> > for now?
> 
> I am OK with keeping the patch - we just need to remember it during the
> next merge window.

Okay.  I can move it to my tree as well, where I assume it'll need to be 
when it comes time to merge.

Thanks-
sage
