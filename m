From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: Tree for July 8 (ns8390)
Date: Tue, 8 Jul 2008 19:30:26 +0100
Message-ID: <20080708193026.6c9c93ba@the-village.bc.nu>
References: <20080708192251.3275d283.sfr@canb.auug.org.au>
	<20080708113529.9297e1ad.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:56466 "EHLO
	the-village.bc.nu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753981AbYGHTDe (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 8 Jul 2008 15:03:34 -0400
In-Reply-To: <20080708113529.9297e1ad.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, akpm <akpm@linux-foundation.org>

On Tue, 8 Jul 2008 11:35:29 -0700
Randy Dunlap <randy.dunlap@oracle.com> wrote:

> (for Alan :)
> 
> drivers/built-in.o: In function `ne_drv_resume':
> ne.c:(.text+0xc9902): undefined reference to `NS8390_init'
> drivers/built-in.o: In function `ne_block_output':
> ne.c:(.text+0xc9c31): undefined reference to `NS8390_init'
> drivers/built-in.o: In function `ne_probe1':
> ne.c:(.init.text+0xbbb3): undefined reference to `NS8390_init'
> drivers/built-in.o: In function `hp_probe1':
> hp.c:(.init.text+0xc15a): undefined reference to `NS8390_init'

beats me... my ne.c doesn't reference NS8390_init at all. The patch has
been going around for so long I've really lost track of what happened to
it over the many months.

My tree has NS8390p_init in both of those drivers and no reference to
NS8390_init at all.

Alan
