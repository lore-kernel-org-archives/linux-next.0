From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: build failure after merge of the final tree (powerpc
 related)
Date: Mon, 2 Jan 2012 01:25:14 -0700
Message-ID: <20120102082514.GG18381@ponder.secretlab.ca>
References: <20111228194949.ff20a609745e816c266f7d91@canb.auug.org.au>
 <1325068334.6632.43.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:62713 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751372Ab2ABIZT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 Jan 2012 03:25:19 -0500
Content-Disposition: inline
In-Reply-To: <1325068334.6632.43.camel@pasglop>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>

On Wed, Dec 28, 2011 at 09:32:14PM +1100, Benjamin Herrenschmidt wrote:
> On Wed, 2011-12-28 at 19:49 +1100, Stephen Rothwell wrote:
> > Hi ,
> > 
> > After merging the final tree, today's linux-next build (powerpc
> > allyesconfig) failed like this:
> > 
> > kernel/built-in.o: In function `irq_dispose_mapping':
> > (.opd+0x159f0): multiple definition of `irq_dispose_mapping'
> > arch/powerpc/kernel/built-in.o:(.opd+0x960): first defined here
> > kernel/built-in.o: In function `irq_create_of_mapping':
> > (.opd+0x15a20): multiple definition of `irq_create_of_mapping'
> > arch/powerpc/kernel/built-in.o:(.opd+0x9a8): first defined here
> > kernel/built-in.o: In function `.irq_create_of_mapping':
> > (.text+0x147030): multiple definition of `.irq_create_of_mapping'
> > arch/powerpc/kernel/built-in.o:(.text+0x9de0): first defined here
> > kernel/built-in.o: In function `.irq_dispose_mapping':
> > (.text+0x146f4c): multiple definition of `.irq_dispose_mapping'
> > arch/powerpc/kernel/built-in.o:(.text+0x9684): first defined here
> > 
> > I am not sure what caused this. And have just left it broken.
> 
> Grant, is your irq remapper misbehaving ?

Hmmmm, that's odd.  I've not touched it.  I'll investigate.
