From: Richard Weinberger <richard@nod.at>
Subject: Re: linux-next: Fixes tags need some work in the mtd tree
Date: Mon, 6 May 2019 22:45:10 +0200 (CEST)
Message-ID: <1062675236.47533.1557175510785.JavaMail.zimbra@nod.at>
References: <20190507064008.1ecba58b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190507064008.1ecba58b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: linux-next.vger.kernel.org

Stephen,

----- Ursprüngliche Mail -----
> In commit
> 
>  d41970097f10 ("mtd: maps: Allow MTD_PHYSMAP with MTD_RAM")
> 
> Fixes tag
> 
>  Fixes: commit 642b1e8dbed7 ("mtd: maps: Merge physmap_of.c into physmap-core.c")
> 
> has these problem(s):
> 
>  - leading word 'commit' unexpected
> 
> In commit
> 
>  64d14c6fe040 ("mtd: maps: physmap: Store gpio_values correctly")
> 
> Fixes tag
> 
>  Fixes: commit ba32ce95cbd9 ("mtd: maps: Merge gpio-addr-flash.c into
>  physmap-core.c")
> 
> has these problem(s):
> 
>  - leading word 'commit' unexpected

What is the suggest approach to fix that?
Rebase and force-push?

Thanks,
//richard
