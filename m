From: Stanislaw Gruszka <sgruszka@redhat.com>
Subject: Re: linux-next: build failure after merge of the
 wireless-drivers-next tree
Date: Fri, 3 Aug 2018 11:11:41 +0200
Message-ID: <20180803091140.GA10284@redhat.com>
References: <20180803182942.4de98df2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180803182942.4de98df2@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kalle Valo <kvalo@codeaurora.org>, Wireless <linux-wireless@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi

On Fri, Aug 03, 2018 at 06:29:42PM +1000, Stephen Rothwell wrote:
> After merging the wireless-drivers-next tree, today's linux-next build
> (powerpc allyesconfig) failed like this:
[snip]
> diff --git a/drivers/net/wireless/mediatek/mt76/Kconfig b/drivers/net/wireless/mediatek/mt76/Kconfig
> index 850611ad347a..ad56b3ed2be2 100644
> --- a/drivers/net/wireless/mediatek/mt76/Kconfig
> +++ b/drivers/net/wireless/mediatek/mt76/Kconfig
> @@ -13,6 +13,7 @@ config MT76x0U
>  	tristate "MediaTek MT76x0U (USB) support"
>  	depends on MAC80211
>  	depends on USB
> +	depends on BROKEN
Would be better to limit driver to be build as module.
Hopefully that will fix the issue. I'll post patch in a moment.

Thanks
Stanislaw
