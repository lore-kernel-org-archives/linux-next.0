From: Sage Weil <sage@newdream.net>
Subject: Re: linux-next: build failure after merge of the ceph tree
Date: Tue, 16 Nov 2010 16:02:02 -0800 (PST)
Message-ID: <Pine.LNX.4.64.1011161558180.1702@cobra.newdream.net>
References: <20101117104314.56aeb069.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20101117104314.56aeb069.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, 17 Nov 2010, Stephen Rothwell wrote:
> Hi Sage,
> 
> After merging the ceph tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> ERROR: "ceph_str_hash" [fs/ceph/ceph.ko] undefined!
> 
> Caused by commit 5f69106b3f68be20015d1d8a43192bc2f14c7046 ("ceph: add
> dir_layout to inode").
> 
> I have used the ceph tree from next-20101116 for today.

I've added the missing EXPORT_SYMBOL and pushed a new for-next.

Thanks!
sage
