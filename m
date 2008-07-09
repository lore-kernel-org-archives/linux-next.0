From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: linux-next: Tree for July 9
Date: Wed, 9 Jul 2008 16:30:28 +0200
Message-ID: <20080709143028.GA24152@osiris.boeblingen.de.ibm.com>
References: <20080709183047.0eb1eb72.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate3.de.ibm.com ([195.212.29.152]:1542 "EHLO
	mtagate3.de.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751648AbYGIObB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 9 Jul 2008 10:31:01 -0400
Content-Disposition: inline
In-Reply-To: <20080709183047.0eb1eb72.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, Jul 09, 2008 at 06:30:47PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since next-20080708:
> 
> Temporarily dropped tree: ttydev (since it would not import on top of any
> tree I have)
> 
> The x86 tree lost a conflict against the ftrace tree.
> 
> The ide tree gained 2 conflicts against Linus' tree.
> 
> The nfs tree gained a conflict against Linus' tree.
> 
> The acpi tree lost 5 conflicts against various trees but gained another
> against the x86 tree.
> 
> The net tree lost 2 conflicts against the x86 wireless-current trees.
> 
> I have also applied the following patches for known problems (I assume
> that these will be merged into their appropriate trees shortly):
> 
> 	linux-next: zero based percpu build error on s390

Ingo, will you merge/pick this patch up? The original patch which causes
the problems came in via one of your git trees. Patch in question is

"Zero based percpu: infrastructure to rebase the per cpu area to zero"

Thanks.
