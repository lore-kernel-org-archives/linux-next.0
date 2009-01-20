From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: crypto tree build failure
Date: Tue, 20 Jan 2009 15:57:58 +1100
Message-ID: <20090120045758.GA19237@gondor.apana.org.au>
References: <20090120133043.29efee3f.sfr@canb.auug.org.au> <1232420667.13948.62.camel@yhuang-dev.sh.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rhun.apana.org.au ([64.62.148.172]:34216 "EHLO
	arnor.apana.org.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753445AbZATE6D (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 19 Jan 2009 23:58:03 -0500
Content-Disposition: inline
In-Reply-To: <1232420667.13948.62.camel@yhuang-dev.sh.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Huang Ying <ying.huang@intel.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>

On Tue, Jan 20, 2009 at 11:04:27AM +0800, Huang Ying wrote:
>
> I don't know why. But it seems that asm/aes.h is not included in git,
> while it is in my original patch. I will submit a fix patch.

Don't worry.  I'll fix it up in my tree.

Thanks,
-- 
Visit Openswan at http://www.openswan.org/
Email: Herbert Xu ~{PmV>HI~} <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
