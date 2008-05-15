From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: i2c/driver-core merge conflict
Date: Wed, 14 May 2008 20:09:42 -0700
Message-ID: <20080515030942.GA1638@kroah.com>
References: <20080515120006.b336a720.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pentafluge.infradead.org ([213.146.154.40]:55656 "EHLO
	pentafluge.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750999AbYEODMR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 14 May 2008 23:12:17 -0400
Content-Disposition: inline
In-Reply-To: <20080515120006.b336a720.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jean Delvare <khali@linux-fr.org>, linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>

On Thu, May 15, 2008 at 12:00:06PM +1000, Stephen Rothwell wrote:
> Hi Jean, Greg,
> 
> Today's linux-next merge of the i2c tree got a conflict in
> include/linux/i2c.h between commit
> e38c93bf253cb3176478a1943cd2306e8413d2bb ("driver core: remove
> KOBJ_NAME_LEN define") from the driver-core tree and commit
> f625810ef235a8b238427df3129792f89187c085 ("i2c: Kill the old driver
> matching scheme") from the i2c tree.  The former changes the definition
> of driver_name in two places, the letter removes the definitions.  I went
> with the latter.

Thanks, that should be the correct one.

greg k-h
