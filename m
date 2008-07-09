From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: linux-next: sparc64 build failure
Date: Wed, 9 Jul 2008 23:23:33 +0200
Message-ID: <20080709212333.GA3759@uranus.ravnborg.org>
References: <20080709211515.0d2c5100.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:46584 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756084AbYGIVWo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 9 Jul 2008 17:22:44 -0400
Content-Disposition: inline
In-Reply-To: <20080709211515.0d2c5100.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, David Miller <davem@davemloft.net>

On Wed, Jul 09, 2008 at 09:15:15PM +1000, Stephen Rothwell wrote:
> Hi Sam,
> 
> Today's linux-next build (sparc64 allmodconfig) failed like this:
> 
> usr/include/asm/auxvec.h:1: included file 'asm-sparc/auxvec.h' is not exported
> usr/include/asm/bpp.h:1: included file 'asm-sparc/bpp.h' is not exported
> usr/include/asm/byteorder.h:1: included file 'asm-sparc/byteorder.h' is not exported
> usr/include/asm/errno.h:1: included file 'asm-sparc/errno.h' is not exported
> usr/include/asm/openpromio.h:1: included file 'asm-sparc/openpromio.h' is not exported
> usr/include/asm/perfctr.h:1: included file 'asm-sparc/perfctr.h' is not exported

My bad - but I do not have time to look into it now.
Too much painting/moving stuff - sorry!

	Sam
