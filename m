From: Theodore Tso <tytso@mit.edu>
Subject: Re: linux-next: ext4 tree build failure
Date: Tue, 28 Apr 2009 07:23:47 -0400
Message-ID: <20090428112347.GG22104@mit.edu>
References: <20090428112722.22c844ea.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from THUNK.ORG ([69.25.196.29]:47752 "EHLO thunker.thunk.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754114AbZD1LX5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Apr 2009 07:23:57 -0400
Content-Disposition: inline
In-Reply-To: <20090428112722.22c844ea.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Tue, Apr 28, 2009 at 11:27:22AM +1000, Stephen Rothwell wrote:
> Hi Ted,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> fs/ext4/super.c: In function 'ext4_put_super':
> fs/ext4/super.c:590: error: implicit declaration of function 'vfree'
> fs/ext4/super.c: In function 'ext4_fill_flex_info':
> fs/ext4/super.c:1644: error: implicit declaration of function 'vmalloc'
> fs/ext4/super.c:1644: warning: assignment makes pointer from integer without a cast
> 
> Probably caused by commit a4ded943dff5de6fee2b397de9bcb2ffd5556253
> ("ext4: Fallback to vmalloc if kmalloc can't allocate s_flex_groups
> array").  Presumably a missing explicit include of linux/vmalloc.h.

Whoops, thanks for pointing that out.  I've fixed it in my tree.

	       	   	    	       	    	  - Ted
