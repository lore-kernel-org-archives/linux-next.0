From: Michel Lespinasse <walken@google.com>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Mon, 30 Jul 2012 22:45:46 -0700
Message-ID: <CANN689HeXEdnPQUnFzZ2E7nsUktqF70vCv2ANsYRz9HhyxVhXg@mail.gmail.com>
References: <20120731144054.59b0a6da6d071ea1bc061db0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gh0-f174.google.com ([209.85.160.174]:44475 "EHLO
	mail-gh0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751923Ab2GaFpr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 31 Jul 2012 01:45:47 -0400
Received: by ghrr11 with SMTP id r11so5671400ghr.19
        for <linux-next@vger.kernel.org>; Mon, 30 Jul 2012 22:45:47 -0700 (PDT)
In-Reply-To: <20120731144054.59b0a6da6d071ea1bc061db0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sage Weil <sage@inktank.com>

On Mon, Jul 30, 2012 at 9:40 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Andrew,
>
> After merging the akpm tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> net/ceph/osd_client.c: In function 'ceph_osdc_alloc_request':
> net/ceph/osd_client.c:216:2: error: implicit declaration of function 'rb_init_node' [-Werror=implicit-function-declaration]
>
> Caused by commit 753b960e52b7 ("rbtree: empty nodes have no color") from
> the akpm tree interacting with commit cd43045c2de6 ("libceph: initialize
> rb, list nodes in ceph_osd_request") from the ceph tree.
>
> I added the following merge fix patch for today:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 31 Jul 2012 14:37:35 +1000
> Subject: [PATCH] libceph: remove rb_node initialisation
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  net/ceph/osd_client.c |    1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/net/ceph/osd_client.c b/net/ceph/osd_client.c
> index ad427e6..06fb7a9 100644
> --- a/net/ceph/osd_client.c
> +++ b/net/ceph/osd_client.c
> @@ -213,7 +213,6 @@ struct ceph_osd_request *ceph_osdc_alloc_request(struct ceph_osd_client *osdc,
>         kref_init(&req->r_kref);
>         init_completion(&req->r_completion);
>         init_completion(&req->r_safe_completion);
> -       rb_init_node(&req->r_node);
>         INIT_LIST_HEAD(&req->r_unsafe_item);
>         INIT_LIST_HEAD(&req->r_linger_item);
>         INIT_LIST_HEAD(&req->r_linger_osd);
> --
> 1.7.10.280.gaa39

There is a good chance that this is the right fix, if ceph doesn't use
the RB_CLEAR_NODE / RB_EMPTY_NODE macros or try to directly access the
rb_node fields. I wanted to grab the ceph tree to make sure, however
the first repo I found under that name did not have a commit
cd43045c2de6; where would be the correct place for me to fetch that ?

-- 
Michel "Walken" Lespinasse
A program is never fully debugged until the last user dies.
