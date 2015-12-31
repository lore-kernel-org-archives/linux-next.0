From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vhost tree with the tip tree
Date: Thu, 31 Dec 2015 20:23:47 +1100
Message-ID: <20151231202347.3090c74b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55673 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750954AbbLaJXu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 31 Dec 2015 04:23:50 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Davidlohr Bueso <dave@stgolabs.net>

Hi Michael,

Today's linux-next merge of the vhost tree got conflicts in:

  arch/ia64/include/asm/barrier.h
  arch/powerpc/include/asm/barrier.h
  arch/s390/include/asm/barrier.h
  include/asm-generic/barrier.h

between commit:

  d5a73cadf3fd ("lcoking/barriers, arch: Use smp barriers in smp_store_release()")

from the tip tree and commit:

  2683de3a1732 ("ia64: reuse asm-generic/barrier.h")
  d78113bef3e0 ("powerpc: reuse asm-generic/barrier.h")
  25bc870c914b ("s390: reuse asm-generic/barrier.h")
  24888a057e97 ("asm-generic: add __smp_XXX wrappers")

from the vhost tree.

I fixed it up (in each case taking the vhost tree version) and can
carry the fix as necessary (no action is required).

However, given the ongoing review and discussion, I do wonder if these
vhost tree commits should be in linux-next yet.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
