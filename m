From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: build warning after merge of the block tree
Date: Wed, 22 Oct 2014 20:14:53 -0600
Message-ID: <5448649D.7090403@kernel.dk>
References: <20141023122822.2c362904@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:60724 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932247AbaJWCO4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 22 Oct 2014 22:14:56 -0400
Received: by mail-pa0-f43.google.com with SMTP id eu11so129572pac.30
        for <linux-next@vger.kernel.org>; Wed, 22 Oct 2014 19:14:56 -0700 (PDT)
In-Reply-To: <20141023122822.2c362904@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kara <jack@suse.cz>

On 2014-10-22 19:28, Stephen Rothwell wrote:
> Hi Jens,
>
> After merging the block tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> block/scsi_ioctl.c: In function 'sg_scsi_ioctl':
> block/scsi_ioctl.c:520:1: warning: label 'out' defined but not used [-Wunused-label]
>   out:
>   ^

Fixed up, thanks.


-- 
Jens Axboe
