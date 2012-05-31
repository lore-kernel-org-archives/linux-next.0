From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: build failure after merge of the vfs tree
Date: Thu, 31 May 2012 02:02:24 +0100
Message-ID: <20120531010224.GC11775@ZenIV.linux.org.uk>
References: <20120531105108.1bdae885e23a49429d9b3b07@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:57503 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754614Ab2EaBC0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 30 May 2012 21:02:26 -0400
Content-Disposition: inline
In-Reply-To: <20120531105108.1bdae885e23a49429d9b3b07@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, May 31, 2012 at 10:51:08AM +1000, Stephen Rothwell wrote:
> Hi Al,
> 
> After merging the vfs tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> In file included from include/linux/stat.h:6:0,
>                  from include/linux/module.h:10,
>                  from init/main.c:13:
> arch/powerpc/include/asm/stat.h:33:2: error: expected specifier-qualifier-list before 'unisgned'
> 
> and many, many more. :-(
> 
> Caused by commit 9f240ea8060e ("powerpc: get rid of nlink_t uses, switch
> to explicitly-sized type").
> 
> I have used the vfs tree from next-20120529 for today.

Grr...  s/unisgned/unsigned/, of course - in two lines in there.  With that
it seems to build...
