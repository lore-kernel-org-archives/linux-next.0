From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: manual merge of the crypto tree
Date: Thu, 28 Aug 2008 17:33:59 +1000
Message-ID: <20080828073359.GB28648@gondor.apana.org.au>
References: <20080807133525.8901e2ef.sfr@canb.auug.org.au> <20080825164418.3e74cad0.sfr@canb.auug.org.au> <20080825065525.GA23089@gondor.apana.org.au> <20080828072858.GF21875@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rhun.apana.org.au ([64.62.148.172]:46378 "EHLO
	arnor.apana.org.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752917AbYH1HeN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 28 Aug 2008 03:34:13 -0400
Content-Disposition: inline
In-Reply-To: <20080828072858.GF21875@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Suresh Siddha <suresh.b.siddha@intel.com>, Austin Zhang <austin.zhang@intel.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>

On Thu, Aug 28, 2008 at 09:28:58AM +0200, Ingo Molnar wrote:
>
> | commit 2a61812af2e564cba2c8170cf96e1c823210f619
> | Author: Austin Zhang <austin_zhang@linux.intel.com>
> | Date:   Mon Aug 25 11:14:51 2008 -0400
> |
> |     x86: add X86_FEATURE_XMM4_2 definitions
> 
> so you should be able to pick this up once you merge linus-latest to the 
> crypto tree.

Thanks I'll do a rebase.
-- 
Visit Openswan at http://www.openswan.org/
Email: Herbert Xu ~{PmV>HI~} <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
