From: Jan Kara <jack@suse.cz>
Subject: Re: linux-next: build failure after merge of the final tree (akpm
 tree related)
Date: Mon, 4 Mar 2013 10:22:44 +0100
Message-ID: <20130304092244.GB17223@quack.suse.cz>
References: <20130304142821.b61bd9800c4ea35331829a79@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:60801 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756130Ab3CDJWq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 4 Mar 2013 04:22:46 -0500
Content-Disposition: inline
In-Reply-To: <20130304142821.b61bd9800c4ea35331829a79@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kara <jack@suse.cz>

On Mon 04-03-13 14:28:21, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the final tree, today's linux-next build (arm defconfig)
> failed like this:
> 
> kernel/built-in.o: In function `console_unlock':
> cpu_pm.c:(.text+0x4418): undefined reference to `__bad_udelay'
> 
> Caused by commit 4df7323a125f ("printk: avoid softlockups in
> console_unlock()") which added
> 
> 	ndelay(max_interrupt_disabled_duration() / 2);
> 
> to console_unlock() which can be a 2.5 second delay ... and the maximum
> delayed allowed by udelay (at least in this build) is 2ms.
  Bah, one always learns. Didn't know there's some max limit on ndelay().
I'll replace that with a while loop or something like that. Thanks for
report!

								Honza
-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
