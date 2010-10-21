From: Christoph Hellwig <hch@infradead.org>
Subject: Re: linux-next: Tree for October 20
Date: Thu, 21 Oct 2010 09:09:25 -0400
Message-ID: <20101021130925.GA32548@infradead.org>
References: <20101020162053.5595e1bf.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:39465 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754318Ab0JUNJ1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 21 Oct 2010 09:09:27 -0400
Content-Disposition: inline
In-Reply-To: <20101020162053.5595e1bf.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, mmarek@suse.cz

I can't even get the required userspace code make oldconfig to compile:

hch@brick:~/work/linux-2.6/obj-kvm$ make oldconfig
make -C /home/hch/work/linux-2.6 O=/home/hch/work/linux-2.6/obj-kvm/. oldconfig
  GEN     /home/hch/work/linux-2.6/obj-kvm/Makefile
  HOSTCC  scripts/kconfig/zconf.tab.o
In file included from scripts/kconfig/zconf.tab.c:2481:
scripts/kconfig/lex.zconf.c:2425: error: conflicting types for 'zconf_curname'
/home/hch/work/linux-2.6/scripts/kconfig/lkc.h:79: note: previous declaration of 'zconf_curname' was here
scripts/kconfig/lex.zconf.c: In function 'zconf_curname':
scripts/kconfig/lex.zconf.c:2427: warning: return discards qualifiers from pointer target type

I'm compiling on 32-bit x86, using:

gcc version 4.4.5 20100728 (prerelease) (Debian 4.4.4-8) 
