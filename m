From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: linux-next: build warning after merge of the extcon tree
Date: Thu, 24 Jan 2019 14:53:09 +0900
Message-ID: <fc9bc070-dfc1-8708-8c8d-56e6838b6c7a@samsung.com>
References: <CGME20190124034729epcas5p4a890f486e03e78432e58a773d7d20633@epcas5p4.samsung.com>
        <20190124144713.4330ec34@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190124144713.4330ec34@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

Thanks for the test and report. I'll fix it.

On 19. 1. 24. 오후 12:47, Stephen Rothwell wrote:
> Hi Chanwoo,
> 
> After merging the extcon tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> WARNING: modpost: missing MODULE_LICENSE() in drivers/extcon/extcon-ptn5150.o
> see include/linux/module.h for more information
> 
> Introduced by commit
> 
>   58963276749e ("extcon: Add support for ptn5150 extcon driver")
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
