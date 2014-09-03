From: Stephan Mueller <smueller@chronox.de>
Subject: Re: [PATCH v2] DRBG: remove check for uninitialized DRBG handle
Date: Thu, 04 Sep 2014 01:50:32 +0200
Message-ID: <8246803.Qk7EMfoFYT@myon.chronox.de>
References: <20140826161456.7ad100e3@canb.auug.org.au> <3575659.BooajjTQie@myon.chronox.de> <20140903232129.GA32264@gondor.apana.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.eperm.de ([89.247.134.16]:47011 "EHLO mail.eperm.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S935535AbaICXuk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Sep 2014 19:50:40 -0400
Received: from myon.chronox.de
	by mail.eperm.de with [XMail 1.27 ESMTP Server]
	id <S37A> for <linux-next@vger.kernel.org> from <smueller@chronox.de>;
	Thu, 4 Sep 2014 01:50:34 +0200
In-Reply-To: <20140903232129.GA32264@gondor.apana.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Am Donnerstag, 4. September 2014, 07:21:29 schrieb Herbert Xu:

Hi Herbert,

> On Wed, Sep 03, 2014 at 03:33:16AM +0200, Stephan Mueller wrote:
> > Am Montag, 1. September 2014, 07:11:20 schrieb Stephan Mueller:
> > 
> > Hi Herbert,
> > 
> > may I ask for consideration of this patch as this covers an oops FIPS
> > mode?
> > 
> > In addition, may I ask for guidance on how to fix the 32 bit code path in
> > Linus' tree as asked on 28.8? To quote: "Thus, the fix in
> > b9347aff91ce4789619168539f08202d8d6a1177 works. However, this
> > patch is based on 05c81ccd9087d238c10b234eadb55632742e5518. So, if we want
> > to fix Linus' tree with minimal impact, either these two patches are
> > pushed to Linus or I have to port
> > b9347aff91ce4789619168539f08202d8d6a1177 to the current Linus tree."
> 
> I will take care of this.

Thank you.
> 
> Cheers,


-- 
Ciao
Stephan
