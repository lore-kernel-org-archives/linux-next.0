From: Srinath Mannam <srinath.mannam@broadcom.com>
Subject: Re: linux-next: build warning after merge of the phy-next tree
Date: Thu, 28 Mar 2019 08:33:54 +0530
Message-ID: <CABe79T5uhZj6Ybo_7xCZ190qRikdJq9i4OBNEb6YQ0sJ7ukp+A@mail.gmail.com>
References: <20190328112925.0fbe34e2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190328112925.0fbe34e2@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

Thanks for the notice.

I sent patch to fix this warning.
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1964942.html

Regards,
Srinath.

On Thu, Mar 28, 2019 at 5:59 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Kishon,
>
> After merging the phy-next tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>
> In file included from include/linux/phy/phy.h:19,
>                  from drivers/phy/broadcom/phy-bcm-sr-usb.c:10:
> drivers/phy/broadcom/phy-bcm-sr-usb.c: In function 'bcm_usb_phy_probe':
> include/linux/device.h:1138:19: warning: 'phy_cfg' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   dev->driver_data = data;
>   ~~~~~~~~~~~~~~~~~^~~~~~
> drivers/phy/broadcom/phy-bcm-sr-usb.c:289:26: note: 'phy_cfg' was declared here
>   struct bcm_usb_phy_cfg *phy_cfg;
>                           ^~~~~~~
>
> Introduced by commit
>
>   a3b96057577c ("phy: sr-usb: Add Stingray USB PHY driver")
>
> --
> Cheers,
> Stephen Rothwell
