From: Dave Kleikamp <dave.kleikamp@oracle.com>
Subject: Re: linux-next: build failure after merge of the ceph tree
Date: Thu, 26 Sep 2013 21:36:07 -0500
Message-ID: <5244EF17.30905@oracle.com>
References: <20130927113100.5c261c61856e26da4cf8f949@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130927113100.5c261c61856e26da4cf8f949@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Sage Weil <sage@newdream.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, majianpeng <majianpeng@gmail.com>, Zach Brown <zab@zabbo.net>
List-Id: linux-next.vger.kernel.org

On 09/26/2013 08:31 PM, Stephen Rothwell wrote:
> Hi Sage,
> 
> After merging the ceph tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> fs/ceph/file.c: In function 'ceph_sync_direct_write':
> fs/ceph/file.c:545:24: error: 'struct iov_iter' has no member named 'iov'
>    void __user *data = i.iov->iov_base + i.iov_offset;
>                         ^
> fs/ceph/file.c:546:14: error: 'struct iov_iter' has no member named 'iov'
>    u64 len = i.iov->iov_len - i.iov_offset;
>               ^
> 
> This also happened yesterday but was swamped by the other error (now fixed).
> 
> Caused by commit d4ce96db671b ("ceph: Implement writev/pwritev for sync
> operation") interacting with commit f6794d33a5ec ("iov_iter: hide iovec
> details behind ops function pointers") from the aio-direct tree.
> 
> I applied the following merge fix patch (but there may be a better
> solution):
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 27 Sep 2013 11:28:05 +1000
> Subject: [PATCH] ceph: fix up for iov_iter changes
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  fs/ceph/file.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ceph/file.c b/fs/ceph/file.c
> index 5cf034e..1216372 100644
> --- a/fs/ceph/file.c
> +++ b/fs/ceph/file.c
> @@ -542,8 +542,8 @@ ceph_sync_direct_write(struct kiocb *iocb, const struct iovec *iov,
>  	iov_iter_init(&i, iov, nr_segs, count, 0);
>  
>  	while (iov_iter_count(&i) > 0) {
> -		void __user *data = i.iov->iov_base + i.iov_offset;
> -		u64 len = i.iov->iov_len - i.iov_offset;
> +		void __user *data = iov_iter_iovec(&i)->iov_base + i.iov_offset;
> +		u64 len = iov_iter_iovec(&i)->iov_len - i.iov_offset;
>  
>  		page_align = (unsigned long)data & ~PAGE_MASK;
>  

iov_iter_iovec(&i) will resolve to iov, so this is a little simpler

Signed-off-by: Dave Kleikamp <dave.kleikamp@oracle.com>
---
diff --git a/fs/ceph/file.c b/fs/ceph/file.c
index 5cf034e..d9aa924 100644
--- a/fs/ceph/file.c
+++ b/fs/ceph/file.c
@@ -542,8 +542,8 @@ ceph_sync_direct_write(struct kiocb *iocb, const
struct iovec *iov,
 	iov_iter_init(&i, iov, nr_segs, count, 0);

 	while (iov_iter_count(&i) > 0) {
-		void __user *data = i.iov->iov_base + i.iov_offset;
-		u64 len = i.iov->iov_len - i.iov_offset;
+		void __user *data = iov->iov_base + i.iov_offset;
+		u64 len = iov->iov_len - i.iov_offset;

 		page_align = (unsigned long)data & ~PAGE_MASK;
