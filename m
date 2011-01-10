From: Jan Kara <jack@suse.cz>
Subject: Re: linux-next: build warnings after merge of the final tree (ext3
 tree related)
Date: Mon, 10 Jan 2011 18:29:19 +0100
Message-ID: <20110110172919.GC4904@quack.suse.cz>
References: <20110107140414.43d5b980.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:58558 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753063Ab1AJR3Y (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 10 Jan 2011 12:29:24 -0500
Content-Disposition: inline
In-Reply-To: <20110107140414.43d5b980.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jan Kara <jack@suse.cz>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Czerner <lczerner@redhat.com>

  Hi Stephen,

On Fri 07-01-11 14:04:14, Stephen Rothwell wrote:
> After merging the final tree, today's linux-next build (powerpc
> ppc44x_defconfig) produced these warnings:
> 
> fs/ext3/balloc.c: In function 'ext3_get_group_no_and_offset':
> fs/ext3/balloc.c:53: warning: comparison of distinct pointer types lacks a cast
> fs/ext3/balloc.c:53: warning: right shift count >= width of type
> fs/ext3/balloc.c:53: warning: passing argument 1 of '__div64_32' from incompatible pointer type
> include/asm-generic/div64.h:35: note: expected 'uint64_t *' but argument is of type 'ext3_fsblk_t *'
> 
> Caused by commit 3e5eb5c509e311fdea2468be913ec264edd4f617 ("ext3: Add
> batched discard support for ext3").
  Thanks for spotting this. It should be fixed in my tree now.

									Honza
-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
