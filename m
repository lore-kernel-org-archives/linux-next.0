From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: linux-next: build failure after merge of the workqueues tree
Date: Sun, 20 Feb 2011 21:48:13 -0800
Message-ID: <20110221054813.GA13878@core.coreip.homeip.net>
References: <20110218145747.f4b26b91.sfr@canb.auug.org.au>
 <20110221132708.e9ed5f8f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:35688 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751709Ab1BUFsU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 21 Feb 2011 00:48:20 -0500
Content-Disposition: inline
In-Reply-To: <20110221132708.e9ed5f8f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>

Hi Stephen,

On Mon, Feb 21, 2011 at 01:27:08PM +1100, Stephen Rothwell wrote:
> Hi Dmitry,
> 
> On Fri, 18 Feb 2011 14:57:47 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the workqueues tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > drivers/input/input-polldev.c: In function 'input_polldev_init':
> > drivers/input/input-polldev.c:259: error: 'WQ_FREEZEABLE' undeclared (first use in this function)
> > 
> > Caused by commit 58a69cb47ec6991bf006a3e5d202e8571b0327a4 ("workqueue,
> > freezer: unify spelling of 'freeze' + 'able' to 'freezable'") interacting
> > with commit 8fb3f6f6bf6e17e97712d216f230ba05f2e88ed8 ("Input:
> > input-polldev - create workqueue upfront") from the input tree.
> > 
> > I applied the following fix up patch (and can carry it as necessary):
> 
> This patch is now applicable after the input tree merge as the workqueues
> patch has been merged into Linus' tree.  So, Dmitry, if you merge Linus'
> tree sometime, you should apply this merge fixup.
> 

Actually I will just pull the patch and wait till Tejun's patch
introducing global freezable workqueue hits mainline and convert
input_polldev to use it.

Thanks.

-- 
Dmitry
