From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH] add iommu_num_pages helper function
Date: Thu, 31 Jul 2008 08:44:32 +1000
Message-ID: <1217457872.11188.350.camel@pasglop>
References: <20080728.222439.176200666.davem@davemloft.net>
	 <20080729164523.bfd2d539.sfr@canb.auug.org.au>
	 <20080729095027.GA4851@amd.com>
	 <20080729.031005.203132019.davem@davemloft.net>
Reply-To: benh@kernel.crashing.org
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:53759 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752234AbYG3Wp2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 30 Jul 2008 18:45:28 -0400
In-Reply-To: <20080729.031005.203132019.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: joerg.roedel@amd.com, sfr@canb.auug.org.au, fujita.tomonori@lab.ntt.co.jp, mingo@elte.hu, mingo@redhat.com, tglx@linutronix.de, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, bhavna.sarathy@amd.com, robert.richter@amd.com, torvalds@linux-foundation.org, akpm@linux-foundation.org, jbarnes@virtuousgeek.org, linux-next@vger.kernel.org

On Tue, 2008-07-29 at 03:10 -0700, David Miller wrote:
> From: Joerg Roedel <joerg.roedel@amd.com>
> Date: Tue, 29 Jul 2008 11:50:27 +0200
> 
> > I think moving that function to x86-only code is the best solution for
> > now. Before moving it back to generic code we need an architecture
> > independent way to find out the IOMMU page size.
> 
> My suggestion (again) is to pass it in as a "const unsigned long
> io_page_size" argument and update the callers.

Yeah. That's better

Ben.
