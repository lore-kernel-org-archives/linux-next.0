From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: manual merge of the block tree with the vfs tree
Date: Mon, 26 Jan 2015 21:00:18 -0700
Message-ID: <54C70D52.6030208@kernel.dk>
References: <20150127145754.03e711a3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:35806 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751236AbbA0EAV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 26 Jan 2015 23:00:21 -0500
Received: by mail-pa0-f48.google.com with SMTP id ey11so15782699pad.7
        for <linux-next@vger.kernel.org>; Mon, 26 Jan 2015 20:00:21 -0800 (PST)
In-Reply-To: <20150127145754.03e711a3@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Ming Lei <ming.lei@canonical.com>

On 01/26/2015 08:57 PM, Stephen Rothwell wrote:
> Hi Jens,
>
> Today's linux-next merge of the block tree got a conflict in
> drivers/block/loop.c between commit c2ca80413553 ("loop: convert to
> vfs_iter_read/write") from the vfs tree and commit b5dd2f6047ca
> ("block: loop: improve performance via blk-mq") and several others from
> the block tree.
>
> I have no idea how fixed it up so I just used the version of the file
> from the block tree (its been there a while).  Please have a chat and
> figure out how to combine these two large changes.

Why isn't the loop patch in the block tree? That'd avoid such incidents. 
We could add a dependency for the required VFS patch.


-- 
Jens Axboe
