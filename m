From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the crypto tree
Date: Wed, 8 Nov 2017 13:21:56 +1100
Message-ID: <20171108132156.701f77fe@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46773 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752251AbdKHCV6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 7 Nov 2017 21:21:58 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Boris BREZILLON <boris.brezillon@free-electrons.com>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/crypto/mv_cesa.c

between commit:

  27b43fd95b14 ("crypto: marvell - Remove the old mv_cesa driver")

from the crypto tree and commit:

  f34d8d506eef ("crypto: Convert timers to use timer_setup()")

from the tip tree.

I fixed it up (I removed the file again) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
