Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC3FC433F5
	for <linux-next@archiver.kernel.org>; Fri, 17 Dec 2021 16:53:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239352AbhLQQx6 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 17 Dec 2021 11:53:58 -0500
Received: from out03.mta.xmission.com ([166.70.13.233]:59954 "EHLO
        out03.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239349AbhLQQx5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 17 Dec 2021 11:53:57 -0500
Received: from in01.mta.xmission.com ([166.70.13.51]:43922)
        by out03.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1myGUW-0031FY-IN; Fri, 17 Dec 2021 09:53:56 -0700
Received: from ip68-227-161-49.om.om.cox.net ([68.227.161.49]:39432 helo=email.froward.int.ebiederm.org.xmission.com)
        by in01.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1myGUV-003tH4-BT; Fri, 17 Dec 2021 09:53:55 -0700
From:   ebiederm@xmission.com (Eric W. Biederman)
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Mike Christie <michael.christie@oracle.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20211217183425.5ace9d3c@canb.auug.org.au>
Date:   Fri, 17 Dec 2021 10:53:49 -0600
In-Reply-To: <20211217183425.5ace9d3c@canb.auug.org.au> (Stephen Rothwell's
        message of "Fri, 17 Dec 2021 18:34:25 +1100")
Message-ID: <87ilvnfa02.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1myGUV-003tH4-BT;;;mid=<87ilvnfa02.fsf@email.froward.int.ebiederm.org>;;;hst=in01.mta.xmission.com;;;ip=68.227.161.49;;;frm=ebiederm@xmission.com;;;spf=neutral
X-XM-AID: U2FsdGVkX18lR3N1Wl6cWSXZGnQwJAwk7CfvhljKO4E=
X-SA-Exim-Connect-IP: 68.227.161.49
X-SA-Exim-Mail-From: ebiederm@xmission.com
Subject: Re: linux-next: build failure after merge of the userns tree
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> After merging the userns tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> ERROR: modpost: ".do_exit" [drivers/vhost/vhost.ko] undefined!
>
> Caused by commit
>
>   eb55e716ac1a ("exit: Stop exporting do_exit")
>
> interacting with commit
>
>   bbf761db7dbb ("vhost: use user_worker to check RLIMITs")
>
> from the vhost tree.
>
> I have added the following merge fix patch.

Thanks.

I will dig in a little more but this is not the correct fix.

make_task_dead is for the guts of oops, when the process is borked.

I need to track down and see what is going on with the new
user_work_create/start thing.

This looks like we need a user_work_exit helper that does what these
new user work kernel threads need.

I will follow up because yikes!  At first glance user_helpers look
like what kthreads were added to avoid.  Getting userspace and kernel
space state confused.

Eric

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 17 Dec 2021 18:24:30 +1100
> Subject: [PATCH] fix up for "vhost: use user_worker to check RLIMITs"
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/vhost/vhost.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> index 8cf259d798c0..b605a79533bb 100644
> --- a/drivers/vhost/vhost.c
> +++ b/drivers/vhost/vhost.c
> @@ -374,7 +374,7 @@ static int vhost_worker(void *data)
>  	}
>  
>  	complete(worker->exit_done);
> -	do_exit(0);
> +	make_task_dead(0);
>  }
>  
>  static void vhost_vq_free_iovecs(struct vhost_virtqueue *vq)
>
> This lead to:
>
> ERROR: modpost: ".make_task_dead" [drivers/vhost/vhost.ko] undefined!
>
> so I added the following as well.
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 17 Dec 2021 18:30:09 +1100
> Subject: [PATCH] fix 2 for "vhost: use user_worker to check RLIMITs"
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  kernel/exit.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/kernel/exit.c b/kernel/exit.c
> index 6c4b04531f17..dfa3e8f6ffeb 100644
> --- a/kernel/exit.c
> +++ b/kernel/exit.c
> @@ -890,6 +890,7 @@ void __noreturn make_task_dead(int signr)
>  
>  	do_exit(signr);
>  }
> +EXPORT_SYMBOL_GPL(make_task_dead);
>  
>  SYSCALL_DEFINE1(exit, int, error_code)
>  {
