From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: Signed-off-by missing for commit in the crypto tree
Date: Fri, 4 Aug 2017 09:29:55 +0800
Message-ID: <20170804012955.GA15200@gondor.apana.org.au>
References: <20170804075022.02c9ce09@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from orcrist.hmeau.com ([104.223.48.154]:46270 "EHLO
        deadmen.hmeau.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751811AbdHDBaG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Aug 2017 21:30:06 -0400
Content-Disposition: inline
In-Reply-To: <20170804075022.02c9ce09@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rabin Vincent <rabinv@axis.com>, Lars Persson <larper@axis.com>

On Fri, Aug 04, 2017 at 07:50:22AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   9577212cc0e2 ("crypto: hash - add crypto_(un)register_ahashes()")
> 
> is missing a Signed-off-by from its author.

OK, I've backed out the patches in question.  Please resubmit
with a sign-off.  Thanks!
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
