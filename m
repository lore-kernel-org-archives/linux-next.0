From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: possible circular locking dependency for
	cryptsetup
Date: Fri, 7 Nov 2008 20:40:23 +0800
Message-ID: <20081107124023.GA12021@gondor.apana.org.au>
References: <20081107083200.GA5109@vimes.madsworld.lan> <20081107203750.91bd0e73.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rhun.apana.org.au ([64.62.148.172]:43885 "EHLO
	arnor.apana.org.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752358AbYKGMkh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 7 Nov 2008 07:40:37 -0500
Content-Disposition: inline
In-Reply-To: <20081107203750.91bd0e73.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Markus Dahms <mad@automagically.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Nov 07, 2008 at 08:37:50PM +1100, Stephen Rothwell wrote:
>
> > =======================================================
> > [ INFO: possible circular locking dependency detected ]
> > 2.6.28-rc3-next-20081106-mad-1 #2
> > -------------------------------------------------------
> > cryptsetup/2554 is trying to acquire lock:
> >  (&cpu_hotplug.lock){--..}, at: [<c012cd32>] get_online_cpus+0x22/0x40
> > 
> > but task is already holding lock:
> >  (&mm->mmap_sem){----}, at: [<c018b98e>] sys_mlockall+0x5e/0xd0

I don't see anything in the back-trace that's crypto related
or even dm related.  Therefore I suspect the problem is in core
sysfs, mm or CPU hot plugging.

Cheers,
-- 
Visit Openswan at http://www.openswan.org/
Email: Herbert Xu ~{PmV>HI~} <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
