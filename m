From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the pstore tree
Date: Thu, 2 Jun 2016 14:03:07 +1000
Message-ID: <20160602140307.506b98ba@canb.auug.org.au>
References: <20160602102556.722ad0cf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51396 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750824AbcFBEDJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 2 Jun 2016 00:03:09 -0400
In-Reply-To: <20160602102556.722ad0cf@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Geliang Tang <geliangtang@163.com>

Hi Kees,

On Thu, 2 Jun 2016 10:25:56 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> After merging the pstore tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/acpi/apei/erst.c:943:11: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
>   .read  = erst_reader,
>            ^

This also affected arch/powerpc/kernel/nvram_64.c:

arch/powerpc/kernel/nvram_64.c:563:10: error: initialization
 from incompatible pointer type [-Werror=incompatible-pointer-types]
  .read = nvram_pstore_read,
          ^

So I added this patch as well:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 2 Jun 2016 13:58:25 +1000
Subject: [PATCH] pstore: update arch/powerpc/kernel/nvram_64.c for struct pstore_info change

Fixes: d8aaf3511a13 ("pstore: add lzo/lz4 compression support")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/kernel/nvram_64.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/nvram_64.c b/arch/powerpc/kernel/nvram_64.c
index 856f9a7944cd..5ad2579e2cdc 100644
--- a/arch/powerpc/kernel/nvram_64.c
+++ b/arch/powerpc/kernel/nvram_64.c
@@ -444,7 +444,8 @@ static int nvram_pstore_write(enum pstore_type_id type,
  */
 static ssize_t nvram_pstore_read(u64 *id, enum pstore_type_id *type,
 				int *count, struct timespec *time, char **buf,
-				bool *compressed, struct pstore_info *psi)
+				bool *compressed, ssize_t *ecc_notice_size,
+				struct pstore_info *psi)
 {
 	struct oops_log_info *oops_hdr;
 	unsigned int err_type, id_no, size = 0;
-- 
2.8.1

I guess I don't really know if there is further fixes necessary, these
patches just fix up the build.
-- 
Cheers,
Stephen Rothwell
