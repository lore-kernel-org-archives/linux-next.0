From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: manual merge of the crypto tree with the kbuild tree
Date: Tue, 11 Apr 2017 15:19:51 +0800
Message-ID: <20170411071951.GA11474@gondor.apana.org.au>
References: <20170411102119.102f4675@canb.auug.org.au>
 <20170411024215.GA10664@gondor.apana.org.au>
 <20170411150250.49996951@canb.auug.org.au>
 <20170411051228.GA10951@gondor.apana.org.au>
 <CAK7LNASQ5qvYcy3TQ_meQDtSsjDDQn-TW_P9CRaENwP2ioZkQA@mail.gmail.com>
 <20170411064009.GA11311@gondor.apana.org.au>
 <CAK7LNASesrB5bEvFGxO_BbnqA-h0+TCxMQsmtbv3zqS7gNMe1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from orcrist.hmeau.com ([104.223.48.154]:46938 "EHLO
        deadmen.hmeau.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753457AbdDKHUF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 11 Apr 2017 03:20:05 -0400
Content-Disposition: inline
In-Reply-To: <CAK7LNASesrB5bEvFGxO_BbnqA-h0+TCxMQsmtbv3zqS7gNMe1Q@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicolas Dichtel <nicolas.dichtel@6wind.com>

On Tue, Apr 11, 2017 at 04:00:45PM +0900, Masahiro Yamada wrote:
>
> Commit 4473710df1f8 fixed the problem,
> but reverting the patch in kbuild will break the bisect'ability
> of the kbuild tree.

All you will be doing is reverting to the status quo before you
applied that patch.  So I don't see how this can break anything
that wasn't already broken.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
