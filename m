From: Chris Mason <clm@fb.com>
Subject: Re: [PATCH block/for-linus] block: export bio_associate_*() and
 wbc_account_io()
Date: Thu, 23 Jul 2015 14:30:07 -0400
Message-ID: <20150723183007.GA28964@ret.masoncoding.com>
References: <20150723105623.2f8c9548@canb.auug.org.au>
 <20150723182709.GQ15934@mtj.duckdns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:19936 "EHLO
	mx0b-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752902AbbGWSaX (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Jul 2015 14:30:23 -0400
Content-Disposition: inline
In-Reply-To: <20150723182709.GQ15934@mtj.duckdns.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Theodore Ts'o <tytso@mit.edu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, kernel-team@fb.com

On Thu, Jul 23, 2015 at 02:27:09PM -0400, Tejun Heo wrote:
> bio_associate_blkcg(), bio_associate_current() and wbc_account_io()
> are used to implement cgroup writeback support for filesystems and
> thus need to be exported.  Export them.

Thanks, these were the only three I needed on the btrfs side.

-chris
