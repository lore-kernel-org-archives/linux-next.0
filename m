From: Michael Neuling <mikey@neuling.org>
Subject: Re: [PATCH] powerpc/crypto: fix pseries_defconfig break
Date: Wed, 01 Aug 2012 09:46:19 +1000
Message-ID: <28116.1343778379@neuling.org>
References: <1343777691-25601-1-git-send-email-sjenning@linux.vnet.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1343777691-25601-1-git-send-email-sjenning@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Seth Jennings <sjenning@linux.vnet.ibm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Kent Yoder <key@linux.vnet.ibm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, anton@samba.org
List-Id: linux-next.vger.kernel.org

Seth Jennings <sjenning@linux.vnet.ibm.com> wrote:

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
> avoid the pseries_defconfig break.
> 
>  arch/powerpc/configs/pseries_defconfig |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

ppc64_defconfig needs fixing too.

grep CONFIG_CRYPTO_DEV_NX=m arch/powerpc/configs/*
arch/powerpc/configs/ppc64_defconfig:CONFIG_CRYPTO_DEV_NX=m
arch/powerpc/configs/pseries_defconfig:CONFIG_CRYPTO_DEV_NX=m

Mikey

> 
> diff --git a/arch/powerpc/configs/pseries_defconfig b/arch/powerpc/configs/pseries_defconfig
> index 1f65b3c..9f4a936 100644
> --- a/arch/powerpc/configs/pseries_defconfig
> +++ b/arch/powerpc/configs/pseries_defconfig
> @@ -369,7 +369,8 @@ CONFIG_CRYPTO_TWOFISH=m
>  CONFIG_CRYPTO_LZO=m
>  # CONFIG_CRYPTO_ANSI_CPRNG is not set
>  CONFIG_CRYPTO_HW=y
> -CONFIG_CRYPTO_DEV_NX=m
> +CONFIG_CRYPTO_DEV_NX=y
> +CONFIG_CRYPTO_DEV_NX_ENCRYPT=m
>  CONFIG_VIRTUALIZATION=y
>  CONFIG_KVM_BOOK3S_64=m
>  CONFIG_KVM_BOOK3S_64_HV=y
> -- 
> 1.7.9.5
> 
