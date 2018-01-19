From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: build warning after merge of the crypto tree
Date: Fri, 19 Jan 2018 16:12:28 +1100
Message-ID: <20180119051228.GA29033@gondor.apana.org.au>
References: <20180119124926.1c22bb19@canb.auug.org.au>
 <2a629f26-de6b-803e-a07b-4cfec3b59d13@chelsio.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from [128.1.224.119] ([128.1.224.119]:55548 "EHLO ringil.hmeau.com"
        rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
        id S1750720AbeASFMj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 19 Jan 2018 00:12:39 -0500
Content-Disposition: inline
In-Reply-To: <2a629f26-de6b-803e-a07b-4cfec3b59d13@chelsio.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Harsh Jain <harsh@chelsio.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Jan 19, 2018 at 09:51:43AM +0530, Harsh Jain wrote:
> Hi Herbert,
> 
> It's an indentation issue. Seems checkpatch and default compile options does not report this warning.
> 
> How would you like to take the fix. Should I sent whole series again with fix or only indentation patch.

Please send an incremental patch.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
