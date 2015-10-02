From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Date: Fri, 2 Oct 2015 14:21:03 +1000
Message-ID: <20151002142103.6f3d64a8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53537 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750709AbbJBEVH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 2 Oct 2015 00:21:07 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got conflicts in:

  Documentation/filesystems/proc.txt
  fs/proc/array.c
  fs/proc/base.c

between commit:

  b2f73922d119 ("fs/proc, core/debug: Don't expose absolute kernel addresses via wchan")

from the tip tree and commit:

  f01df89b6372 ("fs/proc: don't expose absolute kernel addresses via wchan")
  7adc347341f1 ("fs-proc-dont-expose-absolute-kernel-addresses-via-wchan-fix")

from the akpm-current tree.

I fixed it up (the tip tree version seemed newer, so I used that) and
can carry the fix as necessary (no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
