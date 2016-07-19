From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH/RFC] Re: linux-next: build failure after merge of the
 luto-misc tree
Date: Tue, 19 Jul 2016 13:26:08 +1000
Message-ID: <20160719132608.1aa2692a@canb.auug.org.au>
References: <20160715073119.GR30927@twins.programming.kicks-ass.net>
	<20160715150903.GA2523@redhat.com>
	<20160715152436.GB2523@redhat.com>
	<20160715154326.GC2523@redhat.com>
	<20160718151845.4de6e274@canb.auug.org.au>
	<CALCETrWqdi=7hsXTx=WKf-=He-9GP-WNLXppijeZgcoZDCq=bg@mail.gmail.com>
	<20160718203634.GF2207@kernel.org>
	<20160719082235.42aec856@canb.auug.org.au>
	<20160718234132.GI2207@kernel.org>
	<20160719102629.0a12a1a1@canb.auug.org.au>
	<20160719003906.GJ2207@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54987 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752128AbcGSD0L (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Jul 2016 23:26:11 -0400
In-Reply-To: <20160719003906.GJ2207@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>, Arnaldo Carvalho de Melo <acme@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Arnaldo,

On Mon, 18 Jul 2016 21:39:06 -0300 Arnaldo Carvalho de Melo <acme@kernel.org> wrote:
>
> Em Tue, Jul 19, 2016 at 10:26:29AM +1000, Stephen Rothwell escreveu:
>  
> > If you have a single patch (or few) relative to yesterday's tip tree,
> > please send it to me as well and I will apply it as a fix patch if Ingo
> > doesn't get to pulling in time.  
> 
> [acme@jouet linux]$ git log --pretty=oneline  9fcfcdf3c7b613c0d9536f57587456411b8a4e33..ae3c14a028ed10552803b68276b6833295ba18cf 
> ae3c14a028ed10552803b68276b6833295ba18cf tools: Copy linux/{hash,poison}.h and check for drift
> 3aa0042769313b720142c0ef8514dac389e14ebe perf tools: Remove include/linux/list.h from perf's MANIFEST
> de1e17b1d0c81be472039798698b517c8a68b516 tools: Copy the bitops files accessed from the kernel and check for drift
> ad430729ae00dd63f7dcadbeb638e589bc03b5a3 Remove: kernel unistd*h files from perf's MANIFEST, not used
> e0643c4e9fdb2e77ab83ca596460e2c9c15728aa perf tools: Remove tools/perf/util/include/linux/const.h
> 7e3f36411342a54f1981fa97b43550b8406a3d69 perf tools: Remove tools/perf/util/include/asm/byteorder.h
> 14f0652b4fbebd0b05da36a06b17ac6d4d87a8f8 perf tools: Add missing linux/compiler.h include to perf-sys.h
> 
> Available on my repo/branch:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git perf/core
> 
> I don't know exactly how linux-next works, would it be possible to merge in this branch
> till it gets into tip/perf/core?

OK, I added this to linux-next today (as a temporary measure), but it
fails the same way.  To be clear, I merged the above branch (without
the rest of the tip tree) and it fails the same way. :-(

It produces these errors (from the x86_64 allmodconfig build):

In file included from /home/sfr/next/next/tools/arch/x86/include/uapi/asm/bitsperlong.h:10:0,
                 from /usr/include/asm-generic/int-ll64.h:11,
                 from /usr/include/powerpc64le-linux-gnu/asm/types.h:27,
                 from /home/sfr/next/next/tools/include/linux/types.h:9,
                 from /home/sfr/next/next/tools/include/linux/list.h:4,
                 from elf.h:23,
                 from elf.c:30:
/home/sfr/next/next/tools/include/asm-generic/bitsperlong.h:13:2: error: #error Inconsistent word size. Check asm/bitsperlong.h
 #error Inconsistent word size. Check asm/bitsperlong.h
  ^

(and more similar).

I have applied my patch from yesterday ("tools: Simplify
__BITS_PER_LONG define"), and will continue on.

-- 
Cheers,
Stephen Rothwell
