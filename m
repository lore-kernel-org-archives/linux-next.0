From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: build failure after merge of the pci tree
Date: Sun, 17 Oct 2010 20:02:46 -0700
Message-ID: <20101017200246.195c8e9d@jbarnes-desktop>
References: <20101018132035.c506beff.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cpoproxy3-pub.bluehost.com ([67.222.54.6]:33034 "HELO
	cpoproxy3-pub.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1751263Ab0JRDDc (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Sun, 17 Oct 2010 23:03:32 -0400
In-Reply-To: <20101018132035.c506beff.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>

On Mon, 18 Oct 2010 13:20:35 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Jesse,
> 
> After merging the pci tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/pci/hotplug/pciehp_core.c: In function 'pcied_init':
> drivers/pci/hotplug/pciehp_core.c:348: error: implicit declaration of function 'alloc_ordered_workqueue'
> 
> That function is not declared anywhere except the (yet to be merged)
> workqueues tree.
> 
> I have used the pci tree from next-20101015 for today.
> 
> Please build test what you are exporting for merging into linux-next.

Arg, sorry about that, I'll drop these and just ack them for inclusion
by Tejun.

-- 
Jesse Barnes, Intel Open Source Technology Center
