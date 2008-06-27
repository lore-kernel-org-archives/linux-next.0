From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the block tree
Date: Fri, 27 Jun 2008 10:30:53 +0200
Message-ID: <20080627083053.GC6562@elte.hu>
References: <20080627161347.0af905fb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:54590 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754863AbYF0IbS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 27 Jun 2008 04:31:18 -0400
Content-Disposition: inline
In-Reply-To: <20080627161347.0af905fb.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <jens.axboe@oracle.com>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, the arch/x86 maintainers <x86@kernel.org>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Jens,
> 
> Today's linux-next merge of the block tree got a trivial conflict in 
> include/asm-x86/smp.h between commit 
> a4c81cf684350797939416c99effb9d3ae46bca6 ("x86: extend e820 ealy_res 
> support 32bit") from the x86 tree and commit 
> 3b16cf874861436725c43ba0b68bdd799297be7c ("x86: convert to generic 
> helpers for IPI function calls") from the block tree.
> 
> A case of contextually close deletions.

Jens, would it be possible for you to prepare a pullable branch for us 
for the x86 and generic bits of the SMP generic helpers thing - 
independent of any block tree bits? (it can touch generic code but it 
should not break the build on other architectures)

That way we could pull it into tip/x86 and give it some testing on the 
x86 side, and resolve its integration effects. Would that be possible?

	Ingo
