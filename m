From: Theodore Tso <tytso@mit.edu>
Subject: Re: linux-next: ext4 tree build warning
Date: Tue, 9 Jun 2009 00:23:10 -0400
Message-ID: <20090609042310.GB9299@mit.edu>
References: <20090609105459.b1ae3575.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from thunk.org ([69.25.196.29]:42712 "EHLO thunker.thunk.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750990AbZFIEXh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Jun 2009 00:23:37 -0400
Content-Disposition: inline
In-Reply-To: <20090609105459.b1ae3575.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kara <jack@suse.cz>

On Tue, Jun 09, 2009 at 10:54:58AM +1000, Stephen Rothwell wrote:
> Hi Ted,
> 
> Today's linux-next build (powerpc ppc64_defconfig) produced this warning:
> 
> fs/ext4/inode.c: In function 'ext4_ind_get_blocks':
> fs/ext4/inode.c:939: warning: unused variable 'disksize'
> fs/ext4/inode.c:936: warning: unused variable 'ei'
> 
> Introduced by commit fb8c2ba20b8530d74239c2420d335df81aa18e13 ("ext4: Get
> rid of EXTEND_DISKSIZE flag of ext4_get_blocks_handle()").

Thanks for pointing that out.  I've fixed that up in my tree.

       	   	    	       	    	       - Ted
