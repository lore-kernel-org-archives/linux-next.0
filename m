From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: bkl-removal build failure
Date: Mon, 19 May 2008 21:43:58 -0700
Message-ID: <20080520044358.GA30910@kroah.com>
References: <20080519163203.89a54b82.sfr@canb.auug.org.au> <4642.1211217165@vena.lwn.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pentafluge.infradead.org ([213.146.154.40]:49728 "EHLO
	pentafluge.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932244AbYETP1o (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 20 May 2008 11:27:44 -0400
Content-Disposition: inline
In-Reply-To: <4642.1211217165@vena.lwn.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Mon, May 19, 2008 at 11:12:45AM -0600, Jonathan Corbet wrote:
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> > 
> > drivers/char/viotape.c: In function 'viotap_open':
> > /scratch/sfr/next/drivers/char/viotape.c:692: error: expected ';' before 'get_dev_info'
> 
> Well, that's embarrassing.  There are limits to what can be done with
> "make allyesconfig" when you only have one architecture at hand...:)

Andrew has a set of pre-built cross-compilers that can help out with
this at:
	http://userweb.kernel.org/~akpm/cross-compilers/

that ends up working very well for this.  I'm ashamed I haven't been
using them all along...

thanks,

greg k-h
