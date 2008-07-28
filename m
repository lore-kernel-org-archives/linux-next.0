From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: linux-next: sparc tree build failure
Date: Mon, 28 Jul 2008 10:21:14 +0200
Message-ID: <20080728082114.GA11366@uranus.ravnborg.org>
References: <20080728163808.55efadb1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtpout3.tre.se ([80.251.192.228]:11710 "EHLO smtpout3.tre.se"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750726AbYG1IUh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 28 Jul 2008 04:20:37 -0400
Content-Disposition: inline
In-Reply-To: <20080728163808.55efadb1.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, linux-next@vger.kernel.org

On Mon, Jul 28, 2008 at 04:38:08PM +1000, Stephen Rothwell wrote:
> Hi Dave,
> 
> Today's linux-next build (sparc64 allmodconfig) failed like this:
> 
> usr/include/drm/drm.h:40: included file 'asm-sparc64/ioctl.h' is not exported
> usr/include/video/sisfb.h:24: included file 'asm-sparc64/ioctl.h' is not exported
> usr/include/video/sisfb.h:25: included file 'asm-sparc64/types.h' is not exported
> usr/include/linux/dvb/dmx.h:27: included file 'asm-sparc64/types.h' is not exported
> usr/include/linux/dvb/frontend.h:29: included file 'asm-sparc64/types.h' is not exported
> usr/include/linux/dvb/net.h:27: included file 'asm-sparc64/types.h' is not exported
> usr/include/linux/dvb/video.h:29: included file 'asm-sparc64/types.h' is not exported
> usr/include/linux/nfsd/export.h:13: included file 'asm-sparc64/types.h' is not exported
> usr/include/linux/nfsd/nfsfh.h:17: included file 'asm-sparc64/types.h' is not exported
> usr/include/linux/nfsd/syscall.h:12: included file 'asm-sparc64/types.h' is not exported
> 
> This has been happening since (at least) next-20080723.

I cannot reproduce it here...
Can you try to delete rm -rf usr/include/ and build again.
If it continue to happen then try to send me a "make V=1" output.

	Sam
