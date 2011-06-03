From: David Sterba <dave@jikos.cz>
Subject: Re: linux-next: build warning from Linus' tree
Date: Fri, 3 Jun 2011 16:17:56 +0200
Message-ID: <20110603141756.GT12709@twin.jikos.cz>
References: <20110603111049.d5967bb3.sfr@canb.auug.org.au>
Reply-To: dave@jikos.cz
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from twin.jikos.cz ([89.185.236.188]:48819 "EHLO twin.jikos.cz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755374Ab1FCOSj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 3 Jun 2011 10:18:39 -0400
Content-Disposition: inline
In-Reply-To: <20110603111049.d5967bb3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Chris Mason <chris.mason@oracle.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Miao Xie <miaox@cn.fujitsu.com>, David Sterba <dave@jikos.cz>, Tsutomu Itoh <t-itoh@jp.fujitsu.com>, Itaru Kitayama <kitayama@cl.bb4u.ne.jp>, Linus <torvalds@linux-foundation.org>

Hi,

On Fri, Jun 03, 2011 at 11:10:49AM +1000, Stephen Rothwell wrote:
> fs/btrfs/delayed-inode.c: In function 'btrfs_batch_insert_items':
> fs/btrfs/delayed-inode.c:670:6: warning: 'nitems' may be used uninitialized in this function
> 
> Introduced by commit 16cdcec736cd ("btrfs: implement delayed inode items
> operation").  I think this is a real bug.  This variable is not
> initialised, only incremented and tested.

yes, it's a bug and has been already hit (fix pending):

http://marc.info/?l=linux-btrfs&m=130678270307885&w=4

thanks,
david
