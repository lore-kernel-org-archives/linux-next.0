From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH 1/2] ACPI Video: Ignore devices that aren't present in
	hardware
Date: Fri, 4 Jul 2008 00:09:49 -0300
Message-ID: <20080704030948.GB31908@khazad-dum.debian.net>
References: <200807031805.52883.trenn@suse.de> <20080703160822.GA29110@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3.smtp.messagingengine.com ([66.111.4.27]:56552 "EHLO
	out3.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754338AbYGDDJy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 Jul 2008 23:09:54 -0400
Content-Disposition: inline
In-Reply-To: <20080703160822.GA29110@srcf.ucam.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Thomas Renninger <trenn@suse.de>, ak@linux.intel.com, linux-acpi@vger.kernel.org, linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Julia Jomantaite <julia.jomantaite@gmail.com>, marcus@better.se, dannybaumann@web.de, corsac@debian.org

Hi Matthew!

On Thu, 03 Jul 2008, Matthew Garrett wrote:

> On Thu, Jul 03, 2008 at 06:05:51PM +0200, Thomas Renninger wrote:
> > Can these two go to linux-next or -mm, pls.
> 
> Not until the opregion code is merged, no. If you'd like that to happen 
> faster, then figuring out why it triggers a 750ms delay on brightness 
> changes on the T61 would be a great help, because I haven't a clue why 
> it's broken...

I have never really tried finding out WTF in the firmware causes this, but:

1. The backlight-change firmware runs in SMM.
2. The calls happen in ACPI DSDT
3. The SMM code DOES take care of the CMOS NVRAM

You could well find something interesting if you dissect what happens to the
NVRAM.  Maybe changing it before/after/during the ACPI call has something to
do with it, etc.

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
