From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: build failure after merge of the vfs tree
Date: Thu, 7 Jan 2016 02:09:32 +0000
Message-ID: <20160107020932.GA17997@ZenIV.linux.org.uk>
References: <20151210111847.07db6062@canb.auug.org.au>
 <20151221112301.56bcf3f1@canb.auug.org.au>
 <20160107114253.19d92b55@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160107114253.19d92b55@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Marshall <hubcap@omnibond.com>
List-Id: linux-next.vger.kernel.org

On Thu, Jan 07, 2016 at 11:42:53AM +1100, Stephen Rothwell wrote:

> > This patch now looks like this (after changes to the orangefs tree):
> > 

Guys, just set inode->i_link to ORANGEFS_I(dentry->d_inode)->link_target and
have ->get_link = simple_get_link.  Killing orangefs_{follow,get}_link()
entirely.
