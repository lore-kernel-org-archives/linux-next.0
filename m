From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: linux-next: build failure after merge of the nvdimm tree
Date: Fri, 3 Nov 2017 09:04:59 -0700
Message-ID: <CAPcyv4jSbD16zixV3FRVgsd6nPjctTQ3OLi16ryBj7SB-H30=g@mail.gmail.com>
References: <20171103181948.046d2668@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ot0-f177.google.com ([74.125.82.177]:46951 "EHLO
        mail-ot0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751856AbdKCQFA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 3 Nov 2017 12:05:00 -0400
Received: by mail-ot0-f177.google.com with SMTP id h37so2855323otd.3
        for <linux-next@vger.kernel.org>; Fri, 03 Nov 2017 09:05:00 -0700 (PDT)
In-Reply-To: <20171103181948.046d2668@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jan Kara <jack@suse.cz>

On Fri, Nov 3, 2017 at 12:19 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Dan,
>
> After merging the nvdimm tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> In file included from arch/powerpc/kernel/asm-offsets.c:22:0:
> include/linux/mman.h: In function 'calc_vm_flag_bits':
> include/linux/mman.h:109:48: warning: division by zero [-Wdiv-by-zero]
>    ((bit1) <= (bit2) ? ((x) & (bit1)) * ((bit2) / (bit1)) \
>                                                 ^
> include/linux/mman.h:133:9: note: in expansion of macro '_calc_vm_trans'
>          _calc_vm_trans(flags, MAP_SYNC,      VM_SYNC      );
>          ^
> cc1: all warnings being treated as errors
>
> and more like these ...
>
> Caused by commit
>
>   ebd0722a382c ("mm: Define MAP_SYNC and VM_SYNC flags")
>
> Not all architectures use asm-generic/mman.h
>
> I have used the nvdimm tree from next-20171102 for today.

Thanks, Stephen. I included Jan's fix for this issue in today's
version of the libnvdimm-for-next branch.
