From: =?UTF-8?Q?Matias_Bj=c3=b8rling?= <m@bjorling.me>
Subject: Re: linux-next: please clean up the lightnvm tree
Date: Fri, 8 Jul 2016 06:30:59 +0200
Message-ID: <577F2C83.4060704@bjorling.me>
References: <20160708142251.650e3756@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:36562 "EHLO
	mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750858AbcGHEbE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 8 Jul 2016 00:31:04 -0400
Received: by mail-lf0-f48.google.com with SMTP id q132so23751998lfe.3
        for <linux-next@vger.kernel.org>; Thu, 07 Jul 2016 21:31:02 -0700 (PDT)
In-Reply-To: <20160708142251.650e3756@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>

On 07/08/2016 06:22 AM, Stephen Rothwell wrote:
> Hi Matias,
>
> I noticed that the commits in the lightnvm tree have been applied
> to the block tree as a series of patches (i.e. effectively rebased).
> Could you please remove all the duplicate patches from the lightnvm tree
> (which I think is the whole tree, curretly) before they start causing
> merge conflicts for me.
>
> One way to do this would be to rebase your tree on top of the block tree.
>

Thanks Stephen. Updated the for-next. I will make sure they are taken 
off if applied directly to the block tree in the future.
