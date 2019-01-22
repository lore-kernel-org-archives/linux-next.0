From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [for next][PATCH] iwlwifi: Fix unmet dependency error for IWLWIFI_LEDS
Date: Tue, 22 Jan 2019 18:17:52 +0200
Message-ID: <87munsmztb.fsf@kamboji.qca.qualcomm.com>
References: <20190121233102.13705-1-okaya@kernel.org>
        <ef50896ee3ecc895c72a9fbdedca65ac6433fef2.camel@intel.com>
        <d00c99a7-423a-9a70-5f50-f95c5d044f85@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d00c99a7-423a-9a70-5f50-f95c5d044f85@kernel.org> (Sinan Kaya's
        message of "Tue, 22 Jan 2019 11:12:06 -0500")
Sender: linux-kernel-owner@vger.kernel.org
To: Sinan Kaya <okaya@kernel.org>
Cc: Luciano Coelho <luciano.coelho@intel.com>, linux-next@vger.kernel.org, Johannes Berg <johannes.berg@intel.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, "David S. Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Sinan Kaya <okaya@kernel.org> writes:

> On 1/22/2019 5:15 AM, Luciano Coelho wrote:
>> On Mon, 2019-01-21 at 23:31 +0000, Sinan Kaya wrote:
>>> There is an unresolved dependency as follows:
>>>
>>> IWLWIFI_LEDS selects MAC80211_LEDS.
>>> MAC80211_LEDS depends on MAC80211.
>>>
>>> It is possible to choose MAC80211_LEDS (y) but not choose MAC80211
>>> (n)
>>>
>>> WARNING: unmet direct dependencies detected for MAC80211_LEDS
>>>    Depends on [n]: NET [=y] && WIRELESS [=y] && MAC80211 [=n] &&
>>> LEDS_CLASS [=y]
>>>    Selected by [y]:
>>>    - IWLWIFI_LEDS [=y] && NETDEVICES [=y] && WLAN [=y] &&
>>> WLAN_VENDOR_INTEL [=y] && IWLWIFI [=y] && (LEDS_CLASS [=y]=y ||
>>> LEDS_CLASS [=y]=IWLWIFI [=y])
>>>
>>> Move the MAC80211 dependency into IWLWIFI_LEDS so that we avoid this
>>> configuration.
>>>
>>> Signed-off-by: Sinan Kaya <okaya@kernel.org>
>>> ---
>>
>> Thanks for your patch! But we already have another patch to fix this
>> issued queued for 5.0-rc4 (it's currently in wireless-drivers.git):
>>
>> https://patchwork.kernel.org/patch/10762079/
>
> Is it possible to queue this up soon? There is an effort to clean up
> linux-next against randconfig failures and this issue showed up there.

It already should be in linux-next:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/wireless-drivers.git/commit/?id=ec5aecc0b227f5509d25853537f989ca303e2be1

But it's not in Linus' tree, yet.

-- 
Kalle Valo
