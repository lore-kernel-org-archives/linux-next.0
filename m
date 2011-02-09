From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: build failure after merge of the workqueues tree
Date: Wed, 9 Feb 2011 09:37:28 +0100
Message-ID: <20110209083728.GD6558@htj.dyndns.org>
References: <20110209151204.efef8089.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:41234 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752618Ab1BIIhf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 9 Feb 2011 03:37:35 -0500
Content-Disposition: inline
In-Reply-To: <20110209151204.efef8089.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hello,

On Wed, Feb 09, 2011 at 03:12:04PM +1100, Stephen Rothwell wrote:
> After merging the workqueues tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> kernel/built-in.o:(.toc1+0x14c0): undefined reference to `system_freezeable_wq'
> 
> Caused by commit de62c151df9b6568c67977920267392c432f340a ("workqueue:
> add system_freezeable_wq").
> 
> I have used the workqueues tree from next-20110208 for today.

That was embarrassing.  Sorry.  Updated.

-- 
tejun
