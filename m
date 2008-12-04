From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: linux-next: sparc tree build failure
Date: Thu, 4 Dec 2008 12:47:10 +0100
Message-ID: <20081204114710.GA15044@uranus.ravnborg.org>
References: <20081204195424.1cbd42a7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:39895 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751897AbYLDLpq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Dec 2008 06:45:46 -0500
Content-Disposition: inline
In-Reply-To: <20081204195424.1cbd42a7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "David S. Miller" <davem@davemloft.net>, linux-next@vger.kernel.org

On Thu, Dec 04, 2008 at 07:54:24PM +1100, Stephen Rothwell wrote:
> Hi Dave,
> 
> Today's linux-next build (sparc64 defconfig) failed like this:
> 
>   HOSTCC  scripts/basic/fixdep
>   HOSTCC  scripts/basic/docproc
>   HOSTCC  scripts/basic/hash
>   GEN     /scratch/sfr/sparc64_defconfig/Makefile
>   HOSTCC  scripts/kconfig/conf.o
>   HOSTCC  scripts/kconfig/kxgettext.o
>   SHIPPED scripts/kconfig/zconf.tab.c
>   SHIPPED scripts/kconfig/lex.zconf.c
>   SHIPPED scripts/kconfig/zconf.hash.c
>   HOSTCC  scripts/kconfig/zconf.tab.o
>   HOSTLD  scripts/kconfig/conf
> *** Default configuration is based on 'sparc64_defconfig'
> ***
> *** Can't find default configuration "arch/sparc/configs/sparc64_defconfig"!
> ***
> 
> Caused, I suspect by commit 60f2e8ffcf7291fc7df05dd91caf84d75c5181c5
> ("sparc,sparc64: unify Makefile") which I reverted (along with
> commit 9251dc5153ee5dae27e81835a35f3b7c0a73259e "sparc,sparc64: unify
> prom/" which depended on it).

The defconfig files got lost - you will see same issue with sparc(32).
The easy fix is to add them again from an older tree.

The are named sparc32_defconfig and sparc64_defconfig

This has no bisect impact as only "make defconfig" is faulty
so no need to consider renasing the tree.

	Sam
