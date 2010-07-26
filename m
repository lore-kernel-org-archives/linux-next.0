From: Piotr Hosowicz <piotr@hosowicz.com>
Subject: Re: Intel sound proke in today;s next
Date: Mon, 26 Jul 2010 18:57:22 +0200
Message-ID: <4C4DBE72.7070900@example.com>
References: <20100723164931.7bf2160f.sfr@canb.auug.org.au>	<20100723090831.6af4a288.randy.dunlap@oracle.com>	<4C49DE64.6000902@example.com>	<20100724115900.6b31c691.sfr@canb.auug.org.au>	<s5hy6cza8ei.wl%tiwai@suse.de>	<4C4C5EC2.4050205@example.com> <s5hlj8yya3v.wl%tiwai@suse.de>
Reply-To: piotr@hosowicz.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 30.mail-out.ovh.net ([213.186.62.213]:60747 "HELO
	30.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1754592Ab0GZQ5h (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 26 Jul 2010 12:57:37 -0400
In-Reply-To: <s5hlj8yya3v.wl%tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <randy.dunlap@oracle.com>, tj@kernel.org, linux-next@vger.kernel.org

On 26.07.2010 09:29, Takashi Iwai wrote:
> At Sun, 25 Jul 2010 17:56:50 +0200,
> Piotr Hosowicz wrote:
>>
>> On 25.07.2010 17:27, Takashi Iwai wrote:
>>> At Sat, 24 Jul 2010 11:59:00 +1000,
>>> Stephen Rothwell wrote:
>>>>
>>>> [Just cc'ing the sound tree contact]
>>>>
>>>> On Fri, 23 Jul 2010 20:24:36 +0200 Piotr Hosowicz<piotr@hosowicz.c=
om>   wrote:
>>>>>
>>>>> Hello,
>>>>>
>>>>> I just downloaded today's next and built it, then booted. Sound i=
s not
>>>>> working, my card is:
>>>>>
>>>>> 00:1b.0 Audio device: Intel Corporation 82801JI (ICH10 Family) HD=
 Audio
>>>>> Controller
>>>>>
>>>>> I am now booted with latest git kernel and cannot provide more in=
fo
>>>>> here, I rebooted with that kernel because I am going to sleep and=
 I like
>>>>> to listen to music by night. If more details is necessary I could=
 boot
>>>>> that next tommorow, but tell me what you need.
>>>
>>> Make sure that your mixer setup is correct with a new kernel.
>>> Usually alsactl restores the right mixer values, though.
>>>
>>> At best, run alsa-info.sh (with --no-upload option) on both kernels=
 to
>>> compare.  Also you can try to pull only sound git tree instead of
>>> linux-kernel to identify whether it's a problem in the sound tree o=
r
>>> somewhere else.  Anyway, see Documentation/sound/alsa/HD-Audio.txt =
for
>>> some details.
>>
>> I do not see such script, alsa-info.sh.
>
> The location of the script is found in the document mentioned above.
>
>> I dont know how to pull only the
>> sound tree.
>
> The sound git tree URL is found in the document mentioned above.
> Just do git-pull onto your cloned Linus tree.

I don't knmow how to pull _onto_ existing files. git says that it is no=
t=20
a repo and refuses to download files, I thought that first I have to=20
make git clone, but I was happy that it's not like that.

Regards,

Piotr Hosowicz

--=20
=46=B1farowie wracaj=B1 pieszo do domu z opery.
W pewnej chwili =BFona m=F3wi do m=EA=BFa:
- Taki wstyd! Jak mog=B3e=B6 krzykn=B1=E6: Brawo! Bis!,
gdy primadonna wpad=B3a do kana=B3u dla orkiestry?!
NP: Slash - Ghost (Feat. Ian Astbury)
NB: 2.6.35-rc6-git1
