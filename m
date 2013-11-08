From: Oleg Nesterov <oleg@redhat.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the vfs
	tree
Date: Fri, 8 Nov 2013 13:59:15 +0100
Message-ID: <20131108125915.GA1000@redhat.com>
References: <20131108183001.2564151a619f8f6df3db543a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:41864 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753144Ab3KHM5r (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 8 Nov 2013 07:57:47 -0500
Content-Disposition: inline
In-Reply-To: <20131108183001.2564151a619f8f6df3db543a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>

On 11/08, Stephen Rothwell wrote:
>
> Hi Andrew,
>
> Today's linux-next merge of the akpm-current tree got a conflict in
> fs/anon_inodes.c between commit 24b0303e9532 ("take anon inode allocation
> to libfs.c") from the vfs tree and commit 02f3ac4386d9 ("anon_inodefs:
> forbid open via /proc") from the akpm-current tree.
>
> I just dropped the akpm-current changes for today - they should probably
> be applied to fs/libfs.c.

Well, this probably means that

	anon_inodefs-forbid-open-via-proc.patch

should be dropped. I'll rediff this patch against vfs.git

Oleg.
