From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: Tree for November 23
Date: Tue, 24 Nov 2009 09:24:54 +1030
Message-ID: <200911240924.54675.rusty@rustcorp.com.au>
References: <20091123185232.1423c56b.sfr@canb.auug.org.au> <20091123111510.9b0c0714.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:38279 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755951AbZKWWyw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Nov 2009 17:54:52 -0500
In-Reply-To: <20091123111510.9b0c0714.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, 24 Nov 2009 05:45:10 am Randy Dunlap wrote:
> On Mon, 23 Nov 2009 18:52:32 +1100 Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > Changes since 20091120:
> 
> 
> Hey rr,
> 
> This patch "param\:remove-useless-writable-charp.patch" has several typos
> that cause build errors in drivers/staging/.  I sent patches for these errors
> to gregkh but he couldn't apply them.  Please build STAGING (drivers/staging/)
> crap along with other build testing when you make changes.

Hi Randy,

    Fixed.  And I guess linux-next doesn't build staging?  Seems a fair call,
I should have done so.

Thanks,
Rusty.
