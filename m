From: YueHaibing <yuehaibing@huawei.com>
Subject: Re: linux-next: build failure after merge of the net-next tree
Date: Fri, 27 Jul 2018 20:18:06 +0800
Message-ID: <f8be91dd-aafc-c1a4-6e76-efaf3caea4d0@huawei.com>
References: <20180727203259.4ec64ff9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180727203259.4ec64ff9@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 2018/7/27 18:32, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the net-next tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> hns_roce_hw_v1.c:(.text.hns_roce_v1_reset+0x8c): undefined reference to `.hns_dsaf_roce_reset'
> hns_roce_hw_v1.c:(.text.hns_roce_v1_reset+0xdc): undefined reference to `.hns_dsaf_roce_reset'
> 
> Caused by commit
> 
>   336a443bd9dd ("net: hns: Make many functions static")

Sorry,I forgot do a allyesconfig. And I have post a fix patch, Dvaid applied it:

[PATCH net-next] net: hns: make hns_dsaf_roce_reset non static

https://lkml.org/lkml/2018/7/26/939

> 
> I have applied the following patch for today.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 27 Jul 2018 20:23:20 +1000
> Subject: [PATCH] net: hns: make hns_dsaf_roce_reset() not static
> 
> This function is declared in a header file and used in a different
> source file.
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/net/ethernet/hisilicon/hns/hns_dsaf_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/hisilicon/hns/hns_dsaf_main.c b/drivers/net/ethernet/hisilicon/hns/hns_dsaf_main.c
> index 7afc67510569..619e6ce465c2 100644
> --- a/drivers/net/ethernet/hisilicon/hns/hns_dsaf_main.c
> +++ b/drivers/net/ethernet/hisilicon/hns/hns_dsaf_main.c
> @@ -2836,7 +2836,7 @@ module_platform_driver(g_dsaf_driver);
>   * @enable: false - request reset , true - drop reset
>   * retuen 0 - success , negative -fail
>   */
> -static int hns_dsaf_roce_reset(struct fwnode_handle *dsaf_fwnode, bool dereset)
> +int hns_dsaf_roce_reset(struct fwnode_handle *dsaf_fwnode, bool dereset)
>  {
>  	struct dsaf_device *dsaf_dev;
>  	struct platform_device *pdev;
> 
