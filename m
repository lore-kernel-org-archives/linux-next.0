From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Apr 12 (orangefs)
Date: Fri, 12 Apr 2019 08:56:33 -0700
Message-ID: <c3628696-c14a-09a8-3cdf-0b5da5b7df64@infradead.org>
References: <20190412181707.51c073c3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190412181707.51c073c3@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devel@lists.orangefs.org
List-Id: linux-next.vger.kernel.org

On 4/12/19 1:17 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20190411:
> 
> The orangefs tree lost its build failure.

Not really.  In some config/options, it still has a few thousand
build errors.  Out of 20 randconfig builds, there was one large
failure in i386 and one in x86_64:

linux-next-20190412> grep -c "orangefs.*error:" X*/build*.out
X32/build-r4840.out:0
X32/build-r4841.out:0
X32/build-r4842.out:0
X32/build-r4843.out:0
X32/build-r4844.out:0
X32/build-r4845.out:0
X32/build-r4846.out:0
X32/build-r4847.out:1118
X32/build-r4848.out:0
X32/build-r4849.out:0
X64/build-r4850.out:0
X64/build-r4851.out:0
X64/build-r4852.out:0
X64/build-r4853.out:0
X64/build-r4854.out:0
X64/build-r4855.out:0
X64/build-r4856.out:0
X64/build-r4857.out:0
X64/build-r4858.out:2236
X64/build-r4859.out:0

as well as this warning on i386:
fs/orangefs/inode.c:544:8: warning: format ‘%lu’ expects argument of type ‘long unsigned int’, but argument 3 has type ‘size_t’ [-Wformat=]



But the build errors are easily fixed:

---
From: Randy Dunlap <rdunlap@infradead.org>

#include the hashtable.h header file before it is needed/used.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Mike Marshall <hubcap@omnibond.com>
Cc: Martin Brandenburg <martin@omnibond.com>
Cc: devel@lists.orangefs.org
---
 fs/orangefs/orangefs-kernel.h |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20190412.orig/fs/orangefs/orangefs-kernel.h
+++ linux-next-20190412/fs/orangefs/orangefs-kernel.h
@@ -27,6 +27,7 @@
 #include <linux/mpage.h>
 #include <linux/namei.h>
 #include <linux/errno.h>
+#include <linux/hashtable.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/slab.h>






-- 
~Randy
