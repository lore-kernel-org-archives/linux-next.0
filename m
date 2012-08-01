From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH v2] powerpc/crypto: fix defconfig break
Date: Wed, 1 Aug 2012 17:49:31 +0800
Message-ID: <20120801094931.GA15975@gondor.apana.org.au>
References: <1343794529-28329-1-git-send-email-sjenning@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from sting.hengli.com.au ([178.18.18.71]:55070 "EHLO
	fornost.hengli.com.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753601Ab2HAJto (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 1 Aug 2012 05:49:44 -0400
Content-Disposition: inline
In-Reply-To: <1343794529-28329-1-git-send-email-sjenning@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Seth Jennings <sjenning@linux.vnet.ibm.com>
Cc: Michael Neuling <mikey@neuling.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Kent Yoder <key@linux.vnet.ibm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, anton@samba.org

On Tue, Jul 31, 2012 at 11:15:29PM -0500, Seth Jennings wrote:
> As part of the Kconfig rework for drivers/crypto/nx, the meaning of
> CONFIG_CRYPTO_DEV_NX was changed.  At the same time this commit was
> heading upstream
> 
> fd297b3a7302ab866306f53c1fd1e97b083fe83e
> powerpc: Enable pseries hardware RNG and crypto module
> 
> still used the old meaning, set CONFIG_CRYPTO_DEV_NX=m when it
> is now a bool in the Kconfig.  This patch repairs the break.
> 
> Reported-by: Michael Neuling <mikey@neuling.org>
> Signed-off-by: Seth Jennings <sjenning@linux.vnet.ibm.com>
> ---
> This patch is based on Linus master which already contains
> the commit above.  Please apply this patch before my patchset
> (powerpc/crypto: IBM Power7+ in-Nest compression support) to
> avoid the defconfig break.

OK, I've rebased my tree and folded this into

commit 322cacce0a3c36d3ad89d8836b9ed6fcb06e1a61
Author: Seth Jennings <sjenning@linux.vnet.ibm.com>
Date:   Thu Jul 19 09:42:38 2012 -0500

    powerpc/crypto: rework Kconfig

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
