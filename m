From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: build failure after merge of the final tree (tty
 tree related)
Date: Fri, 17 Dec 2010 11:16:17 +0100 (CET)
Message-ID: <alpine.LFD.2.00.1012171107310.12146@localhost6.localdomain6>
References: <20101217171120.295b0c0c.sfr@canb.auug.org.au> <20101217070431.GA25192@kroah.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20101217070431.GA25192@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, 16 Dec 2010, Greg KH wrote:
> On Fri, Dec 17, 2010 at 05:11:20PM +1100, Stephen Rothwell wrote:
> > Hi Greg,
> > 
> > After merging the final tree, today's linux-next build (powerpc
> > allyesconfig) failed like this:
> > 
> > drivers/serial/apbuart.c:596: error: conflicting types for 'grlib_apbuart_configure'
> > drivers/serial/apbuart.c:523: note: previous declaration of 'grlib_apbuart_configure' was here
> > 
> > Caused by commit 35c64e5d13c3d7d8c4ad061ad5e20498b9160c24 ("drivers:
> > serial: apbuart: Handle OF failures gracefully").  This build has
> > CONFIG_SERIAL_GRLIB_GAISLER_APBUART_CONSOLE set ...
> > 
> > I have reverted this commit for today.
> 
> Ugh.  Thomas, care to send me a patch?

Sorry, I missed the console part. Patch below.

Thanks,

	tglx
---
Subject: drivers: serial: apbuart: Fixup apbuart_console_init()
From: Thomas Gleixner <tglx@linutronix.de>
Date: Fri, 17 Dec 2010 11:09:49 +0100

commit 35c64e5d (drivers: serial: apbuart: Handle OF failures
gracefully) missed that the modified grlib_apbuart_configure()
function is called from apbuart_console_init() as well.

Fix the fallout.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/serial/apbuart.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

Index: linux-2.6-tip/drivers/serial/apbuart.c
===================================================================
--- linux-2.6-tip.orig/drivers/serial/apbuart.c
+++ linux-2.6-tip/drivers/serial/apbuart.c
@@ -520,11 +520,12 @@ static struct console grlib_apbuart_cons
 };
 
 
-static void grlib_apbuart_configure(void);
+static int grlib_apbuart_configure(void);
 
 static int __init apbuart_console_init(void)
 {
-	grlib_apbuart_configure();
+	if (grlib_apbuart_configure())
+		return -ENODEV;
 	register_console(&grlib_apbuart_console);
 	return 0;
 }
