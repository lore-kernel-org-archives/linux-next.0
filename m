From: Dmitry Torokhov <dtor@vmware.com>
Subject: Re: linux-next: build failure after merge of the rr tree
Date: Wed, 9 Feb 2011 00:36:35 -0800
Message-ID: <20110209083634.GA29918@dtor-ws.eng.vmware.com>
References: <20110209130115.f340396e.sfr@canb.auug.org.au>
 <201102091243.46227.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp-outbound-2.vmware.com ([65.115.85.73]:5528 "EHLO
	smtp-outbound-2.vmware.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752630Ab1BIIgf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 9 Feb 2011 03:36:35 -0500
Content-Disposition: inline
In-Reply-To: <201102091243.46227.rusty@rustcorp.com.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Feb 08, 2011 at 06:13:46PM -0800, Rusty Russell wrote:
> On Wed, 9 Feb 2011 12:31:15 pm Stephen Rothwell wrote:
> > Hi Rusty,
> > 
> > After merging the rr tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> > 
> > drivers/net/myri10ge/myri10ge.c: In function 'myri10ge_select_firmware':
> > drivers/net/myri10ge/myri10ge.c:3341: error: request for member 'perm' in something not a structure or union
> > drivers/net/myri10ge/myri10ge.c:3341: error: request for member 'perm' in something not a structure or union
> > drivers/net/myri10ge/myri10ge.c:3341: error: request for member 'perm' in something not a structure or union
> > drivers/net/myri10ge/myri10ge.c:3349: error: request for member 'perm' in something not a structure or union
> > drivers/net/myri10ge/myri10ge.c:3349: error: request for member 'perm' in something not a structure or union
> > drivers/net/myri10ge/myri10ge.c:3349: error: request for member 'perm' in something not a structure or union
> > 
> > Caused by commit b3e402b450f954d0a8ec04e05433654d4a9df2a6 ("module: deal
> > with alignment issues in built-in module parameters") so I have used the
> > rr tree from next-20110208 for today.
> 
> Thanks!  Fix is obvious, I will write it now...
> 

Sorry about this. None of the drivers using kparam_block_sysfs_write()
happened to be enabled in my .config.

Thanks,
Dmitry
