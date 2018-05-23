From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: linux-next: build warning after merge of the mac80211-next tree
Date: Wed, 23 May 2018 23:55:00 +0200
Message-ID: <CAK8P3a1tdhO6FX76vMXdpd6FxN87RjhLeKW4ws8GgOHqAwr4qA@mail.gmail.com>
References: <20180509145624.643d2e56@canb.auug.org.au> <87po221j08.fsf@purkki.adurom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87po221j08.fsf-5ukZ45wKbUHoml4zekdYB16hYfS7NtTn@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, Linux-Next Mailing List <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke-LJ9M9ZcSy1A@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Fri, May 11, 2018 at 2:20 PM, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org> writes:
>
>> After merging the mac80211-next tree, today's linux-next build (arm_multi
>> v7_defconfig) produced this warning:
>>
>> drivers/net/wireless/marvell/mwifiex/uap_event.c: In function 'mwifiex_process_uap_event':
>> drivers/net/wireless/marvell/mwifiex/uap_event.c:333:1: warning: the frame size of 1680 bytes is larger than 1024 bytes [-Wframe-larger-than=]
>>  }
>>  ^
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c: In function 'brcmf_notify_connect_status_ap':
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:5530:1: warning: the frame size of 1680 bytes is larger than 1024 bytes [-Wframe-larger-than=]
>>  }
>>  ^
>>
>> Maybe introduced by commit
>>
>>   52539ca89f36 ("cfg80211: Expose TXQ stats and parameters to userspace")
>
> Btw Stephen for mac80211 reports it would be a good idea to also cc
> linux-wireless list, in case Johannes is not around etc.

I also bisected this new warning to the same commit above:

net/batman-adv/bat_v_elp.c: In function 'batadv_v_elp_get_throughput':
net/batman-adv/bat_v_elp.c:154:1: warning: the frame size of 1736
bytes is larger than 1024 bytes [-Wframe-larger-than=]

      Arnd
