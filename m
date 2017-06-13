From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Date: Tue, 13 Jun 2017 15:30:24 +0900
Message-ID: <20170613063024.GA377@jagdpanzerIV.localdomain>
References: <20170613160418.655a8f12@canb.auug.org.au>
 <20170613062048.GA3123@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f171.google.com ([209.85.192.171]:34038 "EHLO
        mail-pf0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752191AbdFMGaT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Jun 2017 02:30:19 -0400
Content-Disposition: inline
In-Reply-To: <20170613062048.GA3123@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>

On (06/13/17 08:20), Greg KH wrote:
> On Tue, Jun 13, 2017 at 04:04:18PM +1000, Stephen Rothwell wrote:
> > Hi Greg,
> > 
> > After merging the driver-core tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > drivers/block/zram/zram_drv.c:1296:28: error: expected ')' before numeric constant
> >  static CLASS_ATTR(hot_add, 0400, hot_add_show, NULL);
> >                             ^
> > drivers/block/zram/zram_drv.c:1330:3: error: 'class_attr_hot_add' undeclared here (not in a function)
> >   &class_attr_hot_add.attr,
> >    ^
> > drivers/block/zram/zram_drv.c:1282:16: warning: 'hot_add_show' defined but not used [-Wunused-function]
> >  static ssize_t hot_add_show(struct class *class,
> >                 ^
> > 
> > Caused by commit
> > 
> >   27104a53d02e ("zram: use class_groups instead of class_attrs")
> > 
> > I have reverted that commit for today (and commit
> > 
> >   ecbaa83ee84c ("driver core: remove class_attrs from struct class")
> > 
> > temporarily so the the tree will build).
> 
> Crap I missed one.  I'll go fix that up now so this should work for
> tomorrows linux-next, thanks for letting me know.
> 
> Odd that 0-day isn't giving me any failed build reports :(

how did I miss that... I was pretty sure I compile-tested
the patch before I replied... odd... sorry!

thanks for the report, Stephen.

	-ss
