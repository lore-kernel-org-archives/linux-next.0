From: Jan Kara <jack@suse.cz>
Subject: Re: linux-next: build warning after merge of the final tree (ext3
 tree related)
Date: Fri, 27 May 2011 15:54:05 +0200
Message-ID: <20110527135405.GA18230@quack.suse.cz>
References: <20110527165906.97310c97.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:51234 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754258Ab1E0NyH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 27 May 2011 09:54:07 -0400
Content-Disposition: inline
In-Reply-To: <20110527165906.97310c97.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jan Kara <jack@suse.cz>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Czerner <lczerner@redhat.com>

On Fri 27-05-11 16:59:06, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the final tree, today's linux-next build (gcc 4.5.2, powerpc
> ppc44x_defconfig) produced this warning:
> 
> fs/ext3/inode.c: In function 'ext3_get_blocks_handle':
> fs/ext3/inode.c:976:8: warning: array subscript is below array bounds
> 
> Introduced by commit 20024a79a97b ("ext3: Add fixed tracepoints").
  Thanks, fixed (it was a real bug that could have been triggered on
a corrupted filesystem).

								Honza
-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
