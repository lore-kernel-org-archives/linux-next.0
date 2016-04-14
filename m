From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Thu, 14 Apr 2016 22:55:47 +1000
Message-ID: <1460638547.21066.1.camel@ellerman.id.au>
References: <20160414121418.288bd117@canb.auug.org.au>
	 <20160414123552.GD2439@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42811 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753427AbcDNMz5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 14 Apr 2016 08:55:57 -0400
In-Reply-To: <20160414123552.GD2439@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnaldo Carvalho de Melo <acme@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 2016-04-14 at 09:35 -0300, Arnaldo Carvalho de Melo wrote:
> Em Thu, Apr 14, 2016 at 12:14:18PM +1000, Stephen Rothwell escreveu:
> > Hi all,
> > 
> > After merging the tip tree, today's linux-next build (powerpc64le perf)
> > failed like this:
> > 
> > make[3]: *** No rule to make target '/home/sfr/next/perf/arch/x86/include/generated/asm/syscalls_64.c', needed by '/home/sfr/next/perf/util/syscalltbl.o'.  Stop.
> > 
> > (I build in /home/sfr/next/next with objects in /home/sfr/next/perf.)
> 
> I'll check, should've been caught by a cross compiler build for ppc64le
> I have in place :-\
> 
> minimal-ubuntu-x-ppc64el: Ok
> 
> But maybe not, as this requires audit-libs-devel and that is not present
> on that minimal ubuntu x-compiler setup, sigh :-\

Hi acme,

I have a jenkins which builds perf on ppc64le, but it only builds Linus' tree
and linux-next.

Which branch in your tree should I be building in order to catch problems like
this, perf/core ?

https://git.kernel.org/cgit/linux/kernel/git/acme/linux.git/log/?h=perf/core

cheers
