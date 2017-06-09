From: Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: linux-next: Tree for Jun 9
Date: Fri, 9 Jun 2017 19:28:13 +0530
Message-ID: <CAO_48GH=N0q424tCWQ4Mqvuq9wUtV3X1KoAr96xyVecX=v27aQ@mail.gmail.com>
References: <20170609164237.04fc1a7c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wr0-f170.google.com ([209.85.128.170]:35231 "EHLO
        mail-wr0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751715AbdFIN6k (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Jun 2017 09:58:40 -0400
Received: by mail-wr0-f170.google.com with SMTP id q97so34266388wrb.2
        for <linux-next@vger.kernel.org>; Fri, 09 Jun 2017 06:58:34 -0700 (PDT)
In-Reply-To: <20170609164237.04fc1a7c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Stephen,

On 9 June 2017 at 12:12, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
< snip >
> You can see which trees have been included by looking in the Next/Trees
> file in the source.  There are also quilt-import.log and merge.log
> files in the Next directory.  Between each merge, the tree was built
> with a ppc64_defconfig for powerpc and an allmodconfig (with
> CONFIG_BUILD_DOCSRC=n) for x86_64, a multi_v7_defconfig for arm and a
> native build of tools/perf. After the final fixups (if any), I do an
> x86_64 modules_install followed by builds for x86_64 allnoconfig,
> powerpc allnoconfig (32 and 64 bit), ppc44x_defconfig, allyesconfig
> and pseries_le_defconfig and i386, sparc and sparc64 defconfig. And
> finally, a simple boot test of the powerpc pseries_le_defconfig kernel
> in qemu.
>
Thanks very much for this! I was trying to build this with the arm64
defconfig, and it doesn't build due to multiple instance of "emac:
ethernet@1c30000" in arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi.
With one instance removed, the build completes successfully.

It seems to be a merge issue, since the duplicate instance is added by
commit 9afca2c4e379f - just thought I'd let you know.


<snip>

Best regards,
Sumit.
