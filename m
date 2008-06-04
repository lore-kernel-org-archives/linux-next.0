From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: linux-next: firmware merge conflicts
Date: Wed, 04 Jun 2008 10:52:51 +0100
Message-ID: <1212573171.4042.81.camel@shinybook.infradead.org>
References: <20080604160742.e4c66cd4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:58981 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752371AbYFDJwu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Jun 2008 05:52:50 -0400
In-Reply-To: <20080604160742.e4c66cd4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Alan Cox <alan@redhat.com>, Greg Kroah-Hartman <gregkh@suse.de>, Takashi Iwai <tiwai@suse.de>

On Wed, 2008-06-04 at 16:07 +1000, Stephen Rothwell wrote:
> Hi David,
> 
> Today's linux-next merge of the firmware tree got a few conflicts:
> 
> Commit 33f1dd02ed25db0790fec8a62b008c71831c49d9 ("ti_usb: kick firmware
> into user space") from the usb tree against commit
> e009cdbc2e96e72fe84df7cf014abcd7a7eb7dc7 ("ti_usb_3410_5052: use
> request_firmware()") from the firmware tree.  These seem to have similar
> goals but are using different methods.  This affected the files
> drivers/usb/serial/Kconfig,
> drivers/usb/serial/{ti_fw_3410.h,ti_fw_5052.h,ti_usb_3410_5052.c}.  I
> have used the firmware tree version for now.

I think that's the right choice; the main difference is the fact that my
version rips out the built-in firmware capability completely, and uses
the firmware loader unconditionally -- which is what we want. Alan?

http://git.infradead.org/users/dwmw2/firmware-2.6.git?a=commitdiff;h=7eb1c508575d0e1c98e8560f8215d35b10e6cd7a#patch4

> Some simple conflicts in sound/Kconfig due to commit
> bd7d34e759d7537b42cffb7205b7b50dda6535bb ("sound: Convert to menuconfig")
> from the sound tree.
> 
> Simple conflicts in sound/pci/maestro3.c and
> sound/pci/ymfpci/ymfpci_main.c because "maestro3: treat firmware data as
> const" and "ymfpci: treat firmware data as const" appear in both the
> driver-core tree and the firmware tree.  The conflicts are because the
> firmware tree further modifies these files.
>
> So, you and Alan need to come to an agreement about ti_usb (and inform
> Greg :-)).  And you should probably ask Greg to drop the to "const"
> patches (or maybe the other way around). 

I don't mind much. I was kind of hoping we might sneak the 'const' thing
into 2.6.26 since it's fairly straightforward and should help to stop
people adding more drivers which don't treat fw->data as const.
But then again, that's what linux-next is for too, isn't it?

Greg, want to either push the const changes to Linus or drop them? I
think I've picked up your extra ones, including the iSight one now that
that driver is upstream.

-- 
dwmw2

