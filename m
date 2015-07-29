From: Andrea Arcangeli <aarcange@redhat.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip
 tree
Date: Wed, 29 Jul 2015 19:12:56 +0200
Message-ID: <20150729171256.GA10863@redhat.com>
References: <20150728160015.142f588f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:58823 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750803AbbG2RM7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Jul 2015 13:12:59 -0400
Content-Disposition: inline
In-Reply-To: <20150728160015.142f588f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, Eric B Munson <emunson@akamai.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Hello Stephen,

On Tue, Jul 28, 2015 at 04:00:15PM +1000, Stephen Rothwell wrote:
>  -359	i386	userfaultfd		sys_userfaultfd
> ++374	i386	userfaultfd		sys_userfaultfd

Do I understand correctly the syscall number of userfaultfd for x86
32bit has just changed from 359 to 374? Appreciated that you CCed me
on such a relevant change to be sure I didn't miss it.

Then the below is needed as well.

One related question: is it ok to ship kernels in production right now
with the userfaultfd syscall number 374 for x86 32bit ABI (after the
above change) and 323 for x86-64 64bit ABI, with these syscalls number
registered in linux-next or it may keep changing like it has just
happened? I refer only to userfaultfd syscalls of x86 32bit and x86-64
64bit, not all other syscalls in linux-next.

Of course, I know full well that the standard answer is no, and in
fact the above is an expected and fine change. In other words what I'm
really asking is if I wonder if I could get an agreement here that
from now on, the syscall number of userfaultfd for x86 32bit and
x86-64 64bit won't change anymore in linux-next and it's already
reserved just like if it was already upstream.

Again: I'd only seek such guarantee for the x86-64 64bit and x86 32bit
ABIs (not any other arch, and not any other syscall). If I could get
such a guarantee from you within the next week or two, that would
avoid me complications and some work, so I thought it was worth
asking. If it's not possible never mind.

Thanks,
Andrea

===
>From 873093c32b4b1d0b6c3f18ec1e52b56c24f67457 Mon Sep 17 00:00:00 2001
From: Andrea Arcangeli <aarcange@redhat.com>
Date: Wed, 29 Jul 2015 18:53:17 +0200
Subject: [PATCH] userfaultfd: selftest: update userfaultfd x86 32bit syscall
 number

It changed as result of linux-next merge of other syscalls.

Signed-off-by: Andrea Arcangeli <aarcange@redhat.com>
---
 tools/testing/selftests/vm/userfaultfd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vm/userfaultfd.c b/tools/testing/selftests/vm/userfaultfd.c
index 0c0b839..76071b1 100644
--- a/tools/testing/selftests/vm/userfaultfd.c
+++ b/tools/testing/selftests/vm/userfaultfd.c
@@ -69,7 +69,7 @@
 #ifdef __x86_64__
 #define __NR_userfaultfd 323
 #elif defined(__i386__)
-#define __NR_userfaultfd 359
+#define __NR_userfaultfd 374
 #elif defined(__powewrpc__)
 #define __NR_userfaultfd 364
 #else
