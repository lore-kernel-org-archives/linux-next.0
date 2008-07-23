From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 00/12] Thumb-2 kernel support
Date: Wed, 23 Jul 2008 13:01:40 -0700
Message-ID: <20080723130140.ff016944.akpm@linux-foundation.org>
References: <20080606173300.7930.31525.stgit@pc1117.cambridge.arm.com>
	<20080630125110.1dc5689a.akpm@linux-foundation.org>
	<1214901131.29199.31.camel@pc1117.cambridge.arm.com>
	<20080701014529.272706d8.akpm@linux-foundation.org>
	<1216829155.23395.19.camel@pc1117.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:48808 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754209AbYGWUCQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 23 Jul 2008 16:02:16 -0400
In-Reply-To: <1216829155.23395.19.camel@pc1117.cambridge.arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.arm.linux.org.uk, linux-next@vger.kernel.org

On Wed, 23 Jul 2008 17:05:55 +0100
Catalin Marinas <catalin.marinas@arm.com> wrote:

> Hi Andrew,
> 
> On Tue, 2008-07-01 at 01:45 -0700, Andrew Morton wrote:
> > On Tue, 01 Jul 2008 09:32:11 +0100 Catalin Marinas <catalin.marinas@arm.com> wrote:
> > 
> > > On Mon, 2008-06-30 at 12:51 -0700, Andrew Morton wrote:
> > > > On Fri, 06 Jun 2008 18:33:00 +0100
> > > > Catalin Marinas <catalin.marinas@arm.com> wrote:
> > > > 
> > > > > This series of patches allows the kernel to be compiled to Thumb-2 mode
> > > > > (on ARMv7 CPUs). The patches have been posted a few times on the list
> > > > > and the comments were implemented (hopefully I haven't missed any).
> > > > > 
> > > > > If/when there are no more comments, I'd like the series to be merged
> > > > > into the -mm tree if Andrew agrees. It was tested and generated against
> > > > > the 2.6.26-rc2-mm1 kernel.
> > > [...]
> > > > OK, I added this tree to -mm.  Nobody is likely to test or review it
> > > > there, but at least I might pick up on any merge or build issues.
> 
> Were the Thumb-2 patches merged in any of the -mm tree releases? I now
> updated the series to the 2.6.26-rc8-mm1 kernel if you still consider
> merging them (___git://linux-arm.org/linux-2.6 for-akpm).

I pull it regularly but always get rejects and never got around to
looking into fixing them.  Probably the git-thumb tree is based on an
ARM git tree so I'd need to generate the diff reletive to that tree. 
But I just haven't got onto it, sorry.

> > > > If you're hankering for a 2.6.27 merge of this material it might be
> > > > more appropriate to add it to linux-next.
> > > 
> > > I aim for the ___post 2.6.27 merge window (i.e. patches available in
> > > 2.6.28).
> > 
> > OK, then in that case it shouldn't go into linux-next until around
> > 2.6.27-rc1 time.
> 
> Russell (and others in the ARM community), are you OK with this set of
> patches being merged into 2.6.28 mainline (i.e. at the next merging
> window)? If yes, do you acknowledge the patches? In the meantime, I can
> rebase them on top of linux-next to check for possible merge conflicts
> (or even ask for them to be pulled into linux-next).

yup, we should maintain the tree in linux-next if it's for 2.6.28.
