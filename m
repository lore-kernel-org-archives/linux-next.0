From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: [PATCH #blk-for-2.8] init: DEBUG_BLOCK_EXT_DEVT requires explicit root= param
Date: Mon, 1 Sep 2008 18:34:02 +0200
Message-ID: <200809011834.02577.bzolnier@gmail.com>
References: <20080827183453.eb651f50.sfr@canb.auug.org.au> <20080901113059.GO20055@kernel.dk> <48BBD429.50907@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mu-out-0910.google.com ([209.85.134.189]:49532 "EHLO
	mu-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752238AbYIAQgx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 1 Sep 2008 12:36:53 -0400
Received: by mu-out-0910.google.com with SMTP id g7so2026717muf.1
        for <linux-next@vger.kernel.org>; Mon, 01 Sep 2008 09:36:52 -0700 (PDT)
In-Reply-To: <48BBD429.50907@kernel.org>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Jens Axboe <jens.axboe@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, dm-devel@redhat.com

On Monday 01 September 2008, Tejun Heo wrote:
> DEBUG_BLOCK_EXT_DEVT shuffles SCSI and IDE device numbers and root
> device number set using rdev become meaningless.  Root devices should
> be explicitly specified using textual names.  Warn about it if root
> can't be found and DEBUG_BLOCK_EXT_DEVT is enabled.  Also, add warning
> to the help text.
> 
> Signed-off-by: Tejun Heo <tj@kernel.org>
> Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>

Thanks Tejun.  With this patch I'm also fine with having
DEBUG_BLOCK_EXT_DEVT enabled by default.
