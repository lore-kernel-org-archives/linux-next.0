From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: linux-next: build warning after merge of the mac80211-next tree
Date: Thu, 24 May 2018 10:51:17 +0200
Message-ID: <CAK8P3a3MMjg5oDVM_OAZ_nKeJ4zKK5PrDE+6UgQQfNxwEhRbMA@mail.gmail.com>
References: <20180509145624.643d2e56@canb.auug.org.au> <87po221j08.fsf@purkki.adurom.net>
 <CAK8P3a1tdhO6FX76vMXdpd6FxN87RjhLeKW4ws8GgOHqAwr4qA@mail.gmail.com> <87muwpd76a.fsf@kamboji.qca.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87muwpd76a.fsf-HodKDYzPHsUD5k0oWYwrnHL1okKdlPRT@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, Linux-Next Mailing List <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke-LJ9M9ZcSy1A@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Thu, May 24, 2018 at 6:11 AM, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> writes:
>> I also bisected this new warning to the same commit above:
>>
>> net/batman-adv/bat_v_elp.c: In function 'batadv_v_elp_get_throughput':
>> net/batman-adv/bat_v_elp.c:154:1: warning: the frame size of 1736
>> bytes is larger than 1024 bytes [-Wframe-larger-than=]
>
> This should fix it:
>
> 8689c051a201 cfg80211: dynamically allocate per-tid stats for station info
>
> https://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211-next.git/commit/?id=8689c051a20195b228e19acb155c7d6e48a86753

Thanks for the pointer, I'll just wait for that to make it into
linux-next (which
hasn't been released in a few days now) then.

      Arnd
