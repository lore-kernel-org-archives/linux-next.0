From: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: linux-next: build failure after merge of the access_once tree
Date: Sun, 07 Dec 2014 21:57:49 +0100
Message-ID: <5484BF4D.1020809@de.ibm.com>
References: <20141205213224.2dcc20e9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp17.uk.ibm.com ([195.75.94.113]:51498 "EHLO
	e06smtp17.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752700AbaLGU5x (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 7 Dec 2014 15:57:53 -0500
Received: from /spool/local
	by e06smtp17.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <borntraeger@de.ibm.com>;
	Sun, 7 Dec 2014 20:57:51 -0000
In-Reply-To: <20141205213224.2dcc20e9@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Am 05.12.2014 um 11:32 schrieb Stephen Rothwell:
> Hi Christian,
> 
> After merging the access_once tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> In file included from include/linux/compiler.h:189:0,
>                  from include/uapi/linux/stddef.h:1,
>                  from include/linux/stddef.h:4,
>                  from include/uapi/linux/posix_types.h:4,
>                  from include/linux/fdtable.h:8,
>                  from security/apparmor/domain.c:16:
> include/linux/types.h:14:9: error: unknown type name '__kernel_fd_set'
>  typedef __kernel_fd_set  fd_set;
>          ^
> 
> And many more :-(
> 
> Presumably caused by commit b06f66134856 ("kernel: Provide READ_ONCE
> and ASSIGN_ONCE") which added types.h into compiler.h, but I am not
> sure.  It could be an interaction with something else in linux-next, of
> course.
> 
> I have dropped the access_once tree for today, sorry.
> 

Interesting, I double checked with defconfig and cross compilation. But yes, using allmodconfig fails.
I have changed that to uapi/linux/types.h and __u<xx>. This seems to fix it as it only adds a small set of types.

Can you re-add?

Christian
