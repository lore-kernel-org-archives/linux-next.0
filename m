From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for April 29 (uml build issue)
Date: Fri, 29 Apr 2011 09:10:58 -0700
Message-ID: <20110429091058.d5d9fd54.rdunlap@xenotime.net>
References: <20110429131940.4f4c938f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy5-pub.bluehost.com ([67.222.39.38]:54605 "HELO
	oproxy5-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1757894Ab1D2QLB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 29 Apr 2011 12:11:01 -0400
In-Reply-To: <20110429131940.4f4c938f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kbuiild@vger.kernel.org
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, 29 Apr 2011 13:19:40 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20110428:


My uml builds fail with:

  GEN     linux-next-20110429/UM64/Makefile
scripts/kconfig/conf --silentoldconfig arch/um/Kconfig.x86
  CC      arch/um/sys-x86_64/user-offsets.s
  GEN     linux-next-20110429/UM64/Makefile
linux-next-20110429/scripts/Makefile.asm-generic:9: linux-next-20110429/arch/um/include/asm/Kbuild: No such file or directory
make[2]: *** No rule to make target `linux-next-20110429/arch/um/include/asm/Kbuild'.  Stop.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
