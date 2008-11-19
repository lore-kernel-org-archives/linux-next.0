From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: linux-next: manual merge of the block tree
Date: Wed, 19 Nov 2008 10:14:48 +0100
Message-ID: <20081119091447.GS26308@kernel.dk>
References: <20081119142105.43c0e9bf.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:54711 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751863AbYKSJQh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 19 Nov 2008 04:16:37 -0500
Content-Disposition: inline
In-Reply-To: <20081119142105.43c0e9bf.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Zhaolei <zhaolei@cn.fujitsu.com>, Fernando Luis =?iso-8859-1?Q?V=E1zquez?= Cao <fernando@oss.ntt.co.jp>

On Wed, Nov 19 2008, Stephen Rothwell wrote:
> Hi Jens,
> 
> Today's linux-next merge of the block tree got a conflict in
> drivers/block/xen-blkfront.c between commit
> 68aee07f9bad2c830a898cf6d6bfc11ea24efc40 ("Release old elevator on change
> elevator") from Linus' tree and commit
> f7ed11048c85660828fa2017ea2e3da27235f76a ("xen-blkfront: set queue
> paravirt flag") from the block tree.
> 
> I used the version from the block tree and will carry this fix for a
> while but assume that you will fix the conflict in the block tree soon.

Just noticed that myself as well, will update for-next now.

-- 
Jens Axboe
