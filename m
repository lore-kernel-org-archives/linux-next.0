From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the x86 tree
Date: Sun, 14 Sep 2008 17:18:07 +0200
Message-ID: <20080914151807.GB29290@elte.hu>
References: <20080912093443.2f226fe7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:42496 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752799AbYINPSa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 14 Sep 2008 11:18:30 -0400
Content-Disposition: inline
In-Reply-To: <20080912093443.2f226fe7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Daniel J Blueman <daniel.blueman@gmail.com>, FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the x86 tree got a conflict in 
> lib/swiotlb.c between commit 36223a399f639b13b7a454349565934e6d3e2db0 
> ("swiotlb: fix back-off path when memory allocation fails") from 
> Linus' tree and commit 9dfda12b8b769e224ca4efbc35ace4524b9c017b 
> ("swiotlb: use map_single instead of swiotlb_map_single in 
> swiotlb_alloc_coherent") from the x86 tree.
> 
> It looks like the bug fixed by the former is also fixed in the latter, so
> I used the latter version.

right, that's the correct resolution - as there are more changes in the 
latter that are needed. Should also be resolved in today's 
tip/auto-x86-next. Thanks Stephen,

	Ingo
