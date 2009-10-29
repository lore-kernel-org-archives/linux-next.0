From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for October 29 (x86 posttest)
Date: Thu, 29 Oct 2009 09:06:27 -0700
Message-ID: <20091029090627.7857ed08.rdunlap@xenotime.net>
References: <20091029182919.4d6ec52c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.64.118]:55017 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1753221AbZJ2QKk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 29 Oct 2009 12:10:40 -0400
Received: from chimera.site ([96.253.169.185]) by xenotime.net for <linux-next@vger.kernel.org>; Thu, 29 Oct 2009 09:10:43 -0700
In-Reply-To: <20091029182919.4d6ec52c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@redhat.com>

On Thu, 29 Oct 2009 18:29:19 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> [I accidentally deleted my merge log today, so sorry to anyone who
> actually reads them :-), the summary still appears below.]


I'm getting this on x86_64:

  TEST    posttest
Error: ffffffff810299e2:	f2 41 0f 28 52 b0    	repnz movaps -0x50(%r10),%xmm2
Error: objdump says 6 bytes, but insn_get_length() says 4 (attr:0)
make[2]: *** [posttest] Error 2


any ideas?

thanks,
---
~Randy
