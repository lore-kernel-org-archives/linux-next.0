From: Adrian Bunk <bunk@kernel.org>
Subject: Re: linux-next: sparc tree build failure
Date: Mon, 28 Jul 2008 12:31:02 +0300
Message-ID: <20080728093102.GA30612@cs181140183.pp.htv.fi>
References: <20080728163808.55efadb1.sfr@canb.auug.org.au> <20080728082114.GA11366@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp6.pp.htv.fi ([213.243.153.40]:52412 "EHLO smtp6.pp.htv.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750827AbYG1Jbn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 28 Jul 2008 05:31:43 -0400
Content-Disposition: inline
In-Reply-To: <20080728082114.GA11366@uranus.ravnborg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, linux-next@vger.kernel.org

On Mon, Jul 28, 2008 at 10:21:14AM +0200, Sam Ravnborg wrote:
> On Mon, Jul 28, 2008 at 04:38:08PM +1000, Stephen Rothwell wrote:
> > Hi Dave,
> > 
> > Today's linux-next build (sparc64 allmodconfig) failed like this:
> > 
> > usr/include/drm/drm.h:40: included file 'asm-sparc64/ioctl.h' is not exported
> > usr/include/video/sisfb.h:24: included file 'asm-sparc64/ioctl.h' is not exported
> > usr/include/video/sisfb.h:25: included file 'asm-sparc64/types.h' is not exported
> > usr/include/linux/dvb/dmx.h:27: included file 'asm-sparc64/types.h' is not exported
> > usr/include/linux/dvb/frontend.h:29: included file 'asm-sparc64/types.h' is not exported
> > usr/include/linux/dvb/net.h:27: included file 'asm-sparc64/types.h' is not exported
> > usr/include/linux/dvb/video.h:29: included file 'asm-sparc64/types.h' is not exported
> > usr/include/linux/nfsd/export.h:13: included file 'asm-sparc64/types.h' is not exported
> > usr/include/linux/nfsd/nfsfh.h:17: included file 'asm-sparc64/types.h' is not exported
> > usr/include/linux/nfsd/syscall.h:12: included file 'asm-sparc64/types.h' is not exported
> > 
> > This has been happening since (at least) next-20080723.
> 
> I cannot reproduce it here...
> Can you try to delete rm -rf usr/include/ and build again.
> If it continue to happen then try to send me a "make V=1" output.

I can also reproduce it (triggered by CONFIG_HEADERS_CHECK=y):

...
make -rR -f /tmp/linux-next-20080728/scripts/Makefile.headersinst 
obj=include/drm dst=include/drm
  perl scripts/headers_check.pl /tmp/linux-next-20080728/usr/include sparc64 /tmp/linux-next-20080728/usr/include/drm/drm.h /tmp/linux-next-20080728/usr/include/drm/drm_sarea.h /tmp/linux-next-20080728/usr/include/drm/i810_drm.h /tmp/linux-next-20080728/usr/include/drm/i830_drm.h /tmp/linux-next-20080728/usr/include/drm/i915_drm.h /tmp/linux-next-20080728/usr/include/drm/mga_drm.h /tmp/linux-next-20080728/usr/include/drm/r128_drm.h /tmp/linux-next-20080728/usr/include/drm/radeon_drm.h /tmp/linux-next-20080728/usr/include/drm/savage_drm.h /tmp/linux-next-20080728/usr/include/drm/sis_drm.h /tmp/linux-next-20080728/usr/include/drm/via_drm.h; touch /tmp/linux-next-20080728/usr/include/drm/.check
/tmp/linux-next-20080728/usr/include/drm/drm.h:40: included file 'asm-sparc64/ioctl.h' is not exported
make[3]: *** [/tmp/linux-next-20080728/usr/include/drm/.check] Error 1

> 	Sam

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed
