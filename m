From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: build warning after merge of the crypto-current tree
Date: Thu, 8 Dec 2016 17:07:25 +0800
Message-ID: <20161208090725.GC22932@gondor.apana.org.au>
References: <20161208083116.7881820c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from helcar.hengli.com.au ([209.40.204.226]:46109 "EHLO
        helcar.apana.org.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751225AbcLHJHd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Dec 2016 04:07:33 -0500
Content-Disposition: inline
In-Reply-To: <20161208083116.7881820c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephan Mueller <smueller@chronox.de>

On Thu, Dec 08, 2016 at 08:31:16AM +1100, Stephen Rothwell wrote:
> Hi Herbert,
> 
> After merging the crypto-current tree, today's linux-next build (x86_64
> allmodconig) produced this warning:
> 
> crypto/algif_aead.c: In function 'aead_recvmsg':
> crypto/algif_aead.c:539:9: warning: 'outlen' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   return err ? err : outlen;
>          ^
> crypto/algif_aead.c:423:9: note: 'outlen' was declared here
>   size_t outlen;
>          ^
> 
> Introduced by commit
> 
>   0c1e16cd1ec4 ("crypto: algif_aead - fix AEAD tag memory handling")

Thanks Stephen.  This should be fixed in tomorrow's tree.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
