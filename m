From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the watchdog
 tree
Date: Wed, 2 Mar 2016 09:43:54 -0800
Message-ID: <20160302174354.GB24233@kroah.com>
References: <20160302143127.6a17dc75@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:55433 "EHLO
	out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755668AbcCBRn4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Mar 2016 12:43:56 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.nyi.internal (Postfix) with ESMTP id BF7C92083D
	for <linux-next@vger.kernel.org>; Wed,  2 Mar 2016 12:43:55 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20160302143127.6a17dc75@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Wim Van Sebroeck <wim@iguana.be>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tomas Winkler <tomas.winkler@intel.com>, Kyle Roeschley <kyle.roeschley@ni.com>

On Wed, Mar 02, 2016 at 02:31:27PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got conflicts in:
> 
>   drivers/watchdog/Kconfig
>   drivers/watchdog/Makefile
> 
> between commit:
> 
>   70f3997667fb ("watchdog: ni903x_wdt: Add NI 903x/913x watchdog driver")
> 
> from the watchdog tree and commit:
> 
>   222818c3d84c ("watchdog: mei_wdt: implement MEI iAMT watchdog driver")
> 
> from the staging tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).


Looks good to me, thanks.

greg k-h
