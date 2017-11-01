From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the s390 tree
Date: Wed, 1 Nov 2017 17:04:13 +1100
Message-ID: <20171101170413.7d06a1c1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43009 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750973AbdKAGEP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 1 Nov 2017 02:04:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/s390/lib/spinlock.c

between commit:

  eb3b7b848fb3 ("s390/rwlock: introduce rwlock wait queueing")
(at least)

from the s390 tree and commit:

  6aa7de059173 ("locking/atomics: COCCINELLE/treewide: Convert trivial ACCESS_ONCE() patterns to READ_ONCE()/WRITE_ONCE()")

from the tip tree.

I fixed it up (the ACCESS_ONCE instances replaced in the latter were
removed by the former ... there was one more ACCESS_ONCE added, but I
left it in place) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.



-- 
Cheers,
Stephen Rothwell
