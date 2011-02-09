From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: build failure after merge of the rr tree
Date: Wed, 9 Feb 2011 12:43:46 +1030
Message-ID: <201102091243.46227.rusty@rustcorp.com.au>
References: <20110209130115.f340396e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:41288 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751961Ab1BICNu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Feb 2011 21:13:50 -0500
In-Reply-To: <20110209130115.f340396e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Torokhov <dtor@vmware.com>

On Wed, 9 Feb 2011 12:31:15 pm Stephen Rothwell wrote:
> Hi Rusty,
> 
> After merging the rr tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> drivers/net/myri10ge/myri10ge.c: In function 'myri10ge_select_firmware':
> drivers/net/myri10ge/myri10ge.c:3341: error: request for member 'perm' in something not a structure or union
> drivers/net/myri10ge/myri10ge.c:3341: error: request for member 'perm' in something not a structure or union
> drivers/net/myri10ge/myri10ge.c:3341: error: request for member 'perm' in something not a structure or union
> drivers/net/myri10ge/myri10ge.c:3349: error: request for member 'perm' in something not a structure or union
> drivers/net/myri10ge/myri10ge.c:3349: error: request for member 'perm' in something not a structure or union
> drivers/net/myri10ge/myri10ge.c:3349: error: request for member 'perm' in something not a structure or union
> 
> Caused by commit b3e402b450f954d0a8ec04e05433654d4a9df2a6 ("module: deal
> with alignment issues in built-in module parameters") so I have used the
> rr tree from next-20110208 for today.

Thanks!  Fix is obvious, I will write it now...

Cheers,
Rusty.
