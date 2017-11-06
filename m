From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: build failure after merge of the crypto tree
Date: Mon, 6 Nov 2017 13:40:10 +0800
Message-ID: <20171106054010.GA13549@gondor.apana.org.au>
References: <20171106112521.51e44f03@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from orcrist.hmeau.com ([104.223.48.154]:51636 "EHLO
        deadmen.hmeau.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750715AbdKFFkg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Nov 2017 00:40:36 -0500
Content-Disposition: inline
In-Reply-To: <20171106112521.51e44f03@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Boris BREZILLON <boris.brezillon@free-electrons.com>

On Mon, Nov 06, 2017 at 11:25:21AM +1100, Stephen Rothwell wrote:
> Hi Herbert,
> 
> After merging the crypto tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> drivers/crypto/marvell/marvell-cesa: struct platform_device_id is 24 bytes.  The last of 1 is:
> 0x6d 0x76 0x5f 0x63 0x72 0x79 0x70 0x74 0x6f 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
> FATAL: drivers/crypto/marvell/marvell-cesa: struct platform_device_id is not terminated with a NULL entry!
> 
> Caused by commit
> 
>   7b0c3d693ce6 ("crypto: marvell - Add a platform_device_id table")
> 
> I have used the crypto tree from next-20171103 for today.

Thanks Stephen.  I've got a patch that should fix this.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
