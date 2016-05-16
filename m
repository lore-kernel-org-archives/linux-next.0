From: Borislav Petkov <bp@suse.de>
Subject: [PATCH] locking/rwsem: Fix comment on register clobbering
Date: Mon, 16 May 2016 11:34:28 +0200
Message-ID: <20160516093428.GA26108@pd.tnic>
References: <57348665.3050301@roeck-us.net>
 <20160512135131.GA7803@pd.tnic>
 <20160512144657.GA14245@pd.tnic>
 <20160512172938.GB14245@pd.tnic>
 <CA+55aFwEruUyTVrR28SL4DQAY3zVEdXw9iKKf6L_S1Z_kHfxow@mail.gmail.com>
 <20160513171915.GG17996@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:56587 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753148AbcEPJej (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 May 2016 05:34:39 -0400
Content-Disposition: inline
In-Reply-To: <20160513171915.GG17996@pd.tnic>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: x86-ml <x86@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Guenter Roeck <linux@roeck-us.net>, Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, May 13, 2016 at 07:19:15PM +0200, Borislav Petkov wrote:
> The only thing that needs to be corrected then is the misleading comm=
ent
> above the 32-bit version "... Save the C-clobbered registers (%eax, %=
edx
> and %ecx) .." - the 64-bit version comment is correct AFAICT.

---
=46rom: Borislav Petkov <bp@suse.de>
Date: Mon, 16 May 2016 11:29:22 +0200
Subject: [PATCH] locking/rwsem: Fix comment on register clobbering

Document explicitly that %edx can get clobbered on the slow path, on
32-bit. Something I learned the hard way. :-\

Signed-off-by: Borislav Petkov <bp@suse.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>
---
 arch/x86/lib/rwsem.S | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/lib/rwsem.S b/arch/x86/lib/rwsem.S
index a37462a23546..bb49caa4dd4c 100644
--- a/arch/x86/lib/rwsem.S
+++ b/arch/x86/lib/rwsem.S
@@ -29,8 +29,10 @@
  * there is contention on the semaphore.
  *
  * %eax contains the semaphore pointer on entry. Save the C-clobbered
- * registers (%eax, %edx and %ecx) except %eax whish is either a retur=
n
- * value or just clobbered..
+ * registers (%eax, %edx and %ecx) except %eax which is either a retur=
n
+ * value or just clobbered. Same is true for %edx so make sure gcc
+ * reloads it after the slow path, by making it hold a temporary, for
+ * example; see ____down_write().
  */
=20
 #define save_common_regs \
--=20
2.7.3

SUSE Linux GmbH, GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Nort=
on, HRB 21284 (AG N=C3=BCrnberg)
--=20
