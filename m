From: Piotr Hosowicz <piotr@hosowicz.com>
Subject: Re: Intel sound proke in today;s next
Date: Sun, 25 Jul 2010 17:56:50 +0200
Message-ID: <4C4C5EC2.4050205@example.com>
References: <20100723164931.7bf2160f.sfr@canb.auug.org.au>	<20100723090831.6af4a288.randy.dunlap@oracle.com>	<4C49DE64.6000902@example.com>	<20100724115900.6b31c691.sfr@canb.auug.org.au> <s5hy6cza8ei.wl%tiwai@suse.de>
Reply-To: piotr@hosowicz.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 63.mail-out.ovh.net ([91.121.185.56]:57848 "HELO
	63.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751887Ab0GYP44 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 25 Jul 2010 11:56:56 -0400
In-Reply-To: <s5hy6cza8ei.wl%tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <randy.dunlap@oracle.com>, tj@kernel.org, linux-next@vger.kernel.org

On 25.07.2010 17:27, Takashi Iwai wrote:
> At Sat, 24 Jul 2010 11:59:00 +1000,
> Stephen Rothwell wrote:
>>
>> [Just cc'ing the sound tree contact]
>>
>> On Fri, 23 Jul 2010 20:24:36 +0200 Piotr Hosowicz<piotr@hosowicz.com>  wrote:
>>>
>>> Hello,
>>>
>>> I just downloaded today's next and built it, then booted. Sound is not
>>> working, my card is:
>>>
>>> 00:1b.0 Audio device: Intel Corporation 82801JI (ICH10 Family) HD Audio
>>> Controller
>>>
>>> I am now booted with latest git kernel and cannot provide more info
>>> here, I rebooted with that kernel because I am going to sleep and I like
>>> to listen to music by night. If more details is necessary I could boot
>>> that next tommorow, but tell me what you need.
>
> Make sure that your mixer setup is correct with a new kernel.
> Usually alsactl restores the right mixer values, though.
>
> At best, run alsa-info.sh (with --no-upload option) on both kernels to
> compare.  Also you can try to pull only sound git tree instead of
> linux-kernel to identify whether it's a problem in the sound tree or
> somewhere else.  Anyway, see Documentation/sound/alsa/HD-Audio.txt for
> some details.

I do not see such script, alsa-info.sh. I dont know how to pull only the 
sound tree. Tommorrow morning I will check if there is a new main kernel 
version and build it. Should I expect that there will be a former 
problem again ? If so I will investigate it deeper.

Regards,

Piotr Hosowicz

-- 
Janusz Korwin-Mikke:
"Idiota z dyplomem to taki sam idiota,
jak przedtem - tylko z pretensjami."
NP: Patrick O'Hearn - Approaching Summit
NB: 2.6.35-rc6-git1
