From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: usb tree build failure
Date: Wed, 19 Aug 2009 16:45:18 -0700
Message-ID: <20090819234518.GA12863@kroah.com>
References: <20090819183402.77be5c3b.sfr@canb.auug.org.au>
 <20090819135239.GB30892@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753896AbZHSXqn@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090819135239.GB30892@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>
List-Id: linux-next.vger.kernel.org

On Wed, Aug 19, 2009 at 06:52:39AM -0700, Greg KH wrote:
> On Wed, Aug 19, 2009 at 06:34:02PM +1000, Stephen Rothwell wrote:
> > Hi Greg,
> > 
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
> > 
> > arch/x86/built-in.o: In function `setup_early_printk':
> > early_printk.c:(.init.text+0x159de): undefined reference to `early_dbgp_init'
> > early_printk.c:(.init.text+0x159f9): undefined reference to `early_dbgp_console'
> > 
> > Caused by commit 77f162cc16ff4bff1adefe47dbe48ab6b2d9247b ("USB: ehci
> > early_printk: split ehci debug driver from early_printk.c").
> > 
> > I have reverted that commit for today (along with commits
> > 37e541af790703d66ba88cf3a71b5ae97654b753 ("USB: early_printk: insert cr
> > prior to nl as needed"), 71c0553ae63d2738a126d4f5b37730dfaa7a2fd7 ("USB:
> > ehci-dbgp: Execute early BIOS hand off"),
> > 3f038d06f259fd02142aaaaa47addfb4934d4faa ("USB: early_printk: EHCI debug
> > controller initialization delays") and
> > f6ee359e79de27b46213f8b5293251a26bc22b1e ("USB: ehci-dbgp: stability
> > improvements and external re-init") that depended on it).
> 
> Ick.  Jason, what happened here?  It builds on i386 :)

Ok, I've dropped all of these now.  Jason, care to respin them and
resend them?

Stephen, the usb tree should be now fixed up for linux-next, thanks for
the notices.

thanks,

greg k-h
