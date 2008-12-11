From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: driver-core tree build failure
Date: Wed, 10 Dec 2008 20:55:17 -0800
Message-ID: <20081211045517.GA410@kroah.com>
References: <20081211112127.7aa2c373.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:60563 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754757AbYLKE7X (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Dec 2008 23:59:23 -0500
Content-Disposition: inline
In-Reply-To: <20081211112127.7aa2c373.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>

On Thu, Dec 11, 2008 at 11:21:27AM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> drivers/mtd/maps/physmap.c: In function 'physmap_flash_probe':
> drivers/mtd/maps/physmap.c:108: error: expected ')' before '{' token
> drivers/mtd/maps/physmap.c:144: error: expected expression before '}' token
> 
> Caused by commit 7267696c2421503e280d9da5bbdbd5c11e1e5b25 ("mtd: struct
> device - replace bus_id with dev_name(), dev_set_name()").
> 
> I have reverted that patch for today.
> 
> Please be more careful ... allmodconfig is your friend when doing wide
> ranging changes ...

Very sorry about that, I did kick off such a build, but forgot to look
at the result of it, my fault.

I've now fixed this up so it should be fine for tomorrow.

thanks for keeping us honest :)

greg k-h
