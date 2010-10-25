From: Michal Marek <mmarek@suse.cz>
Subject: Re: linux-next: Tree for October 20
Date: Mon, 25 Oct 2010 10:47:51 +0200
Message-ID: <4CC54437.8050607@suse.cz>
References: <20101020162053.5595e1bf.sfr@canb.auug.org.au> <20101021130925.GA32548@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:49346 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753898Ab0JYIru (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Oct 2010 04:47:50 -0400
In-Reply-To: <20101021130925.GA32548@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 21.10.2010 15:09, Christoph Hellwig wrote:
> I can't even get the required userspace code make oldconfig to compile:
> 
> hch@brick:~/work/linux-2.6/obj-kvm$ make oldconfig
> make -C /home/hch/work/linux-2.6 O=/home/hch/work/linux-2.6/obj-kvm/. oldconfig
>   GEN     /home/hch/work/linux-2.6/obj-kvm/Makefile
>   HOSTCC  scripts/kconfig/zconf.tab.o
> In file included from scripts/kconfig/zconf.tab.c:2481:
> scripts/kconfig/lex.zconf.c:2425: error: conflicting types for 'zconf_curname'
> /home/hch/work/linux-2.6/scripts/kconfig/lkc.h:79: note: previous declaration of 'zconf_curname' was here
> scripts/kconfig/lex.zconf.c: In function 'zconf_curname':
> scripts/kconfig/lex.zconf.c:2427: warning: return discards qualifiers from pointer target type

The zconf_curname() prototype was changed in 2e7a091 and the
scripts/kconfig/lex.zconf.c_shipped file was updated as well. What
probably happened is that you ended up using an updated
scripts/kconfig/lkc.h header versus an old version of
scripts/kconfig/lex.zconf.c. Ie. the rule that copies
scripts/kconfig/lex.zconf.c_shipped to scripts/kconfig/lex.zconf.c did
not trigger, very strange. I'll look further.

Michal
