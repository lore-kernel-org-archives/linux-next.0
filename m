From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: linux-next: manual merge of the usb tree
Date: Tue, 22 Oct 2013 11:02:47 -0700
Message-ID: <5266BDC7.2050701@linux.intel.com>
References: <1382454517-4074-1-git-send-email-treding@nvidia.com> <1382454517-4074-4-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1382454517-4074-4-git-send-email-treding@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 10/22/2013 08:08 AM, Thierry Reding wrote:
> Today's linux-next merge of the usb tree got a conflict in
>
> 	drivers/Kconfig
>
> caused by commits ff76496 (drivers: phy: add generic PHY framework) and
> 12cc4b38 (PowerCap: Add to drivers Kconfig and Makefile).
>
> I fixed it up (see below). Please verify that the resolution look good.
>
> Thanks,
> Thierry
> ---
> diff --cc drivers/Kconfig
> index 969e987,8f45144..97536a2
> --- a/drivers/Kconfig
> +++ b/drivers/Kconfig
> @@@ -166,6 -166,6 +166,8 @@@ source "drivers/reset/Kconfig
>    
>    source "drivers/fmc/Kconfig"
>    
>   +source "drivers/powercap/Kconfig"
>   +
Look OK.
> + source "drivers/phy/Kconfig"
> +
>    endmenu

Thanks,
Srinivas
