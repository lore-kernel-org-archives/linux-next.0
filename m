From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] add iommu_num_pages helper function
Date: Tue, 29 Jul 2008 03:33:42 -0700 (PDT)
Message-ID: <20080729.033342.21049184.davem@davemloft.net>
References: <20080729.031005.203132019.davem@davemloft.net>
	<20080729192834M.fujita.tomonori@lab.ntt.co.jp>
	<20080729103146.GA32407@elte.hu>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:47552
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1754729AbYG2Kdp (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 29 Jul 2008 06:33:45 -0400
In-Reply-To: <20080729103146.GA32407@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: mingo@elte.hu
Cc: fujita.tomonori@lab.ntt.co.jp, joerg.roedel@amd.com, sfr@canb.auug.org.au, mingo@redhat.com, tglx@linutronix.de, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, bhavna.sarathy@amd.com, robert.richter@amd.com, torvalds@linux-foundation.org, akpm@linux-foundation.org, jbarnes@virtuousgeek.org, linux-next@vger.kernel.org

From: Ingo Molnar <mingo@elte.hu>
Date: Tue, 29 Jul 2008 12:31:46 +0200

> i've queued up your quick fix in tip/x86/urgent to resolve the immediate 
> -git build breakage. The wider patch can then be done on top of that, 
> without being rushed. Any objections to this approach?

I do not object :-)
