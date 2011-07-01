From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: linux-next: build failure after merge of the powerpc tree
Date: Fri, 01 Jul 2011 13:00:12 +1000
Message-ID: <1309489212.14501.237.camel@pasglop>
References: <20110701113942.5cfed9a3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:54219 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752518Ab1GADAa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 30 Jun 2011 23:00:30 -0400
In-Reply-To: <20110701113942.5cfed9a3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 2011-07-01 at 11:39 +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the powerpc tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> arch/powerpc/include/asm/setup.h: Assembler messages:
> arch/powerpc/include/asm/setup.h:6: Error: Unrecognized opcode: `extern'
> make[2]: *** [arch/powerpc/kernel/head_64.o] Error 1
> 
> Caused by commit a9c0f41b3a64 ("powerpc: Add printk companion for
> ppc_md.progress").  Clearly not build tested for 64 but powerpc :-(
> 
> I have used the version of the powerpc tree from next-20110630 for today.

Crap !

I had fixed that locally, and ... forgot to commit --amend before
pushing it.

I'll stick a fixup patch right next to it.

Cheers,
Ben.
