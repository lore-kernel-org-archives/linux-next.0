From: Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH block/for-linus] block: export bio_associate_*() and wbc_account_io()
Date: Thu, 23 Jul 2015 13:36:37 -0600
Message-ID: <55B14245.10506@kernel.dk>
References: <20150723105623.2f8c9548@canb.auug.org.au> <20150723182709.GQ15934@mtj.duckdns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:34402 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753580AbbGWTgk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Jul 2015 15:36:40 -0400
Received: by pacan13 with SMTP id an13so1048199pac.1
        for <linux-next@vger.kernel.org>; Thu, 23 Jul 2015 12:36:39 -0700 (PDT)
In-Reply-To: <20150723182709.GQ15934@mtj.duckdns.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Theodore Ts'o <tytso@mit.edu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Chris Mason <clm@fb.com>, kernel-team@fb.com

On 07/23/2015 12:27 PM, Tejun Heo wrote:
> bio_associate_blkcg(), bio_associate_current() and wbc_account_io()
> are used to implement cgroup writeback support for filesystems and
> thus need to be exported.  Export them.
>
> Signed-off-by: Tejun Heo <tj@kernel.org>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
> Hello, Jens.
>
> While this change isn't strictly necessary for 4.2, I think it'd
> better to push it through for-linus so that it's there before any
> filesystem specific changes are merged.

Might as well shove it it, as it'll make the lives of others easier.

-- 
Jens Axboe
