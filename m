From: "Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: crisv32 runtime failure in -next due to 'page-flags: define
 behavior SL*B-related flags on compound pages'
Date: Fri, 18 Sep 2015 17:25:07 +0300
Message-ID: <20150918142507.GA30125@node.dhcp.inet.fi>
References: <55FAEA67.9000102@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <55FAEA67.9000102@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mikael Starvik <starvik@axis.com>, Jesper Nilsson <jesper.nilsson@axis.com>, Minchan Kim <minchan@kernel.org>, linux-cris-kernel@axis.com
List-Id: linux-next.vger.kernel.org

On Thu, Sep 17, 2015 at 09:29:27AM -0700, Guenter Roeck wrote:
> Hi,
> 
> my crisv32 qemu test fails with next-20150917 as follows.
> 
> NET: Registered protocol family 16
> kernel BUG at mm/slab.c:1648!
> Linux 4.3.0-rc1-next-20150917 #1 Wed Sep 16 23:56:59 PDT 2015
> Oops: 0000
> 
> [ register dump follows ]
> 
> See http://server.roeck-us.net:8010/builders/qemu-crisv32-next/builds/83/steps/qemubuildcommand/logs/stdio
> for a complete log.

Is there a chance to get proper backtrace?

-- 
 Kirill A. Shutemov
