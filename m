From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the asm-generic tree with Linus' tree
Date: Fri, 12 Jun 2009 10:05:32 +0200
Message-ID: <200906121005.33490.arnd@arndb.de>
References: <20090612164914.e03160af.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:65386 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752917AbZFLIFr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 12 Jun 2009 04:05:47 -0400
In-Reply-To: <20090612164914.e03160af.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Ingo Molnar <mingo@elte.hu>

On Friday 12 June 2009, Stephen Rothwell wrote:
> Today's linux-next merge of the asm-generic tree got a conflict in
> include/asm-generic/atomic.h between commit
> 53e111a730ea8b002d57dd226098c12789993329 ("x86: Fix atomic_long_xchg() on
> 64bit") from Linus' tree and commit
> 72099ed2719fc5829bd79c6ca9d1783ed026eb37 ("asm-generic: rename atomic.h
> to atomic-long.h") from the asm-generic tree.
> 
> I applied the fix from the former patch to atomic-long.h

Hi Stephen,

I pulled Linus' tree into the asm-generic tree now and fixed the two conflicts
in the same way you did. I thought about doing a rebase on his tree instead,
but wasn't sure what works better.

	Arnd <><
