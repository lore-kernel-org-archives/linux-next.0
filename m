From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH] crypto: fix compile errors of XTS
Date: Wed, 17 Feb 2016 07:55:21 +0000
Message-ID: <20160217075521.GC16041@gondor.apana.org.au>
References: <17540790.vcykgraQyO@positron.chronox.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from helcar.hengli.com.au ([209.40.204.226]:53750 "EHLO
	helcar.hengli.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756755AbcBQHze (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 17 Feb 2016 02:55:34 -0500
Content-Disposition: inline
In-Reply-To: <17540790.vcykgraQyO@positron.chronox.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephan Mueller <smueller@chronox.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next <linux-next@vger.kernel.org>, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, kbuild test robot <fengguang.wu@intel.com>

On Wed, Feb 17, 2016 at 07:00:01AM +0100, Stephan Mueller wrote:
> Commit 28856a9e52c7 missed the addition of the crypto/xts.h include file
> for different architecture-specific AES implementations.
> 
> Signed-off-by: Stephan Mueller <smueller@chronox.de>

Applied.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
