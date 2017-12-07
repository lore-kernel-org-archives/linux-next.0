From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: linux-next: build failure after merge of the printk tree
Date: Thu, 7 Dec 2017 10:24:04 +0900
Message-ID: <20171207012404.GB1119@jagdpanzerIV>
References: <20171206142300.64d5a70f@canb.auug.org.au>
 <20171206101725.fn4sfbf7sithel55@pathway.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f176.google.com ([209.85.192.176]:41998 "EHLO
        mail-pf0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751718AbdLGBYI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 Dec 2017 20:24:08 -0500
Content-Disposition: inline
In-Reply-To: <20171206101725.fn4sfbf7sithel55@pathway.suse.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Petr Mladek <pmladek@suse.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>

On (12/06/17 11:17), Petr Mladek wrote:
> On Wed 2017-12-06 14:23:00, Stephen Rothwell wrote:
> > Hi Petr,
> > 
> > After merging the printk tree, today's linux-next build (x86_64
> > allnoconfig) failed like this:
> > 
> > lib/vsprintf.o: In function `pointer':
> > vsprintf.c:(.text+0x2260): undefined reference to `dereference_symbol_descriptor'
> > 
> > Caused by commit
> > 
> >   b77929215209 ("symbol lookup: introduce dereference_symbol_descriptor()")
> 
> I have just pushed the fixed commit from Sergey and will improve my
> test coverage.
> 
> > I have reverted that commit for today.
> 
> It should work now. I am sorry for the troubles.

Stephen,

please keep that commit

	("symbol lookup: introduce dereference_symbol_descriptor()")

reverted in today's [20171207] linux-next. we have one more problem
with it.

	-ss
