From: Paul Moore <paul@paul-moore.com>
Subject: Re: linux-next: build failure after merge of the selinux tree
Date: Mon, 22 May 2017 17:12:38 -0400
Message-ID: <CAHC9VhQW8iLyOyr3SWTgyDXEi5yF2yAtbjFKfPQdZ10yZUDf3A@mail.gmail.com>
References: <20170522124855.68ad087f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:34881 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935821AbdEVVMk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 May 2017 17:12:40 -0400
Received: by mail-lf0-f68.google.com with SMTP id 99so6432210lfu.2
        for <linux-next@vger.kernel.org>; Mon, 22 May 2017 14:12:40 -0700 (PDT)
In-Reply-To: <20170522124855.68ad087f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Jurgens <danielj@mellanox.com>, Doug Ledford <dledford@redhat.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matan Barak <matanb@mellanox.com>

On Sun, May 21, 2017 at 10:48 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Paul,
>
> After merging the selinux tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> drivers/infiniband/core/uverbs_cmd.c: In function 'create_qp':
> drivers/infiniband/core/uverbs_cmd.c:1513:4: error: label 'err_destroy' used but not defined
>     goto err_destroy;
>     ^
>
> Caused by commit
>
>   89b54b4d09bd ("IB/core: Enforce PKey security on QPs")
>
> interacting with commit
>
>   fd3c7904db6e ("IB/core: Change idr objects to use the new schema")
>
> from Linus' tree.
>
> I have applied the following merge fix patch for today:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 22 May 2017 12:45:57 +1000
> Subject: [PATCH] IB/core: fix up for create_qp label changes
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/infiniband/core/uverbs_cmd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks Stephen, this looks right to me.

Daniel and Doug, does this look right to you?

> diff --git a/drivers/infiniband/core/uverbs_cmd.c b/drivers/infiniband/core/uverbs_cmd.c
> index 558fd5204b32..0ad3b05405d8 100644
> --- a/drivers/infiniband/core/uverbs_cmd.c
> +++ b/drivers/infiniband/core/uverbs_cmd.c
> @@ -1510,7 +1510,7 @@ static int create_qp(struct ib_uverbs_file *file,
>         if (cmd->qp_type != IB_QPT_XRC_TGT) {
>                 ret = ib_create_qp_security(qp, device);
>                 if (ret)
> -                       goto err_destroy;
> +                       goto err_cb;
>
>                 qp->real_qp       = qp;
>                 qp->device        = device;
> --
> 2.11.0
>
> --
> Cheers,
> Stephen Rothwell



-- 
paul moore
www.paul-moore.com
