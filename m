From: Jan Kara <jack@suse.cz>
Subject: Re: linux-next: manual merge of the akpm-current tree with the FIXME
 tree
Date: Thu, 23 Jul 2015 11:39:27 +0200
Message-ID: <20150723093927.GA8686@quack.suse.cz>
References: <20150723160048.01a283c5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:55663 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752903AbbGWJjf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Jul 2015 05:39:35 -0400
Content-Disposition: inline
In-Reply-To: <20150723160048.01a283c5@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jan Kara <jack@suse.cz>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>

On Thu 23-07-15 16:00:48, Stephen Rothwell wrote:
> Hi Andrew,
> 
> Today's linux-next merge of the akpm-current tree got conflicts in:
> 
>   fs/ext3/super.c
> 
> between commit:
> 
>   106542e7987c ("fs: Remove ext3 filesystem driver")
> 
> from the FIXME tree and commit:
> 
>   d2c05ecd59bc ("parse_integer: convert ext2, ext3, ext4")
> 
> from the akpm-current tree.
> 
> I fixed it up (I just removed the file) and can carry the fix as necessary
> (no action is required).
> 
> Jan, I also removed the JBD section from the MAINTAINERS file ... your
> version has conflict markers left around it ...

Thanks Stephen. I have fixed up MAINTAINERS file in my tree (amended the
original commit).

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
