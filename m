From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the vhost tree
Date: Mon, 3 Apr 2017 16:21:19 +1000
Message-ID: <20170403162119.1a2de489@canb.auug.org.au>
References: <20170330152558.6c7d5261@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40167 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750992AbdDCGVX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 3 Apr 2017 02:21:23 -0400
In-Reply-To: <20170330152558.6c7d5261@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Michael,

On Thu, 30 Mar 2017 15:25:58 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> After merging the vhost tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> drivers/remoteproc/remoteproc_virtio.c: In function 'rproc_virtio_find_vqs':
> drivers/remoteproc/remoteproc_virtio.c:148:9: error: 'ctx' undeclared (first use in this function)
>          ctx ? ctx[i] : false);
>          ^
> 
> Caused by commit
> 
>   a965e977a103 ("virtio: add context flag to find vqs")
> 
> I have used the vhost tree from next-20170329 for today.

I am still getting this.
-- 
Cheers,
Stephen Rothwell
