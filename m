From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for October 29 (x86 posttest)
Date: Fri, 6 Nov 2009 08:59:54 -0800
Message-ID: <20091106085954.39eb2789.rdunlap@xenotime.net>
References: <20091029182919.4d6ec52c.sfr@canb.auug.org.au>
	<20091029090627.7857ed08.rdunlap@xenotime.net>
	<4AE9C74C.2040309@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.64.118]:56740 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1751931AbZKFQ7w (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 Nov 2009 11:59:52 -0500
Received: from chimera.site ([96.253.169.185]) by xenotime.net for <linux-next@vger.kernel.org>; Fri, 6 Nov 2009 08:59:55 -0800
In-Reply-To: <4AE9C74C.2040309@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Masami Hiramatsu <mhiramat@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, 29 Oct 2009 12:48:12 -0400 Masami Hiramatsu wrote:

> Randy Dunlap wrote:
> > On Thu, 29 Oct 2009 18:29:19 +1100 Stephen Rothwell wrote:
> >
> >> Hi all,
> >>
> >> [I accidentally deleted my merge log today, so sorry to anyone who
> >> actually reads them :-), the summary still appears below.]
> >
> >
> > I'm getting this on x86_64:
> >
> >    TEST    posttest
> > Error: ffffffff810299e2:	f2 41 0f 28 52 b0    	repnz movaps -0x50(%r10),%xmm2
> > Error: objdump says 6 bytes, but insn_get_length() says 4 (attr:0)
> > make[2]: *** [posttest] Error 2
> 
> Ah, that's should be fixed by AVX support patch which I've posted.
> http://git.kernel.org/tip/e0e492e99b372c6990a5daca9e4683c341f1330e

Has that been merged into linux-next?
I'm still seeing this failure in linux-next-20091106.


---
~Randy
