From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: Tree for June 20: [regression] No sound on SB600
Date: Sat, 21 Jun 2008 21:25:41 +0200
Message-ID: <200806212125.42472.rjw@sisk.pl>
References: <20080620172507.b7301bd1.sfr@canb.auug.org.au> <200806211728.10445.rjw@sisk.pl> <s5hbq1u3hch.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:60767 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752426AbYFUTYU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 21 Jun 2008 15:24:20 -0400
In-Reply-To: <s5hbq1u3hch.wl%tiwai@suse.de>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Saturday, 21 of June 2008, Takashi Iwai wrote:
> At Sat, 21 Jun 2008 17:28:09 +0200,
> Rafael J. Wysocki wrote:
> > 
> > On Friday, 20 of June 2008, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Changes since next-20080619:
> > > 
> > > The net tree lost its conflict against Linus' tree.
> > > 
> > > The bkl-removal tree lost a conflict.
> > 
> > On one of my test boxes with the ATI chipset (SB600 south bridge) there's no
> > sound output.  Bisection shows that the following commit causes this to happen
> > and reverting the commit fixes the problem for me:
> > 
> > commit cf97e6678f1e1e7bbdb566c36771540123832a31
> > Author: Takashi Iwai <tiwai@suse.de>
> > Date:   Mon Jun 16 15:47:26 2008 +0200
> > 
> >     ALSA: hda - Fix wrong volumes in AD1988 auto-probe mode
> >     
> >     Don't create mixer volume elements for Headphone and Speaker if they
> >     use the same DAC as normal line-outs on AD1988.  Otherwise the amp
> >     value gets screwed up, e.g.
> >     	https://bugzilla.novell.com/show_bug.cgi?id=398255
> >     
> >     Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > 
> > Please let me know if you need any additional information.
> 
> Could you run alsa-info.sh with --no-upload option and attach the
> output for both states with and without that commit?  The script is
> found at
> 	http://www.alsa-project.org/alsa-info.sh
> Also, show the relevant kernel message from snd-hda-intel (informing
> the auto-parsing of pins, etc), too.

dmesg outputs and the outputs of 'alsa-info.sh --no-upload' for the kernel with
the patch applied (1) and with the reverted (2) are at:

http://www.sisk.pl/kernel/debug/20080620/box2/dmesg-1.log
http://www.sisk.pl/kernel/debug/20080620/box2/alsa-info-1.txt

http://www.sisk.pl/kernel/debug/20080620/box2/dmesg-2.log
http://www.sisk.pl/kernel/debug/20080620/box2/alsa-info-2.txt

Thanks,
Rafael
