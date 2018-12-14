From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Dec 14 (security/integrity/ima/)
Date: Fri, 14 Dec 2018 08:25:32 -0800
Message-ID: <8205aafb-bbc1-2196-17d9-e70e9ac56c2e@infradead.org>
References: <20181214181826.5775b958@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181214181826.5775b958@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-integrity@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 12/13/18 11:18 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20181213:
> 

on i386:

  CC      security/integrity/ima/ima_main.o
../security/integrity/ima/ima_main.c: In function 'ima_load_data':
../security/integrity/ima/ima_main.c:535:3: error: implicit declaration of function 'is_module_sig_enforced' [-Werror=implicit-function-declaration]
   sig_enforce = is_module_sig_enforced();
   ^


Needs:

---
 security/integrity/ima/ima_main.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20181214.orig/security/integrity/ima/ima_main.c
+++ linux-next-20181214/security/integrity/ima/ima_main.c
@@ -24,6 +24,7 @@
 #include <linux/init.h>
 #include <linux/file.h>
 #include <linux/binfmts.h>
+#include <linux/module.h>
 #include <linux/mount.h>
 #include <linux/mman.h>
 #include <linux/slab.h>



-- 
~Randy
