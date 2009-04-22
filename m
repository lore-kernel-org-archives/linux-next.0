From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: [BUILD FAILURE 05/12] Next April 21 : PPC64 randconfig [drivers/macintosh/mediabay.o]
Date: Wed, 22 Apr 2009 11:34:17 +0200
Message-ID: <200904221134.18163.bzolnier@gmail.com>
References: <1240339875.9110.137.camel@subratamodak.linux.ibm.com> <200904212104.14665.bzolnier@gmail.com> <18926.38431.910952.630575@cargo.ozlabs.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wa-out-1112.google.com ([209.85.146.183]:9292 "EHLO
	wa-out-1112.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752016AbZDVJag (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 22 Apr 2009 05:30:36 -0400
In-Reply-To: <18926.38431.910952.630575@cargo.ozlabs.ibm.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mackerras <paulus@samba.org>
Cc: subrata@linux.vnet.ibm.com, Linuxppc-dev <Linuxppc-dev@ozlabs.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Stefan Bader <stefan.bader@canonical.com>, Marcelo Tosatti <marcelo@conectiva.com.br>, Adrian Bunk <bunk@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, sachinp <sachinp@linux.vnet.ibm.com>, linux-kernel <linux-kernel@vger.kernel.org>, Alexander Beregalov <a.beregalov@gmail.com>

On Wednesday 22 April 2009 05:59:27 Paul Mackerras wrote:
> Bartlomiej Zolnierkiewicz writes:
> 
> > mediabay shouldn't include <linux/ide.h> unconditionally so
> > remove the superfluous include from mediabay.c (<asm/mediabay.h>
> > will pull <linux/ide.h> in for CONFIG_BLK_DEV_IDE_PMAC=y).
> 
> I don't like relying on second-hand imports like that.  I prefer the
> previous patch, that made mediabay depend on CONFIG_BLOCK.

I missed it somehow...

OK, I found it now and it should fix the problem as well.

> BTW, if including <linux/ide.h> causes an error when CONFIG_BLOCK=n,
> then there is a bug in <linux/ide.h>, IMO.

<linux/ide.h> is for drivers/ide only.  mediabay lacks proper abstraction
layer and is probably the only abuser left.

Besides being a build fix my patch is a right step in cleaning this mess
so I'm going to apply it through ide tree.

Thanks,
Bart
