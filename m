From: James Morris <jmorris@namei.org>
Subject: Re: linux-next: Tree for Dec 14 (security/integrity/ima/)
Date: Fri, 21 Dec 2018 05:00:43 +1100 (AEDT)
Message-ID: <alpine.LRH.2.21.1812210500010.29474@namei.org>
References: <20181214181826.5775b958@canb.auug.org.au> <8205aafb-bbc1-2196-17d9-e70e9ac56c2e@infradead.org> <1544815174.3681.16.camel@linux.ibm.com> <20181214202650.GO11670@windriver.com> <20181214222802.GP11670@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181214222802.GP11670@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Mimi Zohar <zohar@linux.ibm.com>, Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-integrity@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Fri, 14 Dec 2018, Paul Gortmaker wrote:

> >From 31081a8b46e84d64e2fbda8d0d82ba26d56cc468 Mon Sep 17 00:00:00 2001
> From: Paul Gortmaker <paul.gortmaker@windriver.com>
> Date: Fri, 14 Dec 2018 16:48:07 -0500
> Subject: [PATCH] security: integrity: partial revert of make ima_main
>  explicitly non-modular
> 
> In commit 4f83d5ea643a ("security: integrity: make ima_main explicitly
> non-modular") I'd removed <linux/module.h> after assuming that the
> function is_module_sig_enforced() was an LSM function and not a core
> kernel module function.
> 
> Unfortunately the typical .config selections used in build testing
> provide an implicit <linux/module.h> presence, and so normal/typical
> build testing did not immediately reveal my incorrect assumption.
> 
> Cc: Mimi Zohar <zohar@linux.vnet.ibm.com>
> Cc: Dmitry Kasatkin <dmitry.kasatkin@gmail.com>
> Cc: James Morris <james.l.morris@oracle.com>
> Cc: "Serge E. Hallyn" <serge@hallyn.com>
> Cc: linux-ima-devel@lists.sourceforge.net
> Cc: linux-security-module@vger.kernel.org
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> 
> diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
> index adaf96932237..616a88f95b92 100644
> --- a/security/integrity/ima/ima_main.c
> +++ b/security/integrity/ima/ima_main.c
> @@ -21,7 +21,7 @@
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
> -#include <linux/init.h>
> +#include <linux/module.h>
>  #include <linux/file.h>
>  #include <linux/binfmts.h>
>  #include <linux/mount.h>
> 

Applied to
git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-security.git next-general
and next-testing


-- 
James Morris
<jmorris@namei.org>
