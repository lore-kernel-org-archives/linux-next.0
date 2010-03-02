From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH -next] pktcdvd: improve BKL and compat_ioctl.c usage
Date: Tue, 2 Mar 2010 13:06:21 +0100
Message-ID: <20100302120621.GA28192@elte.hu>
References: <20100225183523.80361261.sfr@canb.auug.org.au>
 <4B86B97D.6030208@oracle.com>
 <201002252227.11472.arnd@arndb.de>
 <4B86F564.9000105@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:59639 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752181Ab0CBMGi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Mar 2010 07:06:38 -0500
Content-Disposition: inline
In-Reply-To: <4B86F564.9000105@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Peter Osterlund <petero2@telia.com>, Jens Axboe <jens.axboe@oracle.com>, Akinobu Mita <akinobu.mita@gmail.com>


* Randy Dunlap <randy.dunlap@oracle.com> wrote:

> On 02/25/10 13:27, Arnd Bergmann wrote:
> > The pktcdvd driver uses proper locking and does not need the
> > BKL in the ioctl and llseek functions of the character device,
> > so kill both. Moving the compat_ioctl handling from common code
> > into the driver itself fixes build problems when CONFIG_BLOCK is
> > disabled.
> > 
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > 
> > ---
> > On Thursday 25 February 2010, Randy Dunlap wrote:
> >> From: Randy Dunlap <randy.dunlap@oracle.com>
> >>
> >> fs/compat_ioctl.c should omit pktcdvd.h and its ioctl when CONFIG_BLOCK
> >> is not enabled.  This fixes these build errors:
> >>
> >> In file included from fs/compat_ioctl.c:105:
> >> include/linux/pktcdvd.h:166: error: field 'read_queue' has incomplete type
> >> include/linux/pktcdvd.h:167: error: field 'write_queue' has incomplete type
> >> include/linux/pktcdvd.h:207: error: field 'orig_bios' has incomplete type
> >> make[2]: *** [fs/compat_ioctl.o] Error 1
> > 
> > How about this one instead, cleaning pktcdvd ioctl handling up for good?
> 
> OK, that works too.
> 
> Acked-by: Randy Dunlap <randy.dunlap@oracle.com>

FYI, this build bug now triggers upstream too - none of the fixes was applied.

	Ingo
