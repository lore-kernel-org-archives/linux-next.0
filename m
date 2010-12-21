From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build warnings after merge of the tty tree
Date: Tue, 21 Dec 2010 11:42:04 -0800
Message-ID: <20101221194204.GA11611@kroah.com>
References: <20101221181158.53f62590.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:57054 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751345Ab0LUTtt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Dec 2010 14:49:49 -0500
Content-Disposition: inline
In-Reply-To: <20101221181158.53f62590.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>

On Tue, Dec 21, 2010 at 06:11:58PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the tty tree, today's linux-next build (powerpc
> ppc64_defconfig) produced these warnings:
> 
> drivers/tty/tty_io.c: In function 'tty_init':
> drivers/tty/tty_io.c:3309: warning: ignoring return value of 'device_create_file', declared with attribute warn_unused_result
> drivers/tty/vt/vt.c: In function 'vty_init':
> drivers/tty/vt/vt.c:2997: warning: ignoring return value of 'device_create_file', declared with attribute warn_unused_result
> 
> Introduced by commit fbc92a3455577ab17615cbcb91826399061bd789 ("tty: add
> 'active' sysfs attribute to tty0 and console device").

Oops, Kay, care to make up a patch to fix these warnings?

thanks,

greg k-h
