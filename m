From: Joerg Roedel <joerg.roedel@amd.com>
Subject: Re: linux-next: Tree for September 2
Date: Wed, 3 Sep 2008 09:06:10 +0200
Message-ID: <20080903070610.GA17919@amd.com>
References: <20080902190207.7bcd06dc.sfr@canb.auug.org.au> <20080903093011.a5cc6887.kamezawa.hiroyu@jp.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-wa4.frontbridge.com ([216.32.181.16]:22752 "EHLO
	WA4EHSOBE004.bigfish.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753037AbYICHGU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Sep 2008 03:06:20 -0400
Content-Disposition: inline
In-Reply-To: <20080903093011.a5cc6887.kamezawa.hiroyu@jp.fujitsu.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, mingo@elte.hu

On Wed, Sep 03, 2008 at 09:30:11AM +0900, KAMEZAWA Hiroyuki wrote:
> On Tue, 2 Sep 2008 19:02:07 +1000
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi all,
> > 
> > Changes since next-20080901:
> > 
> > The x86 tree gained a conflict against the dwmw2 tree for which I
> > reverted a commit from the dwmw2 tree.
> > 
> > The sound tree lost its conflict.
> > 
> > The block tree gained a conflict against the device-mapper tree but lost
> > its build fix patch.
> > 
> > The ttydev tree lost a conflict but gained a build fix patch.
> > 
> > I have also applied the following patches for known problems:
> > 
> > 	ftrace: protect the definition of ftrace_release
> > 	revert BUILD_BUG_ON change
> > 	Revert "debug: add notifier chain debugging"
> > 	debug: add notifier chain debugging (different version)
> > 	sparc: qlogicpti fallout from sbus removal
> > 	powerpc: make sure all kernel test is before _etext
> > 
> From patch (not tested yet), it seems dma_alloc_coherent() on x86_64
> is still broken as I reported to August 29's linux-next.
> It easily goes down to swiotlb routine, which uses __GFP_DMA, and show
> "page allocation failure" at boot. Old code used __GFP_DMA32 as much as
> possible, I think.

Hmm, SWIOTLB unconditionally allocates from the DMA zone. Thats bad but
should be easy to change. I prepare a patch.

> Just a notification.

Thanks for pointing that out.

Joerg

-- 
           |           AMD Saxony Limited Liability Company & Co. KG
 Operating |         Wilschdorfer Landstr. 101, 01109 Dresden, Germany
 System    |                  Register Court Dresden: HRA 4896
 Research  |              General Partner authorized to represent:
 Center    |             AMD Saxony LLC (Wilmington, Delaware, US)
           | General Manager of AMD Saxony LLC: Dr. Hans-R. Deppe, Thomas McCoy
