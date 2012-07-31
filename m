From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: CRYPTO_DEV_NX merge problem (Re: linux-next: Tree for July 31)
Date: Wed, 01 Aug 2012 08:15:51 +1000
Message-ID: <1343772951.16975.18.camel@pasglop>
References: <20120731152614.de6ebe9e0d4b8fc6645b793a@canb.auug.org.au>
	 <31974.1343714338@neuling.org> <5017DE06.3000103@linux.vnet.ibm.com>
	 <19970.1343772018@neuling.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:56658 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754457Ab2GaWQR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 31 Jul 2012 18:16:17 -0400
In-Reply-To: <19970.1343772018@neuling.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Neuling <mikey@neuling.org>
Cc: Seth Jennings <sjenning@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Kent Yoder <key@linux.vnet.ibm.com>, anton@samba.org, Herbert Xu <herbert@gondor.hengli.com.au>

On Wed, 2012-08-01 at 08:00 +1000, Michael Neuling wrote:
> 
> OK.  Please post the fix as a patch.  Anton's patch is already in the
> powerpc next tree so it won't be changed/rebased directly.  
> 
> I'm not sure who can carry this, since the crypto tree doesn't have
> Anton's change and the powerpc tree doesn't have Seth's change.
> 
> sfr: who normally carries it when we have a merge issue like this?
> You?

There is no powerpc -next tree at this point, Anton patch is either
upstream or in no tree.

Cheers,
Ben.
