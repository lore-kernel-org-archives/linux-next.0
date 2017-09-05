From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the rpmsg tree with the qcom tree
Date: Tue, 5 Sep 2017 10:27:35 +1000
Message-ID: <20170905102735.4e59ffc9@canb.auug.org.au>
References: <20170809145727.7b3849da@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170809145727.7b3849da@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@codeaurora.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: linux-next.vger.kernel.org

Hi all,

On Wed, 9 Aug 2017 14:57:27 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Today's linux-next merge of the rpmsg tree got a conflict in:
> 
>   drivers/soc/qcom/Kconfig
> 
> between commit:
> 
>   2a464815d326 ("soc: qcom: bring all qcom drivers into a submenu")
> 
> from the qcom tree and commit:
> 
>   c4d77d5fcd8b ("soc: qcom: GLINK SSR notifier")
> 
> from the rpmsg tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc drivers/soc/qcom/Kconfig
> index 5f12657fc552,d0fc331972d2..000000000000
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@@ -1,8 -1,15 +1,17 @@@
>   #
>   # QCOM Soc drivers
>   #
>  +menu "Qualcomm SoC drivers"
>  +
> + config QCOM_GLINK_SSR
> + 	tristate "Qualcomm Glink SSR driver"
> + 	depends on RPMSG
> + 	depends on QCOM_RPROC_COMMON
> + 	help
> + 	  Say y here to enable GLINK SSR support. The GLINK SSR driver
> + 	  implements the SSR protocol for notifying the remote processor about
> + 	  neighboring subsystems going up or down.
> + 
>   config QCOM_GSBI
>           tristate "QCOM General Serial Bus Interface"
>           depends on ARCH_QCOM

Just a reminder that the above conflict still exists (but between the
rpmsg tree and the arm-soc tree, now).

-- 
Cheers,
Stephen Rothwell
