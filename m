From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: build warnings after merge of the moduleh tree
Date: Wed, 12 Oct 2011 22:00:35 -0400
Message-ID: <CAP=VYLp6T+dPpSQQD_WsqEfuwuOX5vs0GgkRynwn2o5WzYPCRA@mail.gmail.com>
References: <20111012173019.37dbde1f6797be48f8ad7c62@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:49174 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751489Ab1JMCAg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 12 Oct 2011 22:00:36 -0400
In-Reply-To: <20111012173019.37dbde1f6797be48f8ad7c62@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arend van Spriel <arend@broadcom.com>, "John W. Linville" <linville@tuxdriver.com>

On Wed, Oct 12, 2011 at 2:30 AM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi Paul,
>
> After merging the moduleh tree, today's linux-next build (x86_64
> allmodconfig) produced these warnings:
>
> drivers/net/wireless/brcm80211/brcmutil/wifi.c:43:1: warning: data de=
finition has no type or storage class [enabled by default]
> drivers/net/wireless/brcm80211/brcmutil/wifi.c:43:1: warning: type de=
faults to 'int' in declaration of 'EXPORT_SYMBOL' [-Wimplicit-int]
> drivers/net/wireless/brcm80211/brcmutil/wifi.c:43:1: warning: paramet=
er names (without types) in function declaration [enabled by default]
> drivers/net/wireless/brcm80211/brcmutil/wifi.c:79:1: warning: data de=
finition has no type or storage class [enabled by default]
> drivers/net/wireless/brcm80211/brcmutil/wifi.c:79:1: warning: type de=
faults to 'int' in declaration of 'EXPORT_SYMBOL' [-Wimplicit-int]
> drivers/net/wireless/brcm80211/brcmutil/wifi.c:79:1: warning: paramet=
er names (without types) in function declaration [enabled by default]
> drivers/net/wireless/brcm80211/brcmutil/wifi.c:136:1: warning: data d=
efinition has no type or storage class [enabled by default]
> drivers/net/wireless/brcm80211/brcmutil/wifi.c:136:1: warning: type d=
efaults to 'int' in declaration of 'EXPORT_SYMBOL' [-Wimplicit-int]
> drivers/net/wireless/brcm80211/brcmutil/wifi.c:136:1: warning: parame=
ter names (without types) in function declaration [enabled by default]
> drivers/net/wireless/brcm80211/brcmfmac/bcmsdh.c:348:1: warning: data=
 definition has no type or storage class [enabled by default]
> drivers/net/wireless/brcm80211/brcmfmac/bcmsdh.c:348:1: warning: type=
 defaults to 'int' in declaration of 'EXPORT_SYMBOL' [-Wimplicit-int]
> drivers/net/wireless/brcm80211/brcmfmac/bcmsdh.c:348:1: warning: para=
meter names (without types) in function declaration [enabled by default=
]
> drivers/net/wireless/brcm80211/brcmfmac/bcmsdh.c:363:1: warning: data=
 definition has no type or storage class [enabled by default]
> drivers/net/wireless/brcm80211/brcmfmac/bcmsdh.c:363:1: warning: type=
 defaults to 'int' in declaration of 'EXPORT_SYMBOL' [-Wimplicit-int]
> drivers/net/wireless/brcm80211/brcmfmac/bcmsdh.c:363:1: warning: para=
meter names (without types) in function declaration [enabled by default=
]
>
> Caused by commit 5b435de0d786 ("net: wireless: add brcm80211 drivers"=
)
> from the wireless tree interacting with the module.h split up.
>
> I have added the following patch:

Thanks Stephen, added to the post merge queue with the other post-merge
wireless export.h additions.

Paul.

>
> From 9ea7a8cb92322497a92d464e6e40cd1da20fbcde Mon Sep 17 00:00:00 200=
1
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 12 Oct 2011 17:22:53 +1100
> Subject: [PATCH] net: wireless; brcm80211: add export.h
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
> =A0drivers/net/wireless/brcm80211/brcmfmac/bcmsdh.c | =A0 =A01 +
> =A0drivers/net/wireless/brcm80211/brcmutil/wifi.c =A0 | =A0 =A02 ++
> =A02 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/net/wireless/brcm80211/brcmfmac/bcmsdh.c b/drive=
rs/net/wireless/brcm80211/brcmfmac/bcmsdh.c
> index bff9dcd..76c78fd 100644
> --- a/drivers/net/wireless/brcm80211/brcmfmac/bcmsdh.c
> +++ b/drivers/net/wireless/brcm80211/brcmfmac/bcmsdh.c
> @@ -21,6 +21,7 @@
> =A0#include <linux/pci_ids.h>
> =A0#include <linux/sched.h>
> =A0#include <linux/completion.h>
> +#include <linux/export.h>
> =A0#include <linux/mmc/sdio.h>
> =A0#include <linux/mmc/sdio_func.h>
> =A0#include <linux/mmc/card.h>
> diff --git a/drivers/net/wireless/brcm80211/brcmutil/wifi.c b/drivers=
/net/wireless/brcm80211/brcmutil/wifi.c
> index 509e25c..5616fa8 100644
> --- a/drivers/net/wireless/brcm80211/brcmutil/wifi.c
> +++ b/drivers/net/wireless/brcm80211/brcmutil/wifi.c
> @@ -13,6 +13,8 @@
> =A0* OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF=
 OR IN
> =A0* CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
> =A0*/
> +#include <linux/export.h>
> +
> =A0#include <brcmu_wifi.h>
>
> =A0/*
> --
> 1.7.6.3
>
> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
> http://www.canb.auug.org.au/~sfr/
>
