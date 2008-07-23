From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 00/12] Thumb-2 kernel support
Date: Wed, 23 Jul 2008 15:10:45 -0700
Message-ID: <20080723151045.bcae107e.akpm@linux-foundation.org>
References: <20080606173300.7930.31525.stgit@pc1117.cambridge.arm.com>
	<20080630125110.1dc5689a.akpm@linux-foundation.org>
	<1214901131.29199.31.camel@pc1117.cambridge.arm.com>
	<20080701014529.272706d8.akpm@linux-foundation.org>
	<1216829155.23395.19.camel@pc1117.cambridge.arm.com>
	<20080723130140.ff016944.akpm@linux-foundation.org>
	<1216847422.6550.8.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:51862 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753353AbYGWWLm (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 23 Jul 2008 18:11:42 -0400
In-Reply-To: <1216847422.6550.8.camel@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.arm.linux.org.uk, linux-next@vger.kernel.org

On Wed, 23 Jul 2008 22:10:22 +0100
Catalin Marinas <catalin.marinas@arm.com> wrote:

> On Wed, 2008-07-23 at 13:01 -0700, Andrew Morton wrote:
> > On Wed, 23 Jul 2008 17:05:55 +0100
> > Catalin Marinas <catalin.marinas@arm.com> wrote:
> > > Were the Thumb-2 patches merged in any of the -mm tree releases? I now
> > > updated the series to the 2.6.26-rc8-mm1 kernel if you still consider
> > > merging them (___git://linux-arm.org/linux-2.6 for-akpm).
> > 
> > I pull it regularly but always get rejects and never got around to
> > looking into fixing them.  Probably the git-thumb tree is based on an
> > ARM git tree so I'd need to generate the diff reletive to that tree. 
> > But I just haven't got onto it, sorry.
> 
> I only based the for-akpm branch on your latest -mm tree release but
> since you are rebasing your tree with every release, the base of my tree
> (currently 2.6.26-rc8-mm1) is probably not an ancestor of your
> development branch, hence the merging errors.
> 
> To minimise the conflicts, what commit or tag id do you base your
> current development branch on?

err, it's not that simple.  I just maintain plain old patches against
linux-next.

Most git trees are based on current Linus mainline.

> > > Russell (and others in the ARM community), are you OK with this set of
> > > patches being merged into 2.6.28 mainline (i.e. at the next merging
> > > window)? If yes, do you acknowledge the patches? In the meantime, I can
> > > rebase them on top of linux-next to check for possible merge conflicts
> > > (or even ask for them to be pulled into linux-next).
> > 
> > yup, we should maintain the tree in linux-next if it's for 2.6.28.
> 
> I'm waiting for Russell to ack the patches first.
> 

Well.  Rather than doing things sequentially we could go parallel. 
Russell could say "I'll look at them before 2.6.28 but please put them
into linux-next meanwhile".
