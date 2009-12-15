From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH -next] fs: fix compat_ioctl build for CONFIG_BLOCK=n
Date: Tue, 15 Dec 2009 11:29:34 -0800
Message-ID: <20091215112934.020e5648.randy.dunlap@oracle.com>
References: <20091214165927.c08c4784.sfr@canb.auug.org.au>
	<20091214091005.b4df65d9.randy.dunlap@oracle.com>
	<200912142016.13631.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S933559AbZLOTam@vger.kernel.org>
In-Reply-To: <200912142016.13631.arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, 14 Dec 2009 20:16:13 +0000 Arnd Bergmann wrote:

> On Monday 14 December 2009 17:10:05 Randy Dunlap wrote:
> > 
> > From: Randy Dunlap <randy.dunlap@oracle.com>
> > 
> > Fix build failure when CONFIG_BLOCK=n:
> > 
> > fs/compat_ioctl.c:1604: error: 'SG_SET_TRANSFORM' undeclared
> > 
> > Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Your patch is obviously correct, but I wonder if we could just drop
> the line completely, given that no driver in the kernel actually
> implements this ioctl command. It was part of the ide-scsi driver
> until 2.6.28, but that driver was removed in 2.6.29.

I checked with Jens, he says yes, drop that case.
Do you want to do that or should I send another patch?

thanks,
---
~Randy
