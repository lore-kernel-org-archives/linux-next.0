From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH -next] staging: fix arlan build-braces
Date: Tue, 11 May 2010 14:13:09 -0700
Message-ID: <20100511211309.GA18363@kroah.com>
References: <20100506151502.f97afe54.sfr@canb.auug.org.au>
 <20100506164303.510040dd.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:46382 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751219Ab0EKVRB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 11 May 2010 17:17:01 -0400
Content-Disposition: inline
In-Reply-To: <20100506164303.510040dd.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, devel@driverdev.osuosl.org

On Thu, May 06, 2010 at 04:43:03PM -0700, Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> The braces on the writeControlRegister() macro are not sufficient
> (at least for one version of gcc):
> 
> drivers/staging/arlan/arlan-main.c:230: error: 'else' without a previous 'if'

This driver is now deleted, so I can't apply the patch :)

thanks,

greg k-h
