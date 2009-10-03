From: Theodore Tso <tytso@mit.edu>
Subject: Re: linux-next: ext4 tree build warning
Date: Fri, 2 Oct 2009 21:03:56 -0400
Message-ID: <20091003010356.GA11365@mit.edu>
References: <20091002112637.c962d8ae.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from thunk.org ([69.25.196.29]:48015 "EHLO thunker.thunk.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756072AbZJCBDz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 2 Oct 2009 21:03:55 -0400
Content-Disposition: inline
In-Reply-To: <20091002112637.c962d8ae.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Curt Wohlgemuth <curtw@google.com>

On Fri, Oct 02, 2009 at 11:26:37AM +1000, Stephen Rothwell wrote:
> Hi Ted,
> 
> Today's linux-next build (powerpc ppc64_defconfig) produced this warning:
> 
> fs/ext4/inode.c: In function 'ext4_dirty_inode':
> fs/ext4/inode.c:5615: warning: unused variable 'current_handle'
> 
> Introduced by commit f3dc272fd5e2ae08244796bb39e7e1ce4b25d3b3 ("ext4:
> Make sure ext4_dirty_inode() updates the inode in no journal mode"). This
> variable is now only referenced by a jbd_debug().

Thanks for pointing this out.   I'll get this fixed.

       	   	    	 	     	      - Ted
