From: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Subject: Re: [PATCH] add iommu_num_pages helper function
Date: Tue, 29 Jul 2008 19:27:59 +0900
Message-ID: <20080729192834M.fujita.tomonori@lab.ntt.co.jp>
References: <20080729164523.bfd2d539.sfr@canb.auug.org.au>
	<20080729095027.GA4851@amd.com>
	<20080729.031005.203132019.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from sh.osrg.net ([192.16.179.4]:54350 "EHLO sh.osrg.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752824AbYG2K3O (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 29 Jul 2008 06:29:14 -0400
In-Reply-To: <20080729.031005.203132019.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: davem@davemloft.net
Cc: joerg.roedel@amd.com, sfr@canb.auug.org.au, fujita.tomonori@lab.ntt.co.jp, mingo@elte.hu, mingo@redhat.com, tglx@linutronix.de, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, bhavna.sarathy@amd.com, robert.richter@amd.com, torvalds@linux-foundation.org, akpm@linux-foundation.org, jbarnes@virtuousgeek.org, linux-next@vger.kernel.org

On Tue, 29 Jul 2008 03:10:05 -0700 (PDT)
David Miller <davem@davemloft.net> wrote:

> From: Joerg Roedel <joerg.roedel@amd.com>
> Date: Tue, 29 Jul 2008 11:50:27 +0200
> 
> > I think moving that function to x86-only code is the best solution for
> > now. Before moving it back to generic code we need an architecture
> > independent way to find out the IOMMU page size.
> 
> My suggestion (again) is to pass it in as a "const unsigned long
> io_page_size" argument and update the callers.

Either is fine by me.

Joerg, if you like, please finish this (for all the architectures,
please). As I said before, I planed to work on this cleanup after rc1
(and this should have been 2.6.28 stuff). But I'd appreciate if you
would do.

Thanks,
