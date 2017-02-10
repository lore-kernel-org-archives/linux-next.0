From: Jaegeuk Kim <jaegeuk@kernel.org>
Subject: Re: linux-next: build warning after merge of the f2fs tree
Date: Thu, 9 Feb 2017 16:01:52 -0800
Message-ID: <20170210000152.GA20930@jaegeuk.local>
References: <20170210105135.26bc6739@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:54536 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751439AbdBJAUQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 9 Feb 2017 19:20:16 -0500
Content-Disposition: inline
In-Reply-To: <20170210105135.26bc6739@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Thank you.
Worked around that in the dev branch.

On 02/10, Stephen Rothwell wrote:
> Hi Jaegeuk,
> 
> After merging the f2fs tree, today's linux-next build
> (x86_64_allmodconfig) produced this warning:
> 
> fs/f2fs/node.c: In function 'fsync_node_pages':
> fs/f2fs/node.c:1520:3: warning: 'last_idx' may be used uninitialized in this function [-Wmaybe-uninitialized]
>    f2fs_submit_merged_bio_cond(sbi, NULL, ino, last_idx,
>    ^
> 
> Introduced by commit
> 
>   9563642a6ec2 ("f2fs: check last page index in cached bio to decide submission")
> 
> -- 
> Cheers,
> Stephen Rothwell
