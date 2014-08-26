From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH] DRBG: fix bit shifting on 32 bit systems
Date: Tue, 26 Aug 2014 15:32:19 +0800
Message-ID: <20140826073219.GA3880@gondor.apana.org.au>
References: <20140826161456.7ad100e3@canb.auug.org.au>
 <20140826063812.GA3555@gondor.apana.org.au>
 <6371777.WdUEAKFPYo@myon.chronox.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from helcar.apana.org.au ([209.40.204.226]:46683 "EHLO
	helcar.apana.org.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752889AbaHZHc1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 26 Aug 2014 03:32:27 -0400
Content-Disposition: inline
In-Reply-To: <6371777.WdUEAKFPYo@myon.chronox.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephan Mueller <smueller@chronox.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Aug 26, 2014 at 09:31:02AM +0200, Stephan Mueller wrote:
> Use ULL to mark a 64 bit value.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Reported-by: kbuild test robot <fengguang.wu@intel.com>
> Signed-off-by: Stephan Mueller <smueller@chronox.de>

I don't think this works as size_t is still 32-bit which means
that you'll return zero.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
