From: Vinod Koul <vinod.koul@linux.intel.com>
Subject: Re: slave-dma/next - please drop "drivers/dma: linux/module.h
 included twice"
Date: Fri, 09 Mar 2012 14:57:28 +0530
Message-ID: <1331285248.4657.70.camel@vkoul-udesk3>
References: <20120309023643.GA1796@windriver.com>
	 <20120309190829.a6259f5e98d8379dcf88ba98@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:10035 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751151Ab2CIJWY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 9 Mar 2012 04:22:24 -0500
In-Reply-To: <20120309190829.a6259f5e98d8379dcf88ba98@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-next@vger.kernel.org

On Fri, 2012-03-09 at 19:08 +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Thu, 8 Mar 2012 21:36:44 -0500 Paul Gortmaker <paul.gortmaker@windriver.com> wrote:
> >
> > Please drop commit 865d9438eb1f7670d2e88849f059db551b320887 from your
> > tree.  There is a commit to delete all the duplicate module.h includes
> > tree-wide, and since your commit deletes one, and my commit deletes
> > the other, the final tree has no module.h which causes this fail:
> > 
> > http://kisskb.ellerman.id.au/kisskb/buildresult/5819464/
> 
> I have fixed this up in my tree for today.
Thanks, I have reverted this commit now

-- 
~Vinod
