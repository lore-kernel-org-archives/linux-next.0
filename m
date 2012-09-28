From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: manual merge of the signal tree with the vfs tree
Date: Fri, 28 Sep 2012 12:56:35 +0100
Message-ID: <20120928115635.GE13973@ZenIV.linux.org.uk>
References: <20120928155639.aadab0554080381b4c38a847@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:53977 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753720Ab2I1L4g (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 28 Sep 2012 07:56:36 -0400
Content-Disposition: inline
In-Reply-To: <20120928155639.aadab0554080381b4c38a847@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Kelly <alex.page.kelly@gmail.com>, Andrew Morton <akpm@linux-foundation.org>

On Fri, Sep 28, 2012 at 03:56:39PM +1000, Stephen Rothwell wrote:
> Hi Al,
> 
> Today's linux-next merge of the signal tree got a conflict in fs/exec.c
> between commit 5b8a94d461a7 ("coredump: move core dump functionality into
> its own file") from the vfs tree and commits 70446600fa12 ("arm:
> introduce ret_from_kernel_execve(), switch to generic kernel_execve()")
> and 5e41814a7d8b ("arm: get rid of execve wrapper, switch to generic
> execve() implementation") from the signal tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
> 
> BTW, Al, you have that vfs tree commit (and others) authored by you ...

Gyah...  Will fix ASAP; sorry, guys.
