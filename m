From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: Missing CONFIG_IDE_LEGACY definition (Re: linux-next: Tree for November 13)
Date: Thu, 13 Nov 2008 22:08:42 +0100
Message-ID: <200811132208.43694.bzolnier@gmail.com>
References: <20081113183316.3601c13d.sfr@canb.auug.org.au> <s5hiqqsq9pv.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gv-out-0910.google.com ([216.239.58.190]:40036 "EHLO
	gv-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751980AbYKMVNR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 13 Nov 2008 16:13:17 -0500
Received: by gv-out-0910.google.com with SMTP id e6so247115gvc.37
        for <linux-next@vger.kernel.org>; Thu, 13 Nov 2008 13:13:15 -0800 (PST)
In-Reply-To: <s5hiqqsq9pv.wl%tiwai@suse.de>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thursday 13 November 2008, Takashi Iwai wrote:
> At Thu, 13 Nov 2008 18:33:16 +1100,
> Stephen Rothwell wrote:
> > 
> > Hi all,
> > 
> > Changes since 20081112:
> > 
> > Undropped tree:
> > 	security-testing
> > 
> > Dropped trees (temporarily):
> > 	sh (build problems)
> > 	creds (non-trivial conflict)
> > 	userns (it depends on creds)
> > 	semaphore-removal (due to unfixed conflicts against Linus' tree)
> > 	firmware (unfixed build failure)
> > 
> > The usb tree lost its conflict.
> > 
> > The net tree lost its 3 conflicts.
> 
> The IDE tree update seems broken for some old devices.
> CONFIG_IDE_LEGACY is selected by them but it's nowhere defined in
> Kconfig.

Thanks for noticing and fixing this.

I've integrated your fix into the guilty patch ("ide: move legacy
ISA/VLB ports handling to ide-legacy.c") to preserve bisectability.

Bart
