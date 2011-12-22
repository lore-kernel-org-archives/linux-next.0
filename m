From: Michal Marek <mmarek@suse.cz>
Subject: Re: linux-next: build failure after merge of the final tree (wireless
 tree related)
Date: Thu, 22 Dec 2011 17:57:17 +0100
Message-ID: <4EF3616D.5050506@suse.cz>
References: <20111222165849.df5ea3e2997375de24f1490b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:34963 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751411Ab1LVQzp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 22 Dec 2011 11:55:45 -0500
In-Reply-To: <20111222165849.df5ea3e2997375de24f1490b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>

Dne 22.12.2011 06:58, Stephen Rothwell napsal(a):
> Hi ,
> 
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/net/wireless/ath/ath6kl/cfg80211.c:27:1: error: expected ')' before 'KBUILD_MODNAME'
> drivers/net/wireless/ath/ath6kl/cfg80211.c:27:1: error: 'KBUILD_MODNAME' undeclared here (not in a function)
[...]
> 
> I can't figure out what goes wrong here.  On the compile command line,
> KBUILD_MODNAME is not defined, but KBUILD_BASE_NAME is.

scripts/Makefile.lib says
# Note: It's possible that one object gets potentially linked into more
#       than one module. In that case KBUILD_MODNAME will be set to foo_bar,
#       where foo and bar are the name of the modules.

but reality does not match this comment:
modname_flags  = $(if $(filter 1,$(words $(modname))),\
                 -D"KBUILD_MODNAME=KBUILD_STR($(call name-fix,$(modname)))")

But I wonder why you need to link all the object files twice? Usually,
drivers have a foo_common.ko and foo_{usb,pci,whatever}.ko that provide
the pci/usb/whatever driver.

Michal
