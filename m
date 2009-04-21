From: Benny Halevy <bhalevy-C4P08NqkoRlBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [BUILD FAILURE 03/04] Next April 21 : x86_64 randconfig [fs/nfs/nfs.ko]
Date: Tue, 21 Apr 2009 23:44:21 +0300
Message-ID: <49EE3025.7050603@panasas.com>
References: <1240332715.9110.39.camel@subratamodak.linux.ibm.com>	 <49EE056C.1060605@panasas.com> <1240336172.20441.0.camel@heimdal.trondhjem.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1240336172.20441.0.camel-rJ7iovZKK19ZJLDQqaL3InhyD016LWXt@public.gmane.org>
Sender: linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Trond Myklebust <trond.myklebust-41N18TsMXrtuMpJDpNschA@public.gmane.org>, Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>
Cc: subrata-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, NFS list <linux-nfs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, sachinp <sachinp-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexander Beregalov <a.beregalov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, Fredric Isaman <iisaman-vtMw8L3fJ9vSiEDVxGk4TQ@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Apr. 21, 2009, 20:49 +0300, Trond Myklebust <trond.myklebust-41N18TsMXrtuMpJDpNschA@public.gmane.org> wrote:
> On Tue, 2009-04-21 at 20:42 +0300, Benny Halevy wrote:
>> On Apr. 21, 2009, 19:51 +0300, Subrata Modak <subrata-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org> wrote:
>>> I think i am observing this for the first time in any randconfig builds:
>>>
>>> BUILD   arch/x86/boot/bzImage
>>> Root device is (8, 3)
>>> Setup is 13020 bytes (padded to 13312 bytes).
>>> System is 5625 kB
>>> CRC a80d60ee
>>> Kernel: arch/x86/boot/bzImage is ready  (#1)
>>>   Building modules, stage 2.
>>>   MODPOST 514 modules
>>> ERROR: "find_last_bit" [fs/nfs/nfs.ko] undefined!
>>> make[1]: *** [__modpost] Error 1
>>> make: *** [modules] Error 2
>>> ---
>>>
>>> Regards--
>>> Subrata
>>>
>> Trond, can you please merge
>> http://git.linux-nfs.org/?p=bhalevy/linux-pnfs.git;a=commitdiff;h=9f32944d1bca79038ef3e9c9a27f11803d093d8e
>> into your nfsv41 and linux-next branches?
>>
>> I've placed it right before "nfs41: free slot"
>> in git://git.linux-nfs.org/projects/bhalevy/linux-pnfs.git nfs41-for-2.6.31
>>
>> (see also this thread:
>> http://article.gmane.org/gmane.linux.kernel.next/6951)
> 
> Could we just push that straight into the kernel? It seems like a
> no-brainer...

Absolutely.  Fred already sent it to the linux-kbuild mailing list
and got no response, maybe we'll get lucky this time :-)
Though I'm not sure who should shepherd it in.

Rusty, since this changes your code in lib/Makefile
can you please ack this patch?

Benny

> 
> Cheers
>   Trond
> 

>From 9f32944d1bca79038ef3e9c9a27f11803d093d8e Mon Sep 17 00:00:00 2001
From: Fred Isaman <iisaman-vtMw8L3fJ9vSiEDVxGk4TQ@public.gmane.org>
Date: Thu, 26 Mar 2009 11:22:16 -0400
Subject: [PATCH] lib: find_last_bit.o needed by a module only, move it from lib to obj

It is possible to configure the kernel such that find_last_bit is
referenced only by modules, causing linking to fail with

ERROR: "find_last_bit" [fs/nfs/nfs.ko] undefined!

Signed-off-by: Fred Isaman <iisaman-vtMw8L3fJ9vSiEDVxGk4TQ@public.gmane.org>
Signed-off-by: Benny Halevy <bhalevy-C4P08NqkoRlBDgjK7y7TUQ@public.gmane.org>
---
 lib/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/lib/Makefile b/lib/Makefile
index d6edd67..33a40e4 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -38,7 +38,7 @@ lib-$(CONFIG_RWSEM_GENERIC_SPINLOCK) += rwsem-spinlock.o
 lib-$(CONFIG_RWSEM_XCHGADD_ALGORITHM) += rwsem.o
 lib-$(CONFIG_GENERIC_FIND_FIRST_BIT) += find_next_bit.o
 lib-$(CONFIG_GENERIC_FIND_NEXT_BIT) += find_next_bit.o
-lib-$(CONFIG_GENERIC_FIND_LAST_BIT) += find_last_bit.o
+obj-$(CONFIG_GENERIC_FIND_LAST_BIT) += find_last_bit.o
 obj-$(CONFIG_GENERIC_HWEIGHT) += hweight.o
 obj-$(CONFIG_LOCK_KERNEL) += kernel_lock.o
 obj-$(CONFIG_DEBUG_PREEMPT) += smp_processor_id.o
-- 
1.6.2.1

--
To unsubscribe from this list: send the line "unsubscribe linux-nfs" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
