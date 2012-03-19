From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Mar 19 (uml)
Date: Mon, 19 Mar 2012 08:01:01 -0700
Message-ID: <4F674A2D.5080504@xenotime.net>
References: <20120319184830.fce597a16eaf7206195a7a45@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy1-pub.bluehost.com ([66.147.249.253]:60655 "HELO
	oproxy1-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1030563Ab2CSPBC (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 19 Mar 2012 11:01:02 -0400
In-Reply-To: <20120319184830.fce597a16eaf7206195a7a45@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Richard Weinberger <richard@nod.at>

On 03/19/2012 12:48 AM, Stephen Rothwell wrote:

> Hi all,
> 
> News: the build system (see below) has had some more architectures
> enabled.  Thanks to Tony Breeds for his efforts in providing toolchains.
> 
> Changes since 20120315:



on x86_64:

  CC      arch/um/kernel/asm-offsets.s
In file included from include/linux/mm_types.h:16:0,
                 from include/linux/sched.h:64,
                 from arch/x86/um/shared/sysdep/kernel-offsets.h:2,
                 from arch/um/kernel/asm-offsets.c:1:
arch/um/include/asm/mmu.h:15:14: error: array type has incomplete element type
make[2]: *** [arch/um/kernel/asm-offsets.s] Error 1



> -- 

~Randy
