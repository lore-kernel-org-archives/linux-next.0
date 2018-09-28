From: Omar Sandoval <osandov@osandov.com>
Subject: Re: linux-next: build warning after merge of the block tree
Date: Thu, 27 Sep 2018 23:43:19 -0700
Message-ID: <20180928064319.GD29754@vader>
References: <20180928111124.745bf2ef@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180928111124.745bf2ef@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Omar Sandoval <osandov@fb.com>
List-Id: linux-next.vger.kernel.org

On Fri, Sep 28, 2018 at 11:11:24AM +1000, Stephen Rothwell wrote:
> Hi Jens,
> 
> After merging the block tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> block/kyber-iosched.c:84:22: warning: integer overflow in expression of type 'long int' results in '705032704' [-Woverflow]
>   [KYBER_DISCARD] = 5 * NSEC_PER_SEC,
>                       ^
> 
> Introduced by commit
> 
>   6e25cb01ea20 ("kyber: implement improved heuristics")

Ugh, thanks for the report. This should fix it:

diff --git a/block/kyber-iosched.c b/block/kyber-iosched.c
index 2b62e362fb36..eccac01a10b6 100644
--- a/block/kyber-iosched.c
+++ b/block/kyber-iosched.c
@@ -79,9 +79,9 @@ static const unsigned int kyber_depth[] = {
  * Default latency targets for each scheduling domain.
  */
 static const u64 kyber_latency_targets[] = {
-	[KYBER_READ] = 2 * NSEC_PER_MSEC,
-	[KYBER_WRITE] = 10 * NSEC_PER_MSEC,
-	[KYBER_DISCARD] = 5 * NSEC_PER_SEC,
+	[KYBER_READ] = 2ULL * NSEC_PER_MSEC,
+	[KYBER_WRITE] = 10ULL * NSEC_PER_MSEC,
+	[KYBER_DISCARD] = 5ULL * NSEC_PER_SEC,
 };
 
 /*

Jens, do you mind folding that in, or should I send it separately?
