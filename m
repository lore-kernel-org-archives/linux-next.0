From: tytso@mit.edu
Subject: Re: linux-next: ext4 tree build failure
Date: Wed, 9 Dec 2009 21:10:40 -0500
Message-ID: <20091210021040.GB4735@thunk.org>
References: <20091210113812.9d1e4bb4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from thunk.org ([69.25.196.29]:42818 "EHLO thunker.thunk.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759447AbZLJCKg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 9 Dec 2009 21:10:36 -0500
Content-Disposition: inline
In-Reply-To: <20091210113812.9d1e4bb4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kara <jack@suse.cz>

On Thu, Dec 10, 2009 at 11:38:12AM +1100, Stephen Rothwell wrote:
> Hi Ted,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> ERROR: "jbd2_log_start_commit" [fs/ext4/ext4.ko] undefined!
> 
> Caused by commit b436b9bef84de6893e86346d8fbf7104bc520645 ("ext4: Wait
> for proper transaction commit on fsync") which I have reverted for today.

Thanks for pointing this out.  I've fixed this for tomorrow's build.

       	   	    	       	    	       - Ted
