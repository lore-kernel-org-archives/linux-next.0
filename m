From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the block tree
Date: Wed, 1 Nov 2017 17:10:07 +1100
Message-ID: <20171101171007.6a340098@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50603 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750808AbdKAGKJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 1 Nov 2017 02:10:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/block/amiflop.c

between commit:

  f37ecbfc238b ("amifloppy: Convert timers to use timer_setup()")

from the block tree and commit:

  3c557df67257 ("timer: Remove meaningless .data/.function assignments")

from the tip tree.

I fixed it up (I just used the former version of the motor_on_callback
definition) and can carry the fix as necessary. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
