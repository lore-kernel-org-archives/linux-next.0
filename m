From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: linux-next: block tree build warning
Date: Fri, 4 Sep 2009 09:57:27 +0200
Message-ID: <20090904075726.GS18599@kernel.dk>
References: <20090904175440.09a67ee7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from brick.kernel.dk ([93.163.65.50]:50326 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932453AbZIDH5Y (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 4 Sep 2009 03:57:24 -0400
Content-Disposition: inline
In-Reply-To: <20090904175440.09a67ee7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Sep 04 2009, Stephen Rothwell wrote:
> Hi Jens,
> 
> Today's linux-next build (powerpc allnoconfig) produced this warning:
> 
> fs/fs-writeback.c: In function 'sync_inodes_sb':
> fs/fs-writeback.c:1140: warning: overflow in implicit constant conversion
> 
> Introduced by commit bda31e6ac21d7d41525c4e57549ac24bacdcf622
> ("writeback: get rid of generic_sync_sb_inodes() export").  This is a
> 32bit build.

This is now fixed, I'll push out a new for-next in 2 seconds... And
done, should be OK now.

-- 
Jens Axboe
