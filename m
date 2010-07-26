From: Piotr Hosowicz <piotr@hosowicz.com>
Subject: Re: Intel sound proke in today;s next
Date: Mon, 26 Jul 2010 22:54:42 +0200
Message-ID: <4C4DF612.6020404@example.com>
References: <20100723164931.7bf2160f.sfr@canb.auug.org.au>	<20100723090831.6af4a288.randy.dunlap@oracle.com>	<4C49DE64.6000902@example.com>	<20100724115900.6b31c691.sfr@canb.auug.org.au>	<s5hy6cza8ei.wl%tiwai@suse.de>	<4C4C5EC2.4050205@example.com>	<s5hlj8yya3v.wl%tiwai@suse.de>	<4C4DBE72.7070900@example.com>	<s5hr5iq9mwk.wl%tiwai@suse.de>	<4C4DC6F1.7090109@example.com>	<s5hocdu9l8k.wl%tiwai@suse.de>	<4C4DD452.9030000@example.com>	<4C4DDC04.8010507@example.com> <s5hk4oi9ewg.wl%tiwai@suse.de>
Reply-To: piotr@hosowicz.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 29.mail-out.ovh.net ([87.98.216.213]:33463 "HELO
	29.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751847Ab0GZUyr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 26 Jul 2010 16:54:47 -0400
In-Reply-To: <s5hk4oi9ewg.wl%tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <randy.dunlap@oracle.com>, tj@kernel.org, linux-next@vger.kernel.org

On 26.07.2010 22:17, Takashi Iwai wrote:

>>>> You need to pass the branch. In this case, pass for-next
>>>
>>> I passed topic/hda and rebuilt the kernel and now everything is wor=
king.
>>
>> I have just git pulled for-next and saw many files downloaded so I
>> wonder how synced with topic/hda it's working.
>
> It contains other two branches, topic/misc and topic/asoc.
> (Also sometimes missing fix/asoc and fix/misc merges).
>
> topic/asoc branch is specific to ASoC, so very likely irrelevant.
> If any, some changes in the sound core code in topic/misc might
> influence in your case...

Ok, so I'll use for-next then. Thank you again, you taught me a lot.

Regards,

Piotr Hosowicz

--=20
Zatrzymuje si=EA samoch=F3d na sejmowym parkingu. Podchodzi do niego=20
ochroniarz i m=F3wi:
- Pan tu parkuje?! Tu Sejm ... Ministrowie, politycy, pos=B3owiei ...
- Dzi=EAki, w=B3=B1cz=EA alarm.
NP: Patrick O'Hearn - Magnificent River
NB: 2.6.35-rc6-20100726-1827-sndfix+
