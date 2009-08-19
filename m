From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the usb tree with the tip tree
Date: Wed, 19 Aug 2009 16:38:18 -0700
Message-ID: <20090819233818.GD2875@kroah.com>
References: <20090819175901.59f1af9e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754132AbZHSXmR@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090819175901.59f1af9e.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Robin Getz <rgetz@blackfin.uclinux.org>, Jason Wessel <jason.wessel@windriver.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
List-Id: linux-next.vger.kernel.org

On Wed, Aug 19, 2009 at 05:59:01PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the usb tree got a conflict in
> kernel/printk.c between commit 4d09161196c9a836eacea4b36e2f217bc34894cf
> ("printk: Enable the use of more than one CON_BOOT (early console)") from
> the tip tree and commit e289e7dc72eb6bfce70e2722d97a00f5e02893e8 ("USB:
> printk: early_printk,console: Allow more than one early console") from
> the usb tree.
> 
> I assume that these are trying to do (more or less) the same thing.  I
> have dropped the one from the usb tree for today.  Please sort this out -
> at least remove the usb tree one until you have done so, thanks.

Jason, any thoughts?  I'm going to drop your printk stuff from my tree
now, care to sort it out and resend your whole series?

thanks,

greg k-h
