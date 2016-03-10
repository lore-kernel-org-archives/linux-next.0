From: Jan Kara <jack@suse.cz>
Subject: Re: linux-next: manual merge of the xfs tree with the ext4 tree
Date: Thu, 10 Mar 2016 10:19:14 +0100
Message-ID: <20160310091914.GD5026@quack.suse.cz>
References: <20160310104100.6f906679@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:50227 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S935226AbcCJJS4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 10 Mar 2016 04:18:56 -0500
Content-Disposition: inline
In-Reply-To: <20160310104100.6f906679@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Chinner <david@fromorbit.com>, xfs@oss.sgi.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kara <jack@suse.cz>

On Thu 10-03-16 10:41:00, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the xfs tree got a conflict in:
> 
>   fs/ext4/ext4.h
> 
> between commit:
> 
>   109811c20fb8 ("ext4: simplify io_end handling for AIO DIO")
> 
> from the ext4 tree and commit:
> 
>   74c66bcb7eda ("ext4: Fix data exposure after failed AIO DIO")
> 
> from the xfs tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Thanks! This merge looks correct as well.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
