From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: crypto tree build failure
Date: Tue, 11 Nov 2008 12:22:59 +0800
Message-ID: <20081111042259.GB8251@gondor.apana.org.au>
References: <20081111150731.c8826d1e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rhun.apana.org.au ([64.62.148.172]:33339 "EHLO
	arnor.apana.org.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1750787AbYKKEXC (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 10 Nov 2008 23:23:02 -0500
Content-Disposition: inline
In-Reply-To: <20081111150731.c8826d1e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Tue, Nov 11, 2008 at 03:07:31PM +1100, Stephen Rothwell wrote:
> Hi Herbert,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> ERROR: ".crc32c" [net/ipv4/netfilter/nf_nat_proto_sctp.ko] undefined!
> 
> I am not quite sure which commit caused this, but there are recent
> commits to the crypto tree that play with crc32c, so I am dropping the
> crypto tree for today.

I've just pushed an update to master which should fix this issue.

Cheers,
-- 
Visit Openswan at http://www.openswan.org/
Email: Herbert Xu ~{PmV>HI~} <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
