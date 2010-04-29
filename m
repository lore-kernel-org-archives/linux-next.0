From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build warning after merge of the
 driver-core.current tree
Date: Thu, 29 Apr 2010 16:43:47 -0700
Message-ID: <20100429234347.GA16141@kroah.com>
References: <20100430093534.9fc6ab8f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:40644 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758844Ab0D3Rdd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 30 Apr 2010 13:33:33 -0400
Content-Disposition: inline
In-Reply-To: <20100430093534.9fc6ab8f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, Tomas Winkler <tomas.winkler@intel.com>

On Fri, Apr 30, 2010 at 09:35:34AM +1000, Stephen Rothwell wrote:
> Hi Grant,
> 
> After merging the driver-core.current tree, today's linux-next build
> (x86_64 allmodconfig) produced this warning:
> 
> drivers/base/firmware_class.c: In function 'release_firmware':
> drivers/base/firmware_class.c:597: warning: passing argument 1 of 'firmware_free_data' discards qualifiers from pointer target type
> drivers/base/firmware_class.c:133: note: expected 'struct firmware *' but argument is of type 'const struct firmware *'
> 
> Introduced by commit 6454d23dedf4019fcae868818ae63c755dd42be0
> ("firmware_class: fix memory leak - free allocated pages").

Thanks, I've fixed this up, the release call should not have 'const'
on it as it is going to touch the pointer passed to it :)

thanks,

greg k-h
