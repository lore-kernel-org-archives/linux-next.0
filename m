From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: Re: linux-next: build warning after merge of the squashfs tree
Date: Sun, 23 May 2010 03:39:54 +0100
Message-ID: <4BF8957A.9090506@lougher.demon.co.uk>
References: <20100522163042.13478ac4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from lon1-post-2.mail.demon.net ([195.173.77.149]:40780 "EHLO
	lon1-post-2.mail.demon.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755678Ab0EWCme (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Sat, 22 May 2010 22:42:34 -0400
In-Reply-To: <20100522163042.13478ac4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Hemminger <shemminger@vyatta.com>

Stephen Rothwell wrote:
> Hi Phillip,
> 
> After merging the squashfs tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> fs/squashfs/super.c: In function 'squashfs_fill_super':
> fs/squashfs/super.c:265: warning: assignment from incompatible pointer type
> 
> Introduced by commit 67f66cc6c728de183d9d43c243cb163c1ebd8e04 ("squashfs:
> add new extended inode types") from the squashfs tree interacting with
> commit bb4354538eb7b92f32cfedbad68c7be266c0b467 ("fs: xattr_handler table
> should be const") from Linus' tree.

Fixed.  Thanks.

Phillip
