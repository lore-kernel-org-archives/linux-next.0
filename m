From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: manual merge of the slabh tree with the percpu tree
Date: Wed, 31 Mar 2010 11:44:04 +0900
Message-ID: <4BB2B6F4.6010701@kernel.org>
References: <20100330172253.de55195b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:35100 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752653Ab0CaCoI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 30 Mar 2010 22:44:08 -0400
In-Reply-To: <20100330172253.de55195b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 03/30/2010 03:22 PM, Stephen Rothwell wrote:
> Hi Tejun,
> 
> Today's linux-next merge of the slabh tree got a conflict in
> include/linux/percpu.h between commit
> 10fad5e46f6c7bdfb01b1a012380a38e3c6ab346 ("percpu, module: implement and
> use is_kernel/module_percpu_address()") from the percpu tree and commit
> d103d3b3e8512312b5254950035366d4422a479a ("percpu: don't implicitly
> include slab.h from percpu.h") from the slabh tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Thanks.  I'll soon push the stuff in percpu#for-next to mainline
(they're fixes) and merge it into slabh.

-- 
tejun
