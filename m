From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the btrfs-kdave tree
Date: Thu, 25 May 2017 11:31:24 +1000
Message-ID: <20170525113124.44e4daf6@canb.auug.org.au>
References: <20170518094146.7a1d9a2d@canb.auug.org.au>
        <20170518125000.GO4065@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45041 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1423282AbdEYBb2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 24 May 2017 21:31:28 -0400
In-Reply-To: <20170518125000.GO4065@suse.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Sterba <dsterba@suse.cz>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Liu Bo <bo.li.liu@oracle.com>

Hi David,

On Thu, 18 May 2017 14:50:00 +0200 David Sterba <dsterba@suse.cz> wrote:
>
> On Thu, May 18, 2017 at 09:41:46AM +1000, Stephen Rothwell wrote:
> > Hi David,
> > 
> > After merging the btrfs-kdave tree, today's linux-next build (powerpc
> > ppc64_defconfig) produced this warning:
> > 
> > fs/btrfs/inode.c: In function 'btrfs_submit_direct':
> > fs/btrfs/inode.c:8467:14: warning: 'bio' may be used uninitialized in this function [-Wmaybe-uninitialized]
> >   struct bio *bio;
> >               ^
> > 
> > I can't tell if it is a false positive or not.  
> 
> It seems to be a false positive. Patch updated and will be part of the
> next for-next.

I am still getting this.  Just checking that you didn't forget to push.

-- 
Cheers,
Stephen Rothwell
