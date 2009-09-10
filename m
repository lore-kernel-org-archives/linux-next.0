From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: linux-next: manual merge of the block tree with the  tree
Date: Thu, 10 Sep 2009 09:24:07 +0200
Message-ID: <20090910072407.GO18599@kernel.dk>
References: <20090910144801.2b604ee7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755195AbZIJHYG@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090910144801.2b604ee7.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ed Cashin <ecashin@coraid.com>
List-Id: linux-next.vger.kernel.org

On Thu, Sep 10 2009, Stephen Rothwell wrote:
> Hi Jens,
> 
> Today's linux-next merge of the block tree got a conflict in
> drivers/block/aoe/aoeblk.c between commit
> 7135a71b19be1faf48b7148d77844d03bc0717d6 ("aoe: allocate unused
> request_queue for sysfs") from Linus' tree and commit
> 5063fe01e7dc205ebca89877f8eb01d6a5b0ebd6 ("writeback: add name to
> backing_dev_info") from the block tree.
> 
> I fixed it up (see below) and can carry the fix for a while.

Thanks, I'll update my for-2.6.32 branch today and let that propagate
into for-next to resolve this.

-- 
Jens Axboe
