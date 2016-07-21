From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: linux-next: build failure after merge of the nvdimm tree
Date: Thu, 21 Jul 2016 14:33:01 -0700
Message-ID: <CAPcyv4jDv0F+mHPkxG_wCyO_yH8ahOa2kAZMyGM+pEn0eTF3TQ@mail.gmail.com>
References: <20160721161306.5e51e178@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:35721 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754349AbcGUVdD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 21 Jul 2016 17:33:03 -0400
Received: by mail-oi0-f41.google.com with SMTP id l72so137057466oig.2
        for <linux-next@vger.kernel.org>; Thu, 21 Jul 2016 14:33:02 -0700 (PDT)
In-Reply-To: <20160721161306.5e51e178@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Jul 20, 2016 at 11:13 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Dan,
>
> After merging the nvdimm tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> arch/powerpc/sysdev/axonram.c: In function 'axon_ram_direct_access':
> arch/powerpc/sysdev/axonram.c:151:9: error: assignment makes pointer from integer without a cast [-Werror=int-conversion]
>   *kaddr = bank->io_addr + offset;
>          ^
>
> Caused by commit
>
>   6e9c9dda79d9 ("pmem: kill __pmem address space")
>
> I have used the nvdimm tree from next-20160720 for today.

Sorry about that.  I had received a positive build notification from
the kbuild robot for ppc64_defconfig, but it seems that was a false
positive.

I've fixed it up and refreshed the branch.
