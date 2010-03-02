From: Christoph Hellwig <hch@infradead.org>
Subject: Re: linux-next: build failure after merge of the ext3 tree
Date: Tue, 2 Mar 2010 04:07:11 -0500
Message-ID: <20100302090711.GA30954@infradead.org>
References: <20100302113634.2c7f5e03.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:55180 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751311Ab0CBJHP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 2 Mar 2010 04:07:15 -0500
Content-Disposition: inline
In-Reply-To: <20100302113634.2c7f5e03.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jan Kara <jack@suse.cz>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>

On Tue, Mar 02, 2010 at 11:36:34AM +1100, Stephen Rothwell wrote:
> Hi Jan,
> 
> After merging the ext3 tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> fs/jfs/jfs_xtree.c: In function 'xtSplitRoot':
> fs/jfs/jfs_xtree.c:1256: error: 'rec' undeclared (first use in this function)
> 
> Caused by commit bff3333e868578990f6fe794a7cba0c74bd433ac ("dquot:
> cleanup space allocation / freeing routines").
> 
> This is annoying ... this file system could be build tested on any
> architecture, so why wasn't it?

I did test the compile, but the version in your tree does not match the
one I submitted.
