From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: manual merge of the crypto tree with the powerpc
 tree
Date: Thu, 17 May 2012 13:22:36 +1000
Message-ID: <20120517032236.GA11236@gondor.apana.org.au>
References: <20120517132116.8a5378bce254fc39d20cb08a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from sting.hengli.com.au ([178.18.18.71]:49490 "EHLO
	fornost.hengli.com.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1760940Ab2EQDWr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 May 2012 23:22:47 -0400
Content-Disposition: inline
In-Reply-To: <20120517132116.8a5378bce254fc39d20cb08a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andreas Westin <andreas.westin@stericsson.com>, Kent Yoder <key@linux.vnet.ibm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org

On Thu, May 17, 2012 at 01:21:16PM +1000, Stephen Rothwell wrote:
> Hi Herbert,
> 
> Today's linux-next merge of the crypto tree got a conflict in
> drivers/crypto/Kconfig between commit aef7b31c8833 ("powerpc/crypto:
> Build files for the nx device driver") from the powerpc tree and commit
> 2789c08fffea ("crypto: ux500 - Add driver for CRYP hardware") from the
> crypto tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

Looks fine.  Thanks Stephen!
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
