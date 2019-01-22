From: Luciano Coelho <luciano.coelho@intel.com>
Subject: Re: [for next][PATCH] iwlwifi: Fix unmet dependency error for
 IWLWIFI_LEDS
Date: Tue, 22 Jan 2019 12:15:03 +0200
Message-ID: <ef50896ee3ecc895c72a9fbdedca65ac6433fef2.camel@intel.com>
References: <20190121233102.13705-1-okaya@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190121233102.13705-1-okaya@kernel.org>
Sender: netdev-owner@vger.kernel.org
To: Sinan Kaya <okaya@kernel.org>, linux-next@vger.kernel.org
Cc: Johannes Berg <johannes.berg@intel.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>, "open list:INTEL WIRELESS WIFI LINK (iwlwifi)" <linux-wireless@vger.kernel.org>, "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, 2019-01-21 at 23:31 +0000, Sinan Kaya wrote:
> There is an unresolved dependency as follows:
> 
> IWLWIFI_LEDS selects MAC80211_LEDS.
> MAC80211_LEDS depends on MAC80211.
> 
> It is possible to choose MAC80211_LEDS (y) but not choose MAC80211
> (n)
> 
> WARNING: unmet direct dependencies detected for MAC80211_LEDS
>   Depends on [n]: NET [=y] && WIRELESS [=y] && MAC80211 [=n] &&
> LEDS_CLASS [=y]
>   Selected by [y]:
>   - IWLWIFI_LEDS [=y] && NETDEVICES [=y] && WLAN [=y] &&
> WLAN_VENDOR_INTEL [=y] && IWLWIFI [=y] && (LEDS_CLASS [=y]=y ||
> LEDS_CLASS [=y]=IWLWIFI [=y])
> 
> Move the MAC80211 dependency into IWLWIFI_LEDS so that we avoid this
> configuration.
> 
> Signed-off-by: Sinan Kaya <okaya@kernel.org>
> ---

Thanks for your patch! But we already have another patch to fix this
issued queued for 5.0-rc4 (it's currently in wireless-drivers.git):

https://patchwork.kernel.org/patch/10762079/
