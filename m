From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: linux-next: build warning after merge of the mali-dp tree
Date: Fri, 18 Jan 2019 10:43:58 +0000
Message-ID: <20190118104358.GG20661@e110455-lin.cambridge.arm.com>
References: <20190118112811.091dd962@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190118112811.091dd962@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "James Qian Wang (Arm Technology China)" <james.qian.wang@arm.com>
List-Id: linux-next.vger.kernel.org

On Fri, Jan 18, 2019 at 11:28:11AM +1100, Stephen Rothwell wrote:
> Hi Liviu,
> 
> After merging the mali-dp tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/gpu/drm/arm/display/komeda/komeda_dev.c: In function 'komeda_parse_dt':
> drivers/gpu/drm/arm/display/komeda/komeda_dev.c:52:26: warning: unused variable 'pdev' [-Wunused-variable]
>   struct platform_device *pdev = to_platform_device(dev);
>                           ^~~~
> 
> Introduced by commit
> 
>   7e8d4fcf8daf ("drm: arm/komeda: Remove IRQ parsing from initial series")

Argh, sorry about that! I'll get it fixed!

Thanks for reporting it,
Liviu

> 
> -- 
> Cheers,
> Stephen Rothwell



-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
