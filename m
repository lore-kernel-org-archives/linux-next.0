From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the drivers-x86 tree
Date: Mon, 30 Aug 2010 12:51:19 +1000
Message-ID: <20100830125119.b6a6cb22.sfr@canb.auug.org.au>
References: <20100827115950.dd942b90.sfr@canb.auug.org.au>
	<20100827025148.GA25469@srcf.ucam.org>
	<20100827074048.GB9120@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49738 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754015Ab0H3CvZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 29 Aug 2010 22:51:25 -0400
In-Reply-To: <20100827074048.GB9120@core.coreip.homeip.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi all,

On Fri, 27 Aug 2010 00:40:48 -0700 Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>
> On Fri, Aug 27, 2010 at 03:51:48AM +0100, Matthew Garrett wrote:
> > On Fri, Aug 27, 2010 at 11:59:50AM +1000, Stephen Rothwell wrote:
> > 
> > > After merging the drivers-x86 tree, today's linux-next build (powerpc
> > > ppc64_defconfig and x86_64 allmodconfig) produced this warning:
> > 
> > Oh Lordy. I should stop merging anything that contains "select". I'll 
> > take a look at this tomorrow, but I'm about to head away for a week - if 
> > anyone has a fix, feel free to find a way to get it merged.
> > 
> > (Dmitry, there was a Kconfig issue when I merged your patch, so it's 
> > entirely plausible that you're a completely innocent bystander here)
> 
> Yeah, I think I am innocent here. My patch was adding "select
> INPUT_SPARCEKMAP" which is a library module and which I ensure to be
> selectable as long as INPUT is enabled. I do not want to switch it
> around into "depends on" since it is implementation detail and user
> should not care.

I applied this patch for today ...

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 30 Aug 2010 12:47:51 +1000
Subject: [PATCH] Fix Kconfig mistaken update

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/platform/x86/Kconfig |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index b96db80..55579f1 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -497,7 +497,6 @@ config ACPI_TOSHIBA
 	depends on RFKILL || RFKILL = n
 	select INPUT_POLLDEV
 	select INPUT_SPARSEKMAP
-	select BACKLIGHT_CLASS_DEVICE
 	---help---
 	  This driver adds support for access to certain system settings
 	  on "legacy free" Toshiba laptops.  These laptops can be recognized by
-- 
1.7.1


-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
