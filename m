From: Joerg Roedel <joerg.roedel@amd.com>
Subject: Re: [PATCH] add iommu_num_pages helper function
Date: Wed, 30 Jul 2008 14:18:05 +0200
Message-ID: <20080730121805.GM4851@amd.com>
References: <20080728.222439.176200666.davem@davemloft.net> <20080729164523.bfd2d539.sfr@canb.auug.org.au> <20080729095027.GA4851@amd.com> <20080729.031005.203132019.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-sin.frontbridge.com ([207.46.51.80]:59530 "EHLO
	SG2EHSOBE003.bigfish.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754623AbYG3MTQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 30 Jul 2008 08:19:16 -0400
Content-Disposition: inline
In-Reply-To: <20080729.031005.203132019.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: sfr@canb.auug.org.au, fujita.tomonori@lab.ntt.co.jp, mingo@elte.hu, mingo@redhat.com, tglx@linutronix.de, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, bhavna.sarathy@amd.com, robert.richter@amd.com, torvalds@linux-foundation.org, akpm@linux-foundation.org, jbarnes@virtuousgeek.org, linux-next@vger.kernel.org

On Tue, Jul 29, 2008 at 03:10:05AM -0700, David Miller wrote:
> From: Joerg Roedel <joerg.roedel@amd.com>
> Date: Tue, 29 Jul 2008 11:50:27 +0200
> 
> > I think moving that function to x86-only code is the best solution for
> > now. Before moving it back to generic code we need an architecture
> > independent way to find out the IOMMU page size.
> 
> My suggestion (again) is to pass it in as a "const unsigned long
> io_page_size" argument and update the callers.

Ok, after setting up cross compile environments for sparc64 and
powerpc64 I wrote a patch which adds the io_page_size argument to the
iommu_num pages function and moves the function back to
lib/iommu-helper.c. The patch touches all 3 architectures and can not be
split in a bisectable way.

Who is the best person to send this patch to?

Joerg

-- 
           |           AMD Saxony Limited Liability Company & Co. KG
 Operating |         Wilschdorfer Landstr. 101, 01109 Dresden, Germany
 System    |                  Register Court Dresden: HRA 4896
 Research  |              General Partner authorized to represent:
 Center    |             AMD Saxony LLC (Wilmington, Delaware, US)
           | General Manager of AMD Saxony LLC: Dr. Hans-R. Deppe, Thomas McCoy
