From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: Tree for October 5 (dream)
Date: Mon, 5 Oct 2009 16:41:30 -0700
Message-ID: <20091005234130.GA13211@kroah.com>
References: <20091005190324.7013a4bb.sfr@canb.auug.org.au>
 <20091005162135.8965f199.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:41197 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754657AbZJEXm7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 5 Oct 2009 19:42:59 -0400
Content-Disposition: inline
In-Reply-To: <20091005162135.8965f199.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, devel@driverdev.osuosl.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, Oct 05, 2009 at 04:21:35PM -0700, Randy Dunlap wrote:
> On Mon, 5 Oct 2009 19:03:24 +1100 Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > Changes since 20091002:
> 
> 
> drivers/staging/dream/gpio_axis.c:18:30: error: linux/gpio_event.h: No such file or directory

Argh, I'm getting sick of the dream code.  I'll sit down tomorrow and
work it all out, _or_ just delete the tree.

I just deleted drivers/staging/android/ so getting dream support seems a
bit far off :(

thanks,

greg k-h
