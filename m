From: Ted Ts'o <tytso@mit.edu>
Subject: Re: [PATCH -next] ext4: get rid of compile warning
Date: Mon, 20 Feb 2012 22:13:48 -0500
Message-ID: <20120221031348.GD25249@thunk.org>
References: <20120220125655.GA2651@osiris.boeblingen.de.ibm.com>
 <4F426E05.1000600@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from li9-11.members.linode.com ([67.18.176.11]:33864 "EHLO
	test.thunk.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750761Ab2BUDNy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Feb 2012 22:13:54 -0500
Content-Disposition: inline
In-Reply-To: <4F426E05.1000600@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, linux-next@vger.kernel.org

On Mon, Feb 20, 2012 at 08:00:05AM -0800, Randy Dunlap wrote:
> On 02/20/2012 04:56 AM, Heiko Carstens wrote:
> >Get rid of this one:
> >
> >fs/ext4/balloc.c: In function 'ext4_wait_block_bitmap':
> >fs/ext4/balloc.c:405:3: warning: format '%llu' expects argument of
> >   type 'long long unsigned int', but argument 6 has type 'sector_t' [-Wformat]
> >
> >Happens because sector_t is u64 (unsigned long long) or unsigned long
> >dependent on CONFIG_64BIT.
> >
> >Signed-off-by: Heiko Carstens<heiko.carstens@de.ibm.com>
> 
> I sent the same patch on Jan. 30.  I wonder what happened to it?
> 
> Acked-by: Randy Dunlap <rdunlap@xenotime.net>

Applied, thanks.  Sorry, Randy for not getting to your patch before
this.  I tend to review and apply patches in a fairly bursty fashion.

       	        	      	 	    	  - Ted
