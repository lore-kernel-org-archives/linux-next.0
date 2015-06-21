From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: manual merge of the crypto tree with the bluetooth
 tree
Date: Sun, 21 Jun 2015 08:33:32 +0800
Message-ID: <20150621003331.GA26768@gondor.apana.org.au>
References: <20150620162224.24da2d9f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from helcar.hengli.com.au ([209.40.204.226]:59340 "EHLO
	helcar.hengli.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752256AbbFUAdr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 20 Jun 2015 20:33:47 -0400
Content-Disposition: inline
In-Reply-To: <20150620162224.24da2d9f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Gustavo Padovan <gustavo@padovan.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Simon Vincent <simon.vincent@xsilon.com>, Marcel Holtmann <marcel@holtmann.org>

Hi Stephen:

On Sat, Jun 20, 2015 at 04:22:24PM +1000, Stephen Rothwell wrote:
> Hi Herbert,
> 
> Today's linux-next merge of the crypto tree got a conflict in:
> 
>   net/mac802154/llsec.c
> 
> between commit:
> 
>   5b0579850017 ("mac802154: fix llsec authentication without encryption BUG")
> 
> from the bluetooth tree and commit:
> 
>   25528fdae4ab ("mac802154: Switch to new AEAD interface")
> 
> from the crypto tree.
> 
> I just used the crypto tree version (effectively dropping the former
> commit) since it is more extensive and so a better conflict resolution
> is needed.

Actually I think that's all you need to do since the crypto tree
version no longer has the bug in question.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
