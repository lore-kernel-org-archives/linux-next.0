From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: sparc32 build failure
Date: Wed, 11 Jun 2008 02:36:30 -0700 (PDT)
Message-ID: <20080611.023630.176176702.davem@davemloft.net>
References: <20080611193209.163fa2be.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:37702
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1753625AbYFKJga (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 11 Jun 2008 05:36:30 -0400
In-Reply-To: <20080611193209.163fa2be.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, sam@ravnborg.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 11 Jun 2008 19:32:09 +1000

> Hi Dave, Sam,
> 
> Today's linux-next build (sparc32 defconfig) failed like this:
> 
>   Building modules, stage 2.
> /opt/crosstool/gcc-3.4.5-glibc-2.3.6/sparc64-unknown-linux-gnu/bin/sparc64-unknown-linux-gnu-ld: .tmp_kallsyms2.o: No such file: No such file or directory
> make[2]: *** [arch/sparc/boot/image] Error 1
> 
> I am guessing some kbuild change that sparc32 doesn't like.

Yes, it seems arch/sparc/Makefile needs some updates to match those
recent Kbuild changes which eliminate the second kallsyms pass.
