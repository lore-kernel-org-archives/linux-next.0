From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the usb tree with the tip tree
Date: Thu, 20 Aug 2009 12:35:47 +0200
Message-ID: <20090820103547.GE29093@elte.hu>
References: <20090819175901.59f1af9e.sfr@canb.auug.org.au> <20090819233818.GD2875@kroah.com> <4A8CB6CF.3010109@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:55760 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753485AbZHTKgO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 20 Aug 2009 06:36:14 -0400
Content-Disposition: inline
In-Reply-To: <4A8CB6CF.3010109@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Robin Getz <rgetz@blackfin.uclinux.org>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>


* Jason Wessel <jason.wessel@windriver.com> wrote:

> Greg KH wrote:
> > On Wed, Aug 19, 2009 at 05:59:01PM +1000, Stephen Rothwell wrote:
> >   
> >> Hi Greg,
> >>
> >> Today's linux-next merge of the usb tree got a conflict in
> >> kernel/printk.c between commit 4d09161196c9a836eacea4b36e2f217bc34894cf
> >> ("printk: Enable the use of more than one CON_BOOT (early console)") from
> >> the tip tree and commit e289e7dc72eb6bfce70e2722d97a00f5e02893e8 ("USB:
> >> printk: early_printk,console: Allow more than one early console") from
> >> the usb tree.
> >>
> >> I assume that these are trying to do (more or less) the same thing.  I
> >> have dropped the one from the usb tree for today.  Please sort this out -
> >> at least remove the usb tree one until you have done so, thanks.
> >>     
> >
> > Jason, any thoughts?  I'm going to drop your printk stuff from my tree
> > now, care to sort it out and resend your whole series?
> >
> >   
> 
> I will investigate, re-test and send a new series to 
> Greg KH later in the week.  The preliminary result 
> shows the problem is a result of a clash with two 
> different patches in the tip tree.  My patch set and 
> the two patches it collides with context wise fix 
> different things.
> 
> In order to resolve this it appears that the series 
> will need to get split into something for the tip tree 
> and something for the USB tree, or we wait for the next 
> pull of the tip branch into the Linus's tree.

The printk bits are neatly separated out in the -tip 
tree, in a standalone tree, tip:core/printk:

 earth4:~/tip> gll linus..core/printk
 42c2c8c: printk: Fix "printk: Enable the use of more than one CON_BOOT (early console)"
 1aaad49: printk: Restore previous console_loglevel when re-enabling logging
 8259cf4: printk: Ensure that "console enabled" messages are printed on the console
 4d09161: printk: Enable the use of more than one CON_BOOT (early console)

So we can base on that and extend it with your bits, and 
Greg could pull this into the USB tree as well he he 
wants to (this tree is focused to this single topic and 
is non-rebasing).

The git coordinates are:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/linux-2.6-tip.git core/printk

Please Cc: new printk/console bits to Linus and Andrew as 
well.

Thanks,

	Ingo
