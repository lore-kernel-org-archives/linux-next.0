From: Mateusz Guzik <mguzik@redhat.com>
Subject: Re: linux-next: build failure after merge of the vfs tree
Date: Mon, 19 Mar 2018 20:56:24 +0100
Message-ID: <20180319195623.o7h7munci7pixilo@mguzik>
References: <20180319170627.04eae43b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180319170627.04eae43b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Mar 19, 2018 at 05:06:27PM +1100, Stephen Rothwell wrote:
> Hi Al,
> 
> After merging the vfs tree, today's linux-next build (x86_64 allnoconfig)
> failed like this:
> 
> fs/super.c: In function 'do_thaw_all_callback':
> fs/super.c:942:3: error: implicit declaration of function 'emergency_thaw_bdev'; did you mean 'emergency_remount'? [-Werror=implicit-function-declaration]
>    emergency_thaw_bdev(sb);
>    ^~~~~~~~~~~~~~~~~~~
>    emergency_remount
> 
> Caused by commit
> 
>   92afc556e622 ("buffer.c: call thaw_super during emergency thaw")
> 
> I have reverted that commit for today.
> 

Oops, did not test with CONFIG_BLOCK disabled. The sysrq func itself is guarded
with it so imho the right fixup is to do the same thing:

diff --git a/fs/super.c b/fs/super.c
index 5fa9a8d..86b5575 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -935,6 +935,7 @@ void emergency_remount(void)
        }
 }
 
+#ifdef CONFIG_BLOCK
 static void do_thaw_all_callback(struct super_block *sb)
 {
        down_write(&sb->s_umount);
@@ -968,6 +969,7 @@ void emergency_thaw_all(void)
                schedule_work(work);
        }
 }
+#endif
 
 /*
  * Unnamed block devices are dummy devices used by virtual


-- 
Mateusz Guzik
