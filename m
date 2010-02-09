From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: manual merge of the fsnotify tree with the vfs tree
Date: Tue, 9 Feb 2010 05:45:22 +0000
Message-ID: <20100209054521.GK30031@ZenIV.linux.org.uk>
References: <20100209163708.b7ae6d05.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:41312 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750881Ab0BIFp1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Feb 2010 00:45:27 -0500
Content-Disposition: inline
In-Reply-To: <20100209163708.b7ae6d05.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Eric Paris <eparis@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Feb 09, 2010 at 04:37:08PM +1100, Stephen Rothwell wrote:
> Hi Eric,
> 
> Today's linux-next merge of the fsnotify tree got a conflict in
> fs/namei.c between commit 123df2944c436c80640c4281c5bc9c7950b18687 ("Lose
> the new_name argument of fsnotify_move()") from the vfs tree and commit
> 2df5764e29a813f6ba63be094ab8aadc704a78fd ("fsnotify: use unsigned char *
> for dentry->d_name.name") from the fsnotify tree.
> 
> The former removed the code changed by the latter, so I used the former.

FWIW, I've put two commits (audit_inode_child and fsnotify_move ones) into
a new not-for-rebase branch (for-fsnotify) and told Eric, so hopefully
he'll just pull it into fsnotify tree.
