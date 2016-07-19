From: Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: [PATCH/RFC] Re: linux-next: build failure after merge of the
 luto-misc tree
Date: Mon, 18 Jul 2016 21:39:06 -0300
Message-ID: <20160719003906.GJ2207@kernel.org>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:51498 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751990AbcGSAjM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Jul 2016 20:39:12 -0400
Content-Disposition: inline
In-Reply-To: <20160719102629.0a12a1a1@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andy Lutomirski <luto@amacapital.net>, Arnaldo Carvalho de Melo <acme@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Em Tue, Jul 19, 2016 at 10:26:29AM +1000, Stephen Rothwell escreveu:
> On Mon, 18 Jul 2016 20:41:32 -0300 Arnaldo Carvalho de Melo <acme@kernel.org> wrote:
> > Ok, one of the possible reasons was for tools/{include,lib,perf,objtool}
> > code to be including code directly from the kernel, and that was still
> > the case for some headers, I fixed those and pushed to Ingo now, if he
> > pulls lets see if this fixes things.
 
> If you have a single patch (or few) relative to yesterday's tip tree,
> please send it to me as well and I will apply it as a fix patch if Ingo
> doesn't get to pulling in time.

[acme@jouet linux]$ git log --pretty=oneline  9fcfcdf3c7b613c0d9536f57587456411b8a4e33..ae3c14a028ed10552803b68276b6833295ba18cf 
ae3c14a028ed10552803b68276b6833295ba18cf tools: Copy linux/{hash,poison}.h and check for drift
3aa0042769313b720142c0ef8514dac389e14ebe perf tools: Remove include/linux/list.h from perf's MANIFEST
de1e17b1d0c81be472039798698b517c8a68b516 tools: Copy the bitops files accessed from the kernel and check for drift
ad430729ae00dd63f7dcadbeb638e589bc03b5a3 Remove: kernel unistd*h files from perf's MANIFEST, not used
e0643c4e9fdb2e77ab83ca596460e2c9c15728aa perf tools: Remove tools/perf/util/include/linux/const.h
7e3f36411342a54f1981fa97b43550b8406a3d69 perf tools: Remove tools/perf/util/include/asm/byteorder.h
14f0652b4fbebd0b05da36a06b17ac6d4d87a8f8 perf tools: Add missing linux/compiler.h include to perf-sys.h

Available on my repo/branch:

git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git perf/core

I don't know exactly how linux-next works, would it be possible to merge in this branch
till it gets into tip/perf/core?

- Arnaldo
