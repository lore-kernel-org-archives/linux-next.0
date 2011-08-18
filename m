From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH] evm: add Kconfig TCG_TPM dependency
Date: Thu, 18 Aug 2011 10:38:17 -0700
Message-ID: <20110818103817.80b585a0.rdunlap@xenotime.net>
References: <1313621496-8308-1-git-send-email-zohar@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy8-pub.bluehost.com ([69.89.22.20]:44328 "HELO
	oproxy8-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751236Ab1HRRiT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 18 Aug 2011 13:38:19 -0400
In-Reply-To: <1313621496-8308-1-git-send-email-zohar@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mimi Zohar <zohar@linux.vnet.ibm.com>
Cc: linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, James Morris <jmorris@namei.org>, Stephen Rothwell <sfr@canb.auug.org.au>, David Safford <safford@watson.ibm.com>, Mimi Zohar <zohar@us.ibm.com>

On Wed, 17 Aug 2011 18:51:36 -0400 Mimi Zohar wrote:

> Although the EVM encrypted-key should be encrypted/decrypted using a
> trusted-key, a user-defined key could be used instead. When using a user-
> defined key, a TCG_TPM dependency should not be required.  Unfortunately,
> the encrypted-key code needs to be refactored a bit in order to remove
> this dependency.
> 
> This patch adds the TCG_TPM dependency.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>,
> 	     Randy Dunlap <rdunlap@xenotimenet>
> Signed-off-by: Mimi Zohar <zohar@us.ibm.com>

Acked-by: Randy Dunlap <rdunlap@xenotime.net>

Thanks.

> ---
>  security/integrity/evm/Kconfig |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/security/integrity/evm/Kconfig b/security/integrity/evm/Kconfig
> index 444877d..884617d 100644
> --- a/security/integrity/evm/Kconfig
> +++ b/security/integrity/evm/Kconfig
> @@ -1,6 +1,6 @@
>  config EVM
>  	boolean "EVM support"
> -	depends on SECURITY && KEYS
> +	depends on SECURITY && KEYS && TCG_TPM
>  	select CRYPTO_HMAC
>  	select CRYPTO_MD5
>  	select CRYPTO_SHA1
> -- 


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
