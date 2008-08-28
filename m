From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the crypto tree
Date: Thu, 28 Aug 2008 09:28:58 +0200
Message-ID: <20080828072858.GF21875@elte.hu>
References: <20080807133525.8901e2ef.sfr@canb.auug.org.au> <20080825164418.3e74cad0.sfr@canb.auug.org.au> <20080825065525.GA23089@gondor.apana.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:37108 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753175AbYH1H3W (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 28 Aug 2008 03:29:22 -0400
Content-Disposition: inline
In-Reply-To: <20080825065525.GA23089@gondor.apana.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Suresh Siddha <suresh.b.siddha@intel.com>, Austin Zhang <austin.zhang@intel.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>


* Herbert Xu <herbert@gondor.apana.org.au> wrote:

> > The fixup looks like below.  Maybe the X86_FEATURE_XMM4_2 bits could 
> > also
> 
> Yep looks good.
> 
> > be added in the x86 tree.
> 
> Sure that sounds like a good idea.

they are upstream now:

| commit 2a61812af2e564cba2c8170cf96e1c823210f619
| Author: Austin Zhang <austin_zhang@linux.intel.com>
| Date:   Mon Aug 25 11:14:51 2008 -0400
|
|     x86: add X86_FEATURE_XMM4_2 definitions

so you should be able to pick this up once you merge linus-latest to the 
crypto tree.

	Ingo
