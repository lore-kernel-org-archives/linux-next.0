From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH -next] fs: fix compat_ioctl build for CONFIG_BLOCK=n
Date: Mon, 14 Dec 2009 20:16:13 +0000
Message-ID: <200912142016.13631.arnd@arndb.de>
References: <20091214165927.c08c4784.sfr@canb.auug.org.au> <20091214091005.b4df65d9.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:62956 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757499AbZLNUQU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 14 Dec 2009 15:16:20 -0500
In-Reply-To: <20091214091005.b4df65d9.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Monday 14 December 2009 17:10:05 Randy Dunlap wrote:
> 
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Fix build failure when CONFIG_BLOCK=n:
> 
> fs/compat_ioctl.c:1604: error: 'SG_SET_TRANSFORM' undeclared
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>

Your patch is obviously correct, but I wonder if we could just drop
the line completely, given that no driver in the kernel actually
implements this ioctl command. It was part of the ide-scsi driver
until 2.6.28, but that driver was removed in 2.6.29.

	Arnd
