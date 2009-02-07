From: Len Brown <lenb@kernel.org>
Subject: Re: linux-next: acpi tree build failure
Date: Fri, 06 Feb 2009 23:06:28 -0500 (EST)
Message-ID: <alpine.LFD.2.00.0902062303090.26256@localhost.localdomain>
References: <20090202132254.456b7725.sfr@canb.auug.org.au>
 <20090205131340.edc6e6a8.sfr@canb.auug.org.au>
 <20090205050056.GA7651@kroah.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vms173019pub.verizon.net ([206.46.173.19]:19480 "EHLO
	vms173019pub.verizon.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750733AbZBGFHW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 7 Feb 2009 00:07:22 -0500
Received: from localhost.localdomain ([96.237.168.40])
 by vms173019.mailsrvcs.net
 (Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008; 32bit))
 with ESMTPA id <0KEO00KZOGQVK4Q1@vms173019.mailsrvcs.net> for
 linux-next@vger.kernel.org; Fri, 06 Feb 2009 22:06:31 -0600 (CST)
In-reply-to: <20090205050056.GA7651@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Kay Sievers <kay.sievers@vrfy.org>


On Wed, 4 Feb 2009, Greg KH wrote:

> On Thu, Feb 05, 2009 at 01:13:40PM +1100, Stephen Rothwell wrote:
> > Greg, Len,
> > 
> > On Mon, 2 Feb 2009 13:22:54 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > drivers/platform/x86/oqo-wmi.c: In function 'oqo_kine_init':
> > > drivers/platform/x86/oqo-wmi.c:595: error: 'struct device' has no member named 'bus_id'
> > > 
> > > Caused by commit 03919980ad590ad5c5c181d1bd7d58513ad170bc ("platform/x86:
> > > Add oqo-wmi driver for model 2 OQO backlight and rfkill control")
> > > interacting with commit c44c8304353aa6da82cbf98040c6a9c254e68e1c ("driver
> > > core: get rid of struct device's bus_id string array") from the
> > > driver-core tree.
> > 
> > Still getting this (of course).  Can you guys come up with a fix, please?
> 
> Len, you have the patch from Kay, what do you want to do with it?

I don't recall a patch from Kay specifically for OQO.
OQO is sitting in my tree to get exposure while it waits for
a few updates from Matthew.

I think it can be restored with this 1 liner, which I can apply to it.

thanks,
Len Brown, Intel Open Source Technology Center


diff --git a/drivers/platform/x86/oqo-wmi.c b/drivers/platform/x86/oqo-wmi.c
index 940e605..0a88af8 100644
--- a/drivers/platform/x86/oqo-wmi.c
+++ b/drivers/platform/x86/oqo-wmi.c
@@ -592,7 +592,7 @@ static int __devinit oqo_kine_init(void)
 	    oqo_kine->absmax[ABS_Y] =
 	    oqo_kine->absmax[ABS_Z] = oqo_kine->absmax[ABS_MISC] = 32767;
 
-	memcpy(oqo_kine->dev.bus_id, "kine", 4);
+	dev_set_name(&oqo_kine->dev, "kine");
 
 	oqo_kine_polled = input_allocate_polled_device();
 	if (!oqo_kine_polled) {
