From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: Tree for Dec 14 (security/integrity/ima/)
Date: Fri, 14 Dec 2018 17:28:02 -0500
Message-ID: <20181214222802.GP11670@windriver.com>
References: <20181214181826.5775b958@canb.auug.org.au>
 <8205aafb-bbc1-2196-17d9-e70e9ac56c2e@infradead.org>
 <1544815174.3681.16.camel@linux.ibm.com>
 <20181214202650.GO11670@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181214202650.GO11670@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mimi Zohar <zohar@linux.ibm.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-integrity@vger.kernel.org, James Morris <jmorris@namei.org>
List-Id: linux-next.vger.kernel.org

[Re: linux-next: Tree for Dec 14 (security/integrity/ima/)] On 14/12/2018 (Fri 15:26) Paul Gortmaker wrote:

> [Re: linux-next: Tree for Dec 14 (security/integrity/ima/)] On 14/12/2018 (Fri 14:19) Mimi Zohar wrote:
> 
> > On Fri, 2018-12-14 at 08:25 -0800, Randy Dunlap wrote:
> > > 
> > > on i386:
> > > 
> > >   CC      security/integrity/ima/ima_main.o
> > > ../security/integrity/ima/ima_main.c: In function 'ima_load_data':
> > > ../security/integrity/ima/ima_main.c:535:3: error: implicit declaration of function 'is_module_sig_enforced' [-Werror=implicit-function-declaration]
> > >    sig_enforce = is_module_sig_enforced();
> > >    ^

[...]

> > Commit 4f83d5ea643a ("security: integrity: make ima_main explicitly
> > non-modular") just removed module.h.
> 
> Yes, unfortunately the security directory has additional confusion
> because there is name space overlap between "module" as used in Linux
> Security Module, and "module" as in "insmod foo.ko".  The ima_main
> is not modular, but it does use modular infrastructure to load others.
> 
> Fortunately this was the final commit in the series, so it can be
> removed or reverted as per maintainer's choice.  In the meantime, I'll
> look into why my "allyesconfig" build testing didn't pick up on this,
> so I can close that testing gap.

I've confirmed that most .config result in an implicit header presence
by looking at the CPP output.  Details below.

James, if your input branch to linux-next is strictly fast forward, here
is a partial revert to fix up what Randy found that you can apply.

Thanks for the report, and again - sorry for not detecting this myself.
Paul.
--

>From 31081a8b46e84d64e2fbda8d0d82ba26d56cc468 Mon Sep 17 00:00:00 2001
From: Paul Gortmaker <paul.gortmaker@windriver.com>
Date: Fri, 14 Dec 2018 16:48:07 -0500
Subject: [PATCH] security: integrity: partial revert of make ima_main
 explicitly non-modular

In commit 4f83d5ea643a ("security: integrity: make ima_main explicitly
non-modular") I'd removed <linux/module.h> after assuming that the
function is_module_sig_enforced() was an LSM function and not a core
kernel module function.

Unfortunately the typical .config selections used in build testing
provide an implicit <linux/module.h> presence, and so normal/typical
build testing did not immediately reveal my incorrect assumption.

Cc: Mimi Zohar <zohar@linux.vnet.ibm.com>
Cc: Dmitry Kasatkin <dmitry.kasatkin@gmail.com>
Cc: James Morris <james.l.morris@oracle.com>
Cc: "Serge E. Hallyn" <serge@hallyn.com>
Cc: linux-ima-devel@lists.sourceforge.net
Cc: linux-security-module@vger.kernel.org
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
index adaf96932237..616a88f95b92 100644
--- a/security/integrity/ima/ima_main.c
+++ b/security/integrity/ima/ima_main.c
@@ -21,7 +21,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include <linux/init.h>
+#include <linux/module.h>
 #include <linux/file.h>
 #include <linux/binfmts.h>
 #include <linux/mount.h>
-- 
2.7.4
