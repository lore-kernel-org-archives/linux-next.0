From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Mar 11 (powerpc build failure due to vmx
 crypto code)
Date: Wed, 11 Mar 2015 08:47:17 -0700
Message-ID: <20150311154717.GA22169@roeck-us.net>
References: <20150311163558.6a09cfcc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:32976 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751138AbbCKPrZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 Mar 2015 11:47:25 -0400
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1YViqy-002Wxn-MW
	for linux-next@vger.kernel.org; Wed, 11 Mar 2015 15:47:24 +0000
Content-Disposition: inline
In-Reply-To: <20150311163558.6a09cfcc@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Leonidas S. Barbosa" <leosilva@linux.vnet.ibm.com>, Herbert Xu <herbert@gondor.apana.org.au>

On Wed, Mar 11, 2015 at 04:35:58PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20150310:
> 
> New tree: drm-exynos
> 
> The sound-asoc tree still had its build failure so I used the version from
> next-20150306.
> 
> The regulator tree lost its build failure.
> 
> The tip tree gained a conflict against the usb-gadget-fixes tree.
> 
> The staging tree lost its build failure.
> 
> Non-merge commits (relative to Linus' tree): 3446
>  3448 files changed, 138744 insertions(+), 73083 deletions(-)
> 
> ----------------------------------------------------------------------------
> 

Building powerpc:allmodconfig:

ERROR: ".aes_p8_cbc_encrypt" [drivers/crypto/vmx/vmx-crypto.ko] undefined!
ERROR: ".aes_p8_set_encrypt_key" [drivers/crypto/vmx/vmx-crypto.ko] undefined!
ERROR: ".aes_p8_set_decrypt_key" [drivers/crypto/vmx/vmx-crypto.ko] undefined!
ERROR: ".gcm_init_p8" [drivers/crypto/vmx/vmx-crypto.ko] undefined!
ERROR: ".aes_p8_decrypt" [drivers/crypto/vmx/vmx-crypto.ko] undefined!
ERROR: ".aes_p8_encrypt" [drivers/crypto/vmx/vmx-crypto.ko] undefined!
ERROR: ".gcm_ghash_p8" [drivers/crypto/vmx/vmx-crypto.ko] undefined!
ERROR: ".aes_p8_ctr32_encrypt_blocks" [drivers/crypto/vmx/vmx-crypto.ko] undefined!

Those functions are called but don't seem to be defined anywhere.

Caused by 'crypto: vmx - Adding VMX module for Power 8' and related patches.

Guenter
