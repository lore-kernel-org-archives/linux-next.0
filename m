From: Mike Snitzer <snitzer@redhat.com>
Subject: Re: linux-next: build failure after merge of the device-mapper tree
Date: Thu, 3 Mar 2016 22:14:13 -0500
Message-ID: <20160304031412.GA28088@redhat.com>
References: <20160304135933.0ba93056@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:55116 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751228AbcCDDOO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Mar 2016 22:14:14 -0500
Content-Disposition: inline
In-Reply-To: <20160304135933.0ba93056@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alasdair G Kergon <agk@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Mar 03 2016 at  9:59pm -0500,
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the device-mapper tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> drivers/md/dm.c: In function '__split_and_process_non_flush':
> drivers/md/dm.c:1761:6: error: 'ret' undeclared (first use in this function)
>   if (ret < 0)
>       ^
> 
> Caused by commit
> 
>   f838997d1784 ("dm: return error if bio_integrity_clone() fails in clone_bio()")
> 
> That one is a bit annoying ... clearly not build tested :-(

Yeap, I'll just let that go.

> I have used the device-mapper tree from next-20160303 for today.

Not sure what happened.  I've fixed it.  next-20160303 is fine though
since the bad commit was pushed today.
