From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for May 7 (argh)
Date: Wed, 07 May 2014 13:52:02 -0700
Message-ID: <536A9CF2.90906@infradead.org>
References: <20140507173341.753d8ccf4fe033abd513f98f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:52950 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751420AbaEGUwF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 7 May 2014 16:52:05 -0400
In-Reply-To: <20140507173341.753d8ccf4fe033abd513f98f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

On 05/07/2014 12:33 AM, Stephen Rothwell wrote:
> Hi all,
> 
> This tree still fails (more than usual) the powerpc allyesconfig build
> and also the celleb_defconfig.
> 
> Changes since 20140506:
> 

I was away for one week.  Did I miss some new instructions about
building linux-next?

I get a thousands of messages like these:

WARNING: "system_wq" [drivers/misc/bh1770glc.ko] has no CRC!
WARNING: "__wake_up" [drivers/misc/bh1770glc.ko] has no CRC!
WARNING: "sysfs_notify" [drivers/misc/bh1770glc.ko] has no CRC!
WARNING: "kfree" [drivers/misc/bh1770glc.ko] has no CRC!


Also there hundreds of messages like these:

ps2mult.c:(.exit.text+0x8f): multiple definition of `cleanup_module'
ps2mult.c:(.init.text+0xbc8): multiple definition of `init_module'
ipack.c:(.exit.text+0x0): multiple definition of `cleanup_module'
ipack.c:(.init.text+0x0): multiple definition of `init_module'
mcb-core.c:(.text+0x40d): multiple definition of `cleanup_module'
mcb-core.c:(.text+0x3fb): multiple definition of `init_module'



Thanks!
-- 
~Randy
