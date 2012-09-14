From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: build failure after merge of the cgroup tree
Date: Fri, 14 Sep 2012 10:00:19 -0700
Message-ID: <20120914170019.GA17747@google.com>
References: <20120914131700.dd3d01a7d17b78082a9bcd55@canb.auug.org.au>
 <5052D51D.3060106@bmw-carit.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:43825 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757349Ab2INRAY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 14 Sep 2012 13:00:24 -0400
Content-Disposition: inline
In-Reply-To: <5052D51D.3060106@bmw-carit.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Wagner <daniel.wagner@bmw-carit.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Li Zefan <lizefan@huawei.com>, Neil Horman <nhorman@tuxdriver.com>

Hello,

On Fri, Sep 14, 2012 at 08:56:29AM +0200, Daniel Wagner wrote:
> On 14.09.2012 05:17, Stephen Rothwell wrote:
> >After merging the cgroup tree, today's linux-next build (powerpc
> >ppc64_defconfig) failed like this:
> >
> >drivers/net/tun.c: In function 'tun_alloc_skb':
> >drivers/net/tun.c:589:2: error: implicit declaration of function 'sock_update_classid' [-Werror=implicit-function-declaration]
> >
> >Caused by commit 1f66c0a8833c ("cgroup: net_cls: Move sock_update_classid()
> >declaration to cls_cgroup.h").  Grep is your friend ...

My apologies.  Forgot allmod build.

> >I have used the cgroup tree from next-20120913 for today.
> 
> Obviously, it is straight forward to fix this but I do not know what
> is the preferred solution. Shall I spin an updated version of this
> patch or add a patch on top of the series?

I fixed the commit in tree.

Thanks.

-- 
tejun
