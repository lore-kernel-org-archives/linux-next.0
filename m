From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: [PATCH] crypto: qat - Remove unused goto label
Date: Fri, 8 Feb 2019 15:04:56 +0800
Message-ID: <20190208070456.xywdb3ga2kqwoxaf@gondor.apana.org.au>
References: <20190204110106.345c3e21@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190204110106.345c3e21@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Feb 04, 2019 at 11:01:06AM +1100, Stephen Rothwell wrote:
> Hi Herbert,
> 
> After merging the crypto tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/crypto/qat/qat_common/adf_transport.c: In function 'adf_init_etr_data':
> drivers/crypto/qat/qat_common/adf_transport.c:501:1: warning: label 'err_bank_debug' defined but not used [-Wunused-label]
>  err_bank_debug:
>  ^~~~~~~~~~~~~~
> 
> Introduced by commit
> 
>   f0fcf9ade46a ("crypto: qat - no need to check return value of debugfs_create functions")

Thanks for the report Stephen!

---8<---
This patch removes an unused label.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: f0fcf9ade46a ("crypto: qat - no need to check return...")
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/drivers/crypto/qat/qat_common/adf_transport.c b/drivers/crypto/qat/qat_common/adf_transport.c
index ac658ce46836..2136cbe4bf6c 100644
--- a/drivers/crypto/qat/qat_common/adf_transport.c
+++ b/drivers/crypto/qat/qat_common/adf_transport.c
@@ -498,7 +498,6 @@ int adf_init_etr_data(struct adf_accel_dev *accel_dev)
 
 err_bank_all:
 	debugfs_remove(etr_data->debug);
-err_bank_debug:
 	kfree(etr_data->banks);
 err_bank:
 	kfree(etr_data);
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
