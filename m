From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: manual merge of the crypto tree with the kbuild tree
Date: Tue, 11 Apr 2017 13:12:28 +0800
Message-ID: <20170411051228.GA10951@gondor.apana.org.au>
References: <20170411102119.102f4675@canb.auug.org.au>
 <20170411024215.GA10664@gondor.apana.org.au>
 <20170411150250.49996951@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from orcrist.hmeau.com ([104.223.48.154]:41318 "EHLO
        deadmen.hmeau.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753273AbdDKFMk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 11 Apr 2017 01:12:40 -0400
Content-Disposition: inline
In-Reply-To: <20170411150250.49996951@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicolas Dichtel <nicolas.dichtel@6wind.com>

On Tue, Apr 11, 2017 at 03:02:50PM +1000, Stephen Rothwell wrote:
>
> So basically we need CRYPTO_MAX_ALG_NAME to be 64 in the exported
> header but 128 in the kernel header?  In which case the kbuild patch
> needs to be changed not removed.  Or the merge resolution needs to be
> cleverer.

Actually the kbuild patch just needs to be reverted.  We should
not export CRYPTO_MAX_ALG_NAME at all.  Each user-space interface
that uses it already has its own limit and should not refer to the
in-kernel value.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
