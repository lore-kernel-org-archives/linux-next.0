From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] add iommu_num_pages helper function
Date: Tue, 29 Jul 2008 03:10:05 -0700 (PDT)
Message-ID: <20080729.031005.203132019.davem@davemloft.net>
References: <20080728.222439.176200666.davem@davemloft.net>
	<20080729164523.bfd2d539.sfr@canb.auug.org.au>
	<20080729095027.GA4851@amd.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:47928
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1754653AbYG2KKI (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 29 Jul 2008 06:10:08 -0400
In-Reply-To: <20080729095027.GA4851@amd.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: joerg.roedel@amd.com
Cc: sfr@canb.auug.org.au, fujita.tomonori@lab.ntt.co.jp, mingo@elte.hu, mingo@redhat.com, tglx@linutronix.de, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, bhavna.sarathy@amd.com, robert.richter@amd.com, torvalds@linux-foundation.org, akpm@linux-foundation.org, jbarnes@virtuousgeek.org, linux-next@vger.kernel.org

From: Joerg Roedel <joerg.roedel@amd.com>
Date: Tue, 29 Jul 2008 11:50:27 +0200

> I think moving that function to x86-only code is the best solution for
> now. Before moving it back to generic code we need an architecture
> independent way to find out the IOMMU page size.

My suggestion (again) is to pass it in as a "const unsigned long
io_page_size" argument and update the callers.
