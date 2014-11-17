From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Mon, 17 Nov 2014 12:51:09 -0700
Message-ID: <546A51AD.50602@kernel.dk>
References: <20141117144415.6af6c9d6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pd0-f174.google.com ([209.85.192.174]:41826 "EHLO
	mail-pd0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751297AbaKQTvO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 17 Nov 2014 14:51:14 -0500
Received: by mail-pd0-f174.google.com with SMTP id w10so2996354pde.19
        for <linux-next@vger.kernel.org>; Mon, 17 Nov 2014 11:51:13 -0800 (PST)
In-Reply-To: <20141117144415.6af6c9d6@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/16/2014 08:44 PM, Stephen Rothwell wrote:
> Hi Jens,
>
> After merging the block tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> ERROR: "blk_mq_free_request" [drivers/block/nvme.ko] undefined!
>
> Caused by commit b94ebc3c7a0f ("NVMe: replace blk_put_request() with
> blk_mq_free_request()").
>
> I have used te block tree from next-20141114 for today.

Thanks Stephen, fixed.
