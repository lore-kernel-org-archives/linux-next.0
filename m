From: Greg KH <gregkh@suse.de>
Subject: Re: linux-next: Tree for December 9
Date: Thu, 9 Dec 2010 07:49:00 -0800
Message-ID: <20101209154900.GA20190@suse.de>
References: <20101209154148.ca4ba4e0.sfr@canb.auug.org.au>
 <AANLkTikjGhkYoR_o3uq-sUEY1daXSRWQgRmMBoVJ-n1=@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:37477 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753902Ab0LIPtJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 9 Dec 2010 10:49:09 -0500
Content-Disposition: inline
In-Reply-To: <AANLkTikjGhkYoR_o3uq-sUEY1daXSRWQgRmMBoVJ-n1=@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Zimny Lech <napohybelskurwysynom2010@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, Dec 09, 2010 at 12:46:19PM +0100, Zimny Lech wrote:
> Ave
> 
> 2010/12/9 Stephen Rothwell <sfr@canb.auug.org.au>:
> > Hi all,
> >
> > Changes since 20101208:
> >
> 
>   LD      drivers/built-in.o
> drivers/staging/built-in.o:(.data+0xec80): multiple definition of `log_level'

That's coming from the cxt1e1 driver, I'll fix that up to be a "sane"
global name.

> drivers/scsi/built-in.o:(.data+0xa71c): first defined here

That's coming from the drivers/scsi/bfa/ driver, and it too should be
fixed as it shouldn't have a global variable with this name in it.  Care
to let the maintainer of that driver know about this as well?

thanks,

greg k-h
