From: Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH] Missing bio_put following submit_bio_wait
Date: Tue, 7 Jun 2016 10:48:15 -0600
Message-ID: <5756FACF.8030202@kernel.dk>
References: <1465316612-9649-1-git-send-email-shaun@tancheff.com>
 <1465317133-13266-1-git-send-email-shaun@tancheff.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-it0-f48.google.com ([209.85.214.48]:38646 "EHLO
	mail-it0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161503AbcFGQsS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 7 Jun 2016 12:48:18 -0400
Received: by mail-it0-f48.google.com with SMTP id h190so20100637ith.1
        for <linux-next@vger.kernel.org>; Tue, 07 Jun 2016 09:48:18 -0700 (PDT)
In-Reply-To: <1465317133-13266-1-git-send-email-shaun@tancheff.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Shaun Tancheff <shaun@tancheff.com>, linux-block@vger.kernel.org
Cc: Christoph Hellwig <hch@lst.de>, David Drysdale <drysdale@google.com>, Xiong Zhou <xzhou@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-nvdimm@ml01.01.org, Larry Finger <Larry.Finger@lwfinger.net>, Catalin Marinas <catalin.marinas@arm.com>, LKML <linux-kernel@vger.kernel.org>, Jens Axboe <axboe@fb.com>, bart.vanassche@sandisk.com, Shaun Tancheff <shaun.tancheff@seagate.com>

On 06/07/2016 10:32 AM, Shaun Tancheff wrote:
> submit_bio_wait() gives the caller an opportunity to examine
> struct bio and so expects the caller to issue the put_bio()
>
> This fixes a memory leak reported by a few people in 4.7-rc2
> kmemleak report after 9082e87bfbf8 ("block: remove struct bio_batch")
>
> Signed-off-by: Shaun Tancheff <shaun.tancheff@seagate.com>
> Tested-by: Catalin Marinas <catalin.marinas@arm.com>
> Tested-by: Larry Finger@lwfinger.net
> Tested-by: David Drysdale <drysdale@google.com>

Thanks, applied.

-- 
Jens Axboe
