From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Fri, 22 Jan 2016 07:37:49 +1100
Message-ID: <20160122073749.39af3588@canb.auug.org.au>
References: <20160121161156.69051295@canb.auug.org.au>
	<20160121051709.GA4749@sudip-pc>
	<20160121162545.367f8ec2@canb.auug.org.au>
	<20160121054705.GA5350@sudip-pc>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50925 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751779AbcAUUhv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 21 Jan 2016 15:37:51 -0500
In-Reply-To: <20160121054705.GA5350@sudip-pc>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>

Hi Sudip,

On Thu, 21 Jan 2016 11:17:05 +0530 Sudip Mukherjee <sudipm.mukherjee@gmail.com> wrote:
>
> Adding that will uncover one more build failure, and the patch for that
> is at:
> https://patchwork.kernel.org/patch/8077891/

Looks like Dave Miller has picked that up.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
