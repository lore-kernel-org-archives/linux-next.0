From: Greg KH <greg@kroah.com>
Subject: Re: Next March 18: [staging/net ??] build break
Date: Wed, 18 Mar 2009 08:27:15 -0700
Message-ID: <20090318152715.GB8655@kroah.com>
References: <20090318173830.7ea03dfb.sfr@canb.auug.org.au> <49C0D3BF.8060908@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:50220 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752088AbZCRPaD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 18 Mar 2009 11:30:03 -0400
Content-Disposition: inline
In-Reply-To: <49C0D3BF.8060908@in.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sachin Sant <sachinp@in.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, davem@davemloft.net

On Wed, Mar 18, 2009 at 04:28:07PM +0530, Sachin Sant wrote:
> Today's Next randconfig build fails with
>
> drivers/staging/built-in.o: In function .ieee80211_xmit:
> (.text+0x69460): multiple definition of .ieee80211_xmit
> drivers/net/built-in.o:(.text+0x2557e0): first defined here
> ld: Warning: size of symbol .ieee80211_xmit changed from 3688 in 
> drivers/net/built-in.o to 2880 in drivers/staging/built-in.o
> drivers/staging/built-in.o: In function ieee80211_xmit:
> (.opd+0x2ff0): multiple definition of ieee80211_xmit
> drivers/net/built-in.o:(.opd+0xe980): first defined here
> make[1]: *** [drivers/built-in.o] Error 1

Known issue, don't build all the staging wireless drivers into the
kernel tree, you will get conflicting symbols like this.

People are working on this, but it's much lower priority as it isn't a
real use case.

thanks,

greg k-h
