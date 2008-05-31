From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: linux-next: m68k/semaphore build failure
Date: Sat, 31 May 2008 11:20:59 -0600
Message-ID: <20080531172059.GF28074@parisc-linux.org>
References: <20080527201038.d70e23d6.sfr@canb.auug.org.au> <Pine.LNX.4.64.0805271809520.4081@anakin> <20080528160406.4fceb036.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from palinux.external.hp.com ([192.25.206.14]:40017 "EHLO
	mail.parisc-linux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752586AbYEaRVA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 31 May 2008 13:21:00 -0400
Content-Disposition: inline
In-Reply-To: <20080528160406.4fceb036.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-next@vger.kernel.org

On Wed, May 28, 2008 at 04:04:06PM +1000, Stephen Rothwell wrote:
> > I'd swear I reported this to Willy the first time it appeared, but according
> > to my mail logs, I never did...

You did ... I was just slack.

> I have added the following patch to linux-next for today, but I am
> assuming the Willy will fix his semaphore tree shortly.

Fixed now.  Thanks!

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
