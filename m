From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: Tree for August 10
Date: Tue, 10 Aug 2010 10:56:51 +0100
Message-ID: <20100810105651.5b49850d@lxorguk.ukuu.org.uk>
References: <20100810135601.4777e310.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:39062 "EHLO
	www.etchedpixels.co.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752252Ab0HJJmR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Aug 2010 05:42:17 -0400
In-Reply-To: <20100810135601.4777e310.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, 10 Aug 2010 13:56:01 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> As the merge window is open, please do not add 2.6.37 material to your
> linux-next included trees until after 2.6.36-rc1.

Breaks on x86-32 with

ERROR: "st_get_plat_device" [drivers/staging/ti-st/st_drv.ko] undefined!
ERROR: "__get_user_X" [drivers/acpi/apei/erst-dbg.ko] undefined!
WARNING: modpost: Found 17 section mismatch(es).
To see full details build your kernel with:
'make CONFIG_DEBUG_SECTION_MISMATCH=y'
make[1]: *** [__modpost] Error 1
make: *** [modules] Error 2



Alan
