From: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: linux-next: Tree for Dec 14 (security/integrity/ima/)
Date: Fri, 14 Dec 2018 14:19:34 -0500
Message-ID: <1544815174.3681.16.camel@linux.ibm.com>
References: <20181214181826.5775b958@canb.auug.org.au>
         <8205aafb-bbc1-2196-17d9-e70e9ac56c2e@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8205aafb-bbc1-2196-17d9-e70e9ac56c2e@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-integrity@vger.kernel.org, James Morris <jmorris@namei.org>
List-Id: linux-next.vger.kernel.org

[Cc'ing Paul Gortmaker]

On Fri, 2018-12-14 at 08:25 -0800, Randy Dunlap wrote:
> On 12/13/18 11:18 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20181213:
> > 
> 
> on i386:
> 
>   CC      security/integrity/ima/ima_main.o
> ../security/integrity/ima/ima_main.c: In function 'ima_load_data':
> ../security/integrity/ima/ima_main.c:535:3: error: implicit declaration of function 'is_module_sig_enforced' [-Werror=implicit-function-declaration]
>    sig_enforce = is_module_sig_enforced();
>    ^
> 
> 
> Needs:

Commit 4f83d5ea643a ("security: integrity: make ima_main explicitly
non-modular") just removed module.h.

Mimi 


> 
> ---
>  security/integrity/ima/ima_main.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- linux-next-20181214.orig/security/integrity/ima/ima_main.c
> +++ linux-next-20181214/security/integrity/ima/ima_main.c
> @@ -24,6 +24,7 @@
>  #include <linux/init.h>
>  #include <linux/file.h>
>  #include <linux/binfmts.h>
> +#include <linux/module.h>
>  #include <linux/mount.h>
>  #include <linux/mman.h>
>  #include <linux/slab.h>
> 
> 
> 
