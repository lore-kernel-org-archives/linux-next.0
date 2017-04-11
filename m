From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: manual merge of the crypto tree with the kbuild tree
Date: Tue, 11 Apr 2017 10:42:15 +0800
Message-ID: <20170411024215.GA10664@gondor.apana.org.au>
References: <20170411102119.102f4675@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from orcrist.hmeau.com ([104.223.48.154]:57958 "EHLO
        deadmen.hmeau.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752433AbdDKCmZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 10 Apr 2017 22:42:25 -0400
Content-Disposition: inline
In-Reply-To: <20170411102119.102f4675@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicolas Dichtel <nicolas.dichtel@6wind.com>

On Tue, Apr 11, 2017 at 10:21:19AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the crypto tree got a conflict in:
> 
>   include/linux/crypto.h
> 
> between commit:
> 
>   c394d1683e7c ("cryptouser.h: fix include from userland")
> 
> from the kbuild tree and commit:
> 
>   f437a3f477cc ("crypto: api - Extend algorithm name limit to 128 bytes")
> 
> from the crypto tree.
> 
> I fixed it up (I used the former version of this file and added the
> following merge fix patch) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Actually the patch in the kbuild tree should be reverted because
we have now increased the in-kernel length limit and this must not
be directly exposed to user-space or it'll break compatibility.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
