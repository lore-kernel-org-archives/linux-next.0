From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: sparc tree build failure
Date: Wed, 08 Apr 2009 22:28:10 -0700 (PDT)
Message-ID: <20090408.222810.162711074.davem@davemloft.net>
References: <20090409151722.c8eabb56.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:46854
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1754373AbZDIF2U (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 9 Apr 2009 01:28:20 -0400
In-Reply-To: <20090409151722.c8eabb56.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: tglx@linutronix.de, mingo@elte.hu, hpa@zytor.com, linux-next@vger.kernel.org, dvhltc@us.ibm.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 9 Apr 2009 15:17:22 +1000

> Dave, this might be a good time to suggest that sparc64 create its TI_
> offsets automatically via asm-offsets ...

I want to know the exact offsets for cache layout reasons,
at the very least.  And there are other more important reasons
to check this stuff out by hand and don't let it compile
automatically.

Anything that changes the layout and size of members in struct
thread_info should be scrutinized carefully by every arch maintainer.

There are other implications for these kinds of changes, for example
this decreases the amount of space we have to save our recursive
kernel/user FPU state on sparc64.

I don't want any of this to be automated at all.
