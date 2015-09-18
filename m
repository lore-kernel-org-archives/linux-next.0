From: Jesper Nilsson <jesper.nilsson@axis.com>
Subject: Re: crisv32 runtime failure in -next due to 'page-flags: define
 behavior SL*B-related flags on compound pages'
Date: Fri, 18 Sep 2015 16:53:09 +0200
Message-ID: <20150918145309.GG32685@axis.com>
References: <55FAEA67.9000102@roeck-us.net>
 <20150918142507.GA30125@node.dhcp.inet.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bes.se.axis.com ([195.60.68.10]:33587 "EHLO bes.se.axis.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753855AbbIROxM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Sep 2015 10:53:12 -0400
Content-Disposition: inline
In-Reply-To: <20150918142507.GA30125@node.dhcp.inet.fi>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Guenter Roeck <linux@roeck-us.net>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mikael Starvik <starvik@axis.com>, Jesper Nilsson <jespern@axis.com>, Minchan Kim <minchan@kernel.org>, linux-cris-kernel@axis.com

On Fri, Sep 18, 2015 at 05:25:07PM +0300, Kirill A. Shutemov wrote:
> On Thu, Sep 17, 2015 at 09:29:27AM -0700, Guenter Roeck wrote:
> > Hi,
> > 
> > my crisv32 qemu test fails with next-20150917 as follows.
> > 
> > NET: Registered protocol family 16
> > kernel BUG at mm/slab.c:1648!
> > Linux 4.3.0-rc1-next-20150917 #1 Wed Sep 16 23:56:59 PDT 2015
> > Oops: 0000
> > 
> > [ register dump follows ]
> > 
> > See http://server.roeck-us.net:8010/builders/qemu-crisv32-next/builds/83/steps/qemubuildcommand/logs/stdio
> > for a complete log.
> 
> Is there a chance to get proper backtrace?

Yes, it should be possible with CONFIG_KALLSYMS=y in the kconfig.

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
