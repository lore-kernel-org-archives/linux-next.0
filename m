From: Steve Capper <steve.capper@linaro.org>
Subject: Re: linux-next: manual merge of the arm64-hugepages tree with the
 arm64 tree
Date: Mon, 17 Jun 2013 09:35:25 +0100
Message-ID: <20130617083524.GA28225@linaro.org>
References: <20130617173627.8bd67da7e93639cf85afcedb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-we0-f169.google.com ([74.125.82.169]:49740 "EHLO
	mail-we0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932358Ab3FQIfd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 17 Jun 2013 04:35:33 -0400
Received: by mail-we0-f169.google.com with SMTP id n57so2121529wev.28
        for <linux-next@vger.kernel.org>; Mon, 17 Jun 2013 01:35:32 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20130617173627.8bd67da7e93639cf85afcedb@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Catalin Marinas <catalin.marinas@arm.com>

On Mon, Jun 17, 2013 at 05:36:27PM +1000, Stephen Rothwell wrote:
> Hi Steve,

Hi Stephen,

> 
> Today's linux-next merge of the arm64-hugepages tree got a conflict in
> arch/arm64/Kconfig between commit aa42aa1389a5 ("arm64/xen: introduce
> CONFIG_XEN and hypercall.S on ARM64") from the arm64 tree and commit
> d03bb1455f3a ("ARM64: mm: Raise MAX_ORDER for 64KB pages and THP") from
> the arm64-hugepages tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Thanks this fixup looks good to me.

Cheers,
-- 
Steve
