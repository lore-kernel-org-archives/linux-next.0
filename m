From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: linux-next: build failure after merge of the ext4 tree
Date: Thu, 23 Jul 2015 12:49:53 -0400
Message-ID: <20150723164953.GA15778@thunk.org>
References: <20150723105623.2f8c9548@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from imap.thunk.org ([74.207.234.97]:44245 "EHLO imap.thunk.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753937AbbGWQuD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Jul 2015 12:50:03 -0400
Content-Disposition: inline
In-Reply-To: <20150723105623.2f8c9548@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>

On Thu, Jul 23, 2015 at 10:56:23AM +1000, Stephen Rothwell wrote:
> Hi Theodore,
> 
> After merging the ext4 tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> ERROR: "wbc_account_io" [fs/ext4/ext4.ko] undefined!
> ERROR: "bio_associate_blkcg" [fs/ext4/ext4.ko] undefined!
> 
> Caused by commit
> 
>   001e4a8775f6 ("ext4: implement cgroup writeback support")
> 
> I have used the ext4 tree from next-20150722 for today.

Ah, I see, we're missing the include files which define the inline
dummy functions.  I'll fix this in my tree, thanks.

      		       	   	      	    - Ted
