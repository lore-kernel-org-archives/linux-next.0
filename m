From: Toshi Kani <toshi.kani@hp.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Thu, 05 Mar 2015 08:22:00 -0700
Message-ID: <1425568920.17007.273.camel@misato.fc.hp.com>
References: <20150305154751.482ae42a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150305154751.482ae42a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, 2015-03-05 at 15:47 +1100, Stephen Rothwell wrote:
> Hi Andrew,
> 
> After merging the akpm-current tree, today's linux-next build (bfin
> TCM-BF537_defconfig and many others) failed like this:
> 
> (.init.text+0x5f8): undefined reference to `ioremap_huge_init'
> 
> Caused by commit 45eaed3ec431 ("lib/ioremap.c: add huge I/O map
> capability interfaces"). lib/ioremp.o is only built if CONFIG_MMU is
> set ...

My apology.  I am sending the fix shortly.

Thanks,
-Toshi
