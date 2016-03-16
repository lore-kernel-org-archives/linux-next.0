From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: build failure after merge of the rdma tree
Date: Wed, 16 Mar 2016 14:49:53 +0800
Message-ID: <20160316064953.GA28157@gondor.apana.org.au>
References: <20160316121538.6d5a773b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from helcar.hengli.com.au ([209.40.204.226]:34020 "EHLO
	helcar.hengli.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934569AbcCPGub (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 Mar 2016 02:50:31 -0400
Content-Disposition: inline
In-Reply-To: <20160316121538.6d5a773b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Doug Ledford <dledford@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Faisal Latif <faisal.latif@intel.com>

On Wed, Mar 16, 2016 at 12:15:38PM +1100, Stephen Rothwell wrote:
> Hi Doug,
> 
> After merging the rdma tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> In file included from drivers/infiniband/hw/i40iw/i40iw.h:57:0,
>                  from drivers/infiniband/hw/i40iw/i40iw_cm.c:63:
> drivers/infiniband/hw/i40iw/i40iw_osdep.h:175:12: warning: 'struct hash_desc' declared inside parameter list
>             u32 length, u32 value);
>             ^
> 
> And it went downhill badly after that.
> 
> Caused by commit
> 
>   896545098777 ("crypto: hash - Remove crypto_hash interface")
> 
> from the crypto tree interacting with commits
> 
>   786c6adb3a94 ("i40iw: add puda code")
>   4e9042e647ff ("i40iw: add hw and utils files")
> 
> (at least) from the rdma tree.
> 
> Its a bit of a pain finding these conflicts now - it would have been
> better a few weeks ago.
> 
> For now, all I can do is to use the rdma tree from next-20160315 for
> today.
> 
> Herbert, any hints for Doug, Faisal?

crypto_hash is obsolete.  You should be using shash if your input
is completely linear or ahash if you need SG lists.  For an example
of how you can do the conversion, have a look at

commit 69110e3cedbb8aad1c70d91ed58a9f4f0ed9eec6
Author: Herbert Xu <herbert@gondor.apana.org.au>
Date:   Sun Jan 24 21:19:52 2016 +0800

    iscsi-target: Use shash and ahash

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
