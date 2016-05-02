From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: manual merge of the vfs tree with the overlayfs tree
Date: Mon, 2 May 2016 02:23:51 +0100
Message-ID: <20160502012350.GK25498@ZenIV.linux.org.uk>
References: <20160502105943.72202e80@canb.auug.org.au>
 <20160502010838.GJ25498@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:39636 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751398AbcEBBXy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 1 May 2016 21:23:54 -0400
Content-Disposition: inline
In-Reply-To: <20160502010838.GJ25498@ZenIV.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miklos Szeredi <miklos@szeredi.hu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, May 02, 2016 at 02:08:39AM +0100, Al Viro wrote:

> Should use lookup_one_len_unlocked(), actually.  lookup_hash() is
> a microoptimization, losing a lot more on excessive i_mutex contention.
> Either variant works, though.

PS: if anybody has a better name for lookup_one_len_unlocked(), I'll gladly
rename it; the thing hadn't been in the kernel for too long and the name is
somewhat confusing.  It's an equivalent of
	inode_lock()
	lookup_one_len()
	inode_unlock()
except that it avoids taking the lock when it's not needed.
