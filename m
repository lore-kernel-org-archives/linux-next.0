From: Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: Re: linux-next: manual merge of the at91 tree with the at91-fixes
 tree
Date: Fri, 5 Apr 2019 11:05:45 +0200
Message-ID: <20190405090545.7tdtbbxussybt2yq@M43218.corp.atmel.com>
References: <20190405091519.48aa4098@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190405091519.48aa4098@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Peng Hao <peng.hao2@zte.com.cn>, Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Fri, Apr 05, 2019 at 09:15:19AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the at91 tree got a conflict in:
> 
>   arch/arm/mach-at91/pm.c
> 
> between commit:
> 
>   ba5e60c9b75d ("arm/mach-at91/pm : fix possible object reference leak")
> 
> from the at91-fixes tree and commit:
> 
>   c3f5b8fde71f ("ARM: at91: pm: introduce at91_soc_pm structure")
> 
> from the at91 tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc arch/arm/mach-at91/pm.c
> index 2a757dcaa1a5,5571658b3c46..000000000000
> --- a/arch/arm/mach-at91/pm.c
> +++ b/arch/arm/mach-at91/pm.c
> @@@ -620,10 -676,8 +676,10 @@@ static int __init at91_pm_backup_init(v
>   	return 0;
>   
>   securam_fail:
>  +	put_device(&pdev->dev);
>  +securam_fail_no_ref_dev:
> - 	iounmap(pm_data.sfrbu);
> - 	pm_data.sfrbu = NULL;
> + 	iounmap(soc_pm.data.sfrbu);
> + 	soc_pm.data.sfrbu = NULL;
>   	return ret;
>   }
>   

Resolution sounds good.

Thanks

Ludovic
