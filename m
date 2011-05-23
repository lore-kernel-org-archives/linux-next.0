From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: build warning after merge of the suspend tree
Date: Mon, 23 May 2011 08:24:40 -0700
Message-ID: <20110523082440.d417688c.rdunlap@xenotime.net>
References: <20110523150636.ccd83777.sfr@canb.auug.org.au>
	<20110523141846.GA8122@gvim.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110523141846.GA8122@gvim.org>
Sender: linux-kernel-owner@vger.kernel.org
To: markgross@thegnar.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, 23 May 2011 07:18:46 -0700 mark gross wrote:

> On Mon, May 23, 2011 at 03:06:36PM +1000, Stephen Rothwell wrote:
> > Hi Rafael,
> > 
> > After merging the suspend tree, today's linux-next build (i386 defconfig
> > among others) produced this warning:
> > 
> > kernel/pm_qos_params.c: In function 'pm_qos_power_write':
> > kernel/pm_qos_params.c:420: warning: passing argument 3 of 'kstrtol' from incompatible pointer type
> > include/linux/kernel.h:210: note: expected 'long int *' but argument is of type 's32 *'
> > 
> > Intreoduced by commit 365daa955e03 ("PM: Correct PM QOS's user mode
> > interface to work with ascii input per").
> 
> Gah!  I'm sorry about that.
> 
> attached is a fix.
> 
> 
> --mark
> 
> signed-off-by:markgross <markgross@thegnar.org>

Not in correct format.

> 
> From a8f0587b9ae598be5ca4c3cdda4e0ced6ca9baaf Mon Sep 17 00:00:00 2001
> From: mgross <mgross@cr48>

what is cr48?  conference room 48?


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
