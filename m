From: Christoph Lameter <cl@linux.com>
Subject: Re: [PATCH] slub: prefetch next freelist pointer in slab_alloc()
Date: Mon, 30 Jan 2012 15:53:51 -0600 (CST)
Message-ID: <alpine.DEB.2.00.1201301549240.3895@router.home>
References: <1324049134.25554.29.camel@edumazet-HP-Compaq-6005-Pro-SFF-PC> <alpine.DEB.2.00.1112161030270.26651@router.home> <alpine.LFD.2.02.1201242152480.1658@tux.localdomain> <CAMuHMdW-RbD-uxpOGmhv0LCsHLG-2Q0LvSRrB0cdM2efGRAYnw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdW-RbD-uxpOGmhv0LCsHLG-2Q0LvSRrB0cdM2efGRAYnw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Pekka Enberg <penberg@kernel.org>, Eric Dumazet <eric.dumazet@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, David Rientjes <rientjes@google.com>, "Alex,Shi" <alex.shi@intel.com>, Shaohua Li <shaohua.li@intel.com>, Matt Mackall <mpm@selenic.com>, Linux-Next <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, 30 Jan 2012, Geert Uytterhoeven wrote:

> On Tue, Jan 24, 2012 at 20:54, Pekka Enberg <penberg@kernel.org> wrote:
> > On Fri, 16 Dec 2011, Eric Dumazet wrote:
> >>> Recycling a page is a problem, since freelist link chain is hot on
> >>> cpu(s) which freed objects, and possibly very cold on cpu currently
> >>> owning slab.
> >
> > On Fri, 16 Dec 2011, Christoph Lameter wrote:
> >> Good idea. How do the tcp benchmarks look after this?
> >>
> >> Looks sane.
> >>
> >> Acked-by: Christoph Lameter <cl@linux.com>
> >
> > Applied, thanks!
>
> m68k/allmodconfig at http://kisskb.ellerman.id.au/kisskb/buildresult/5527349/
>
> mm/slub.c:274: error: implicit declaration of function 'prefetch'
>
> Sorry, didn't notice it earlier due to other build breakage in -next.

Does this fix it?


Subject: slub: include include for prefetch

Otherwise m68k breaks.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Christoph Lameter <cl@linux.com>


---
 mm/slub.c |    1 +
 1 file changed, 1 insertion(+)

Index: linux-2.6/mm/slub.c
===================================================================
--- linux-2.6.orig/mm/slub.c	2012-01-13 10:04:06.000000000 -0600
+++ linux-2.6/mm/slub.c	2012-01-30 15:51:55.000000000 -0600
@@ -29,6 +29,7 @@
 #include <linux/math64.h>
 #include <linux/fault-inject.h>
 #include <linux/stacktrace.h>
+#include <linux/prefetch.h>

 #include <trace/events/kmem.h>
