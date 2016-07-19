From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH/RFC] Re: linux-next: build failure after merge of the
 luto-misc tree
Date: Wed, 20 Jul 2016 09:53:33 +1000
Message-ID: <20160720095333.3034531c@canb.auug.org.au>
References: <20160715154326.GC2523@redhat.com>
	<20160718151845.4de6e274@canb.auug.org.au>
	<CALCETrWqdi=7hsXTx=WKf-=He-9GP-WNLXppijeZgcoZDCq=bg@mail.gmail.com>
	<20160718203634.GF2207@kernel.org>
	<20160719082235.42aec856@canb.auug.org.au>
	<20160718234132.GI2207@kernel.org>
	<20160719102629.0a12a1a1@canb.auug.org.au>
	<20160719003906.GJ2207@kernel.org>
	<20160719132608.1aa2692a@canb.auug.org.au>
	<20160719125443.GL2207@kernel.org>
	<20160719174551.GM2207@kernel.org>
	<20160720092157.7cd8de65@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59332 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752033AbcGSXxg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 19 Jul 2016 19:53:36 -0400
In-Reply-To: <20160720092157.7cd8de65@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, Andy Lutomirski <luto@amacapital.net>, Arnaldo Carvalho de Melo <acme@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Arnaldo,

On Wed, 20 Jul 2016 09:21:57 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> On Tue, 19 Jul 2016 14:45:51 -0300 Arnaldo Carvalho de Melo <acme@kernel.org> wrote:
> >
> > No such luck, everything works as expected, objtool doesn't even get
> > compiled, likely it doesn't support powerpc binaries so it isn't built:  
> 
> right.
> 
> > Probably it got the local definition of bitsperlong.h, i.e. the size on the host build
> > and then comparing it against the one for the target host...
> > 
> > Anyway, can you try the patch below to see what value is landing on __BITS_PER_LONG?
> > 
> > diff --git a/tools/include/asm-generic/bitsperlong.h b/tools/include/asm-generic/bitsperlong.h
> > index 45eca517efb3..c8f971e0d6a1 100644
> > --- a/tools/include/asm-generic/bitsperlong.h
> > +++ b/tools/include/asm-generic/bitsperlong.h
> > @@ -10,6 +10,9 @@
> >  #endif
> >  
> >  #if BITS_PER_LONG != __BITS_PER_LONG
> > +#include <linux/stringify.h>
> > +#pragma message "BITS_PER_LONG=" __stringify(BITS_PER_LONG)
> > +#pragma message "__BITS_PER_LONG=" __stringify(__BITS_PER_LONG)
> >  #error Inconsistent word size. Check asm/bitsperlong.h
> >  #endif  
> 
> I added those three lines to the file (just in yesterday's linux-next
> was easiest) and got this:
> 
> /home/sfr/next/next/tools/include/asm-generic/bitsperlong.h:14:9: note: #pragma message: BITS_PER_LONG=(8 * 8)
>  #pragma message "BITS_PER_LONG=" __stringify(BITS_PER_LONG)
>          ^
> /home/sfr/next/next/tools/include/asm-generic/bitsperlong.h:15:9: note: #pragma message: __BITS_PER_LONG=32
>  #pragma message "__BITS_PER_LONG=" __stringify(__BITS_PER_LONG)
>          ^
> 
> (a few times, of course)

So I applied this:

diff --git a/tools/arch/x86/include/uapi/asm/bitsperlong.h b/tools/arch/x86/include/uapi/asm/bitsperlong.h
index 6e23c543cd80..fd299f5468cb 100644
--- a/tools/arch/x86/include/uapi/asm/bitsperlong.h
+++ b/tools/arch/x86/include/uapi/asm/bitsperlong.h
@@ -4,6 +4,12 @@
 #if defined(__x86_64__) && !defined(__ILP32__)
 # define __BITS_PER_LONG 64
 #else
+#ifndef __x86_64__
+#pragma message "__x86_64__ is not defined"
+#endif
+#ifdef __ILP32__
+#pragma message "__ILP32__ is defined"
+#endif
 # define __BITS_PER_LONG 32
 #endif

and got this:

/home/sfr/next/next/tools/arch/x86/include/uapi/asm/bitsperlong.h:8:9: note: #pragma message: __x86_64__ is not defined
 #pragma message "__x86_64__ is not defined"

-- 
Cheers,
Stephen Rothwell
