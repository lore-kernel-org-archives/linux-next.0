From: Daniel Mack <daniel@caiaq.de>
Subject: Re: linux-next: build failure after merge of the sound tree
Date: Mon, 28 Jun 2010 18:33:13 +0200
Message-ID: <20100628163313.GH2698@buzzloop.caiaq.de>
References: <20100624130341.0ccf9102.sfr@canb.auug.org.au>
 <s5hbpb1dkp7.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from buzzloop.caiaq.de ([212.112.241.133]:50000 "EHLO
	buzzloop.caiaq.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750762Ab0F1QdR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 28 Jun 2010 12:33:17 -0400
Content-Disposition: inline
In-Reply-To: <s5hbpb1dkp7.wl%tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jun 24, 2010 at 08:11:00AM +0200, Takashi Iwai wrote:
> At Thu, 24 Jun 2010 13:03:41 +1000,
> Stephen Rothwell wrote:
> > 
> > Hi Takashi,
> > 
> > After merging the sound tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > sound/usb/mixer.c: In function 'get_ctl_value_v1':
> > sound/usb/mixer.c:308: error: 'struct usb_mixer_interface' has no member named 'ctrlif'
> > 
> > Caused by commit 3d8d4dcfd423b01ef7ea7c3c97720764b7adb6df ("ALSA:
> > usb-audio: simplify control interface access").  Grep is your friend ...
> > 
> > I have used the sound tree from next-20100623 for today.
> 
> Fixed now.  I've forgotten the build tests with debug options...

Oops, sorry and thanks for fixing this up!

Daniel
