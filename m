From: Chandan Rajendra <chandan@linux.vnet.ibm.com>
Subject: Re: linux-next: build warning after merge of the overlayfs tree
Date: Thu, 09 Nov 2017 09:29:14 +0530
Message-ID: <2083901.R5B31B2umx@localhost.localdomain>
References: <20171109093306.178c9ad2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171109093306.178c9ad2@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thursday, November 9, 2017 4:03:06 AM IST Stephen Rothwell wrote:
> Hi Miklos,
> 
> After merging the overlayfs tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> fs/overlayfs/super.c: In function 'ovl_fill_super':
> fs/overlayfs/super.c:1070:25: warning: 'numlower' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   unsigned int stacklen, numlower, i;
>                          ^
> fs/overlayfs/super.c:1069:15: warning: 'stack' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   struct path *stack;
>                ^
> 
> 

The following trivial patch resolves the warnings,

diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index fd11c05..602e686 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -1066,8 +1066,8 @@ static struct ovl_entry *ovl_get_lowerstack(struct super_block *sb,
 {
        int err;
        char *lowertmp, *lower;
-       struct path *stack;
-       unsigned int stacklen, numlower, i;
+       struct path *stack = NULL;
+       unsigned int stacklen, numlower = 0, i;
        bool remote = false;
        struct ovl_entry *oe;
 
-- 
chandan
