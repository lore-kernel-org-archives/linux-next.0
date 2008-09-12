From: "Eric Miao" <eric.y.miao@gmail.com>
Subject: Re: linux-next: manual merge of the pxa tree
Date: Fri, 12 Sep 2008 08:49:55 +0800
Message-ID: <f17812d70809111749n1f0300c8j2f69d933d2c8fdf6@mail.gmail.com>
References: <20080912083515.19517514.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from yx-out-2324.google.com ([74.125.44.29]:62356 "EHLO
	yx-out-2324.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752698AbYILAt5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 11 Sep 2008 20:49:57 -0400
Received: by yx-out-2324.google.com with SMTP id 8so231366yxm.1
        for <linux-next@vger.kernel.org>; Thu, 11 Sep 2008 17:49:55 -0700 (PDT)
In-Reply-To: <20080912083515.19517514.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Fri, Sep 12, 2008 at 6:35 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Eric,
>
> Today's linux-next merge of the pxa tree got a conflict in
> arch/arm/mach-pxa/corgi.c arch/arm/mach-pxa/spitz.c between commit
> fced80c735941fa518ac67c0b61bbe153fb8c050 ("[ARM] Convert asm/io.h to
> linux/io.h") from the arm tree and commits
> c22e92f200a2b5ab8b3571747865afe3dcc7b6b3 ("[ARM] pxa/corgi: use SPI-based
> driver for ads7846, corgi-lcd and max1111"),
> db710817e3432af4d30896cdc41f144e4da7c7e2 ("[ARM] pxa/akita: use pca953x
> instead of akita-ioexp") and 43d5f82350734562e22b9ad9de3ad0aaec6aaffe
> ("[ARM] pxa/spitz: use SPI-based driver for ads7846, corgi-lcd and
> max1111") from the pxa tree.
>
> Just overlapping additions of includes.  I fixed it up (see below) and
> can carry the fixup.
>

Just found that, the fixup looks correct to me. Thanks.
