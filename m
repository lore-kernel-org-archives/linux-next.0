From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip
 tree
Date: Tue, 8 Sep 2015 09:35:24 +1000
Message-ID: <20150908093524.507a19d8@canb.auug.org.au>
References: <20150728160015.142f588f@canb.auug.org.au>
	<20150729171256.GA10863@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60296 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751135AbbIGXfZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Sep 2015 19:35:25 -0400
In-Reply-To: <20150729171256.GA10863@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus <torvalds@linux-foundation.org>
Cc: Andrea Arcangeli <aarcange@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, Eric B Munson <emunson@akamai.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Hi Linus,

On Wed, 29 Jul 2015 19:12:56 +0200 Andrea Arcangeli <aarcange@redhat.com> wrote:
>
> On Tue, Jul 28, 2015 at 04:00:15PM +1000, Stephen Rothwell wrote:
> >  -359	i386	userfaultfd		sys_userfaultfd
> > ++374	i386	userfaultfd		sys_userfaultfd
> 
> Do I understand correctly the syscall number of userfaultfd for x86
> 32bit has just changed from 359 to 374? Appreciated that you CCed me
> on such a relevant change to be sure I didn't miss it.
> 
> Then the below is needed as well.

The below patch was missed when the userfaultfd stuff and the x86 changes
were merged.  I have repeated the patch in the clear below.

From: Andrea Arcangeli <aarcange@redhat.com>
Date: Wed, 29 Jul 2015 18:53:17 +0200
Subject: [PATCH] userfaultfd: selftest: update userfaultfd x86 32bit syscall number

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

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
