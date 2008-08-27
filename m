From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: linux-next: manual merge of the hid tree
Date: Wed, 27 Aug 2008 12:45:37 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0808271244330.3260@jikos.suse.cz>
References: <20080825144633.393096b5.sfr@canb.auug.org.au> <20080825155056.GA17926@anvil.corenet.prv> <20080826094054.041d8d1d.sfr@canb.auug.org.au> <20080827131017.6b6264a3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from styx.suse.cz ([82.119.242.94]:55814 "EHLO mail.suse.cz"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753556AbYH0Kpj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 27 Aug 2008 06:45:39 -0400
In-Reply-To: <20080827131017.6b6264a3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-next@vger.kernel.org, Henrik Rydberg <rydberg@euromail.se>, Jiri Slaby <jirislaby@gmail.com>

On Wed, 27 Aug 2008, Stephen Rothwell wrote:

> 
> OK, so this has come up again today (the conflict has changed and rerere 
> doesn't cope with that).  Could you please either merge with 2.6.27-rc4 
> or cherrypick commit f89bd95c5c946776f116ffeb997653d4193d6a35 ("Input: 
> bcm5974 - add driver for Macbook Air and Pro Penryn touchpads") (or 
> merge Linus' tree at the commit) into the hid tree (and fix the 
> conflict), please?  This is likely to be a real ongoing pain if this 
> file (drivers/hid/usbhid/hid-quirks.c) keeps being modified in more and 
> more patches.

The branch od hid tree you are pull into -next is now based on 2.6.27-rc4, 
so this should be now sorted out for you. Please let me know if there are 
still some issues for me to deal with.

Thanks,

-- 
Jiri Kosina
SUSE Labs
