From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: linux-next: Tree for Dec 12
Date: Mon, 12 Dec 2011 16:26:04 -0500
Message-ID: <20111212212604.GA11844@phenom.dumpdata.com>
References: <20111212161444.22a11535656c6bfbd884d9ec@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet15.oracle.com ([141.146.126.227]:18512 "EHLO
	acsinet15.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754002Ab1LLV1E (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 12 Dec 2011 16:27:04 -0500
Content-Disposition: inline
In-Reply-To: <20111212161444.22a11535656c6bfbd884d9ec@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, Dec 12, 2011 at 04:14:44PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20111209:
> 
> New tree: remoteproc
> 
> Removed tree: arm-lpae (its job is done)
> 
> The drm tree gained a conflict against Linus' tree.

Using wholesale the drm tree for the rivers/gpu/drm/nouveau/nouveau_sgdma.c
is the right approach. I tried to create a patch to send to you for it (by
merging drm-next against Linus' tree and running mergetool) - but I don't seem
to get anything out of it (just some fix to the Intel driver).
