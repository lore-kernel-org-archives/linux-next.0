From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: Tree for November 14 (staging)
Date: Mon, 24 Nov 2008 21:50:19 -0800
Message-ID: <20081125055019.GA26807@kroah.com>
References: <20081114184021.ed198f4b.sfr@canb.auug.org.au> <20081114095247.6b195091.randy.dunlap@oracle.com> <20081114181124.GA23441@kroah.com> <491DC1CC.8020502@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:33963 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751083AbYKYFxy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Nov 2008 00:53:54 -0500
Content-Disposition: inline
In-Reply-To: <491DC1CC.8020502@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, Nov 14, 2008 at 10:22:04AM -0800, Randy Dunlap wrote:
> Greg KH wrote:
> > On Fri, Nov 14, 2008 at 09:52:47AM -0800, Randy Dunlap wrote:
> >> On Fri, 14 Nov 2008 18:40:21 +1100 Stephen Rothwell wrote:
> >>
> >>> Hi all,
> >>>
> >>> Changes since 20081113:
> >>>
> >>> New tree:
> >>> 	staging
> >>
> >> drivers/staging/benet/mpu.c:146: error: implicit declaration of function 'udelay'

Thanks, got this one now.

greg k-h
