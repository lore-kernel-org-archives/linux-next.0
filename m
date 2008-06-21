From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: Tree for June 20: [regression] No sound on SB600
Date: Sat, 21 Jun 2008 17:28:09 +0200
Message-ID: <200806211728.10445.rjw@sisk.pl>
References: <20080620172507.b7301bd1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:60041 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751094AbYFUP0s (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 21 Jun 2008 11:26:48 -0400
In-Reply-To: <20080620172507.b7301bd1.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Friday, 20 of June 2008, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since next-20080619:
> 
> The net tree lost its conflict against Linus' tree.
> 
> The bkl-removal tree lost a conflict.

On one of my test boxes with the ATI chipset (SB600 south bridge) there's no
sound output.  Bisection shows that the following commit causes this to happen
and reverting the commit fixes the problem for me:

commit cf97e6678f1e1e7bbdb566c36771540123832a31
Author: Takashi Iwai <tiwai@suse.de>
Date:   Mon Jun 16 15:47:26 2008 +0200

    ALSA: hda - Fix wrong volumes in AD1988 auto-probe mode
    
    Don't create mixer volume elements for Headphone and Speaker if they
    use the same DAC as normal line-outs on AD1988.  Otherwise the amp
    value gets screwed up, e.g.
    	https://bugzilla.novell.com/show_bug.cgi?id=398255
    
    Signed-off-by: Takashi Iwai <tiwai@suse.de>

Please let me know if you need any additional information.

Thanks,
Rafael
