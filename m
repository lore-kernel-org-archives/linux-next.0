From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: Tree for Apr 20 (bfq)
Date: Thu, 20 Apr 2017 09:36:54 -0600
Message-ID: <c2bd1807-8911-747e-24f5-b5b556e58b8b@kernel.dk>
References: <20170420164341.77790320@canb.auug.org.au>
 <83a9471d-08d3-6c78-f778-0896896faafa@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-io0-f176.google.com ([209.85.223.176]:33872 "EHLO
        mail-io0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S970642AbdDTPg7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 20 Apr 2017 11:36:59 -0400
Received: by mail-io0-f176.google.com with SMTP id a103so75912734ioj.1
        for <linux-next@vger.kernel.org>; Thu, 20 Apr 2017 08:36:58 -0700 (PDT)
In-Reply-To: <83a9471d-08d3-6c78-f778-0896896faafa@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paolo Valente <paolo.valente@linaro.org>

On 04/20/2017 09:24 AM, Randy Dunlap wrote:
> On 04/19/17 23:43, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20170419:
>>
> 
> on i386:
> when CONFIG_CGROUPS is not enabled:
> 
> In file included from ../block/bfq-iosched.c:105:0:
> ../block/bfq-iosched.h:819:22: error: array type has incomplete element type
>  extern struct cftype bfq_blkcg_legacy_files[];
>                       ^
> ../block/bfq-iosched.h:820:22: error: array type has incomplete element type
>  extern struct cftype bfq_blkg_files[];

This should fix it:


diff --git a/block/bfq-iosched.h b/block/bfq-iosched.h
index 4ce7915e8d84..ae783c06dfd9 100644
--- a/block/bfq-iosched.h
+++ b/block/bfq-iosched.h
@@ -816,9 +816,6 @@ void bfq_put_async_queues(struct bfq_data *bfqd, struct bfq_group *bfqg);
 
 /* ---------------- cgroups-support interface ---------------- */
 
-extern struct cftype bfq_blkcg_legacy_files[];
-extern struct cftype bfq_blkg_files[];
-
 void bfqg_stats_update_io_add(struct bfq_group *bfqg, struct bfq_queue *bfqq,
 			      unsigned int op);
 void bfqg_stats_update_io_remove(struct bfq_group *bfqg, unsigned int op);
@@ -844,6 +841,8 @@ struct bfq_group *bfq_create_group_hierarchy(struct bfq_data *bfqd, int node);
 void bfqg_put(struct bfq_group *bfqg);
 
 #ifdef CONFIG_BFQ_GROUP_IOSCHED
+extern struct cftype bfq_blkcg_legacy_files[];
+extern struct cftype bfq_blkg_files[];
 extern struct blkcg_policy blkcg_policy_bfq;
 #endif
 

-- 
Jens Axboe
