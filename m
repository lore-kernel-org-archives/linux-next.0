From: Siarhei Liakh <sliakh.lkml@gmail.com>
Subject: Re: [PATCH 4/4] [tip:x86/mm] RO/NX protection for loadable kernel
	modules
Date: Fri, 2 Apr 2010 14:46:48 -0400
Message-ID: <q2o817ecb6f1004021146r1700f12fxdd6bc66de5ad87bc@mail.gmail.com>
References: <g2g817ecb6f1003311859k505d752pb6f2a5d7a31e392@mail.gmail.com>
	 <20100402170159.GA11611@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <20100402170159.GA11611@elte.hu>
Sender: linux-security-module-owner@vger.kernel.org
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, Arjan van de Ven <arjan@infradead.org>, James Morris <jmorris@namei.org>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@muc.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Rusty Russell <rusty@rustcorp.com.au>, Stephen Rothwell <sfr@canb.auug.org.au>, Dave Jones <davej@redhat.com>
List-Id: linux-next.vger.kernel.org

> just wondering, is the boot crash related to the earlier version of this patch
> fixed in this version? If yes, what was the root cause?

The crash was related to "[PATCH 3/4] [tip:x86/mm] NX protection for
kernel data" and is fixed by "[PATCH 1/4] [tip:x86/mm] Correcting
improper large page preservation".
The root cause was improper large page split handling in
try_preserve_large_page(): in some circumstances it would erroneously
preserve large page and apply incompatible page attributes to the
memory area outside of the original "change attribute" request.
The crash we found was triggered as follows:
1. kernel is mapped with 2M pages
2. two consecutive large pages (let's call them A and B) map .rodata and .data.
3. page A covers .rodata only, while page B contains part of .rodata
at the beginning, followed by .data (aligned to 4K)
4. when set_memory_nx() called for .rodata+.data,
try_preserve_large_page() would properly apply RO+NX to page A, but
then pick attributes from the first small page of large page B (RO+NX)
and use static_protections() to see if the attributes can be applied
to the rest of the region.
5. Since static_protections() does not actually protect .data and
.bss, try_preserve_large_page() would conclude that it is OK to set
new access permissions (RO+NX) to whole large page.
6. since page B contains rw-data, which in turn contains spin locks
used to serialize page table modifications, setting whole page as RO
would cause a page fault exception while trying to acquire/release the
lock.
7. the page fault exception handler itself would try to "fix" the page
fault and generate a double-fault by attempting to acquire the lock.
8. the end result is the double fault and kernel crash.

let me know if you have any further questions.
