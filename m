From: Ted Ts'o <tytso@mit.edu>
Subject: Re: linux-next: build warning in Linus' tree
Date: Tue, 24 Apr 2012 13:09:43 -0400
Message-ID: <20120424170943.GD18865@thunk.org>
References: <20120424112049.45955d7025fdfb3ce182ed2e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from li9-11.members.linode.com ([67.18.176.11]:47438 "EHLO
	test.thunk.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756633Ab2DXRJr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Apr 2012 13:09:47 -0400
Content-Disposition: inline
In-Reply-To: <20120424112049.45955d7025fdfb3ce182ed2e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Apr 24, 2012 at 11:20:49AM +1000, Stephen Rothwell wrote:
> 
> Using Linus' tree, today's linux-next build (powerpc ppc64_defconfig)
> produced this warning:
> 
> fs/ext4/super.c: In function 'parse_options':
> fs/ext4/super.c:1600:23: warning: unused variable 'sbi' [-Wunused-variable]
> 
> Introduced by commit 26092bf52478 ("ext4: use a table-driven handler for
> mount options").  This build has CONFIG_QUOTA not set.

This should be fixed in mainline now.

Regards,

					- Ted
