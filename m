From: Piotr Hosowicz <piotr@hosowicz.com>
Subject: Re: Intel sound proke in today;s next
Date: Mon, 26 Jul 2010 21:03:32 +0200
Message-ID: <4C4DDC04.8010507@example.com>
References: <20100723164931.7bf2160f.sfr@canb.auug.org.au>	<20100723090831.6af4a288.randy.dunlap@oracle.com>	<4C49DE64.6000902@example.com>	<20100724115900.6b31c691.sfr@canb.auug.org.au>	<s5hy6cza8ei.wl%tiwai@suse.de>	<4C4C5EC2.4050205@example.com>	<s5hlj8yya3v.wl%tiwai@suse.de>	<4C4DBE72.7070900@example.com>	<s5hr5iq9mwk.wl%tiwai@suse.de>	<4C4DC6F1.7090109@example.com> <s5hocdu9l8k.wl%tiwai@suse.de> <4C4DD452.9030000@example.com>
Reply-To: piotr@hosowicz.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 30.mail-out.ovh.net ([213.186.62.213]:44168 "HELO
	30.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751706Ab0GZTDh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 26 Jul 2010 15:03:37 -0400
In-Reply-To: <4C4DD452.9030000@example.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: piotr@hosowicz.com
Cc: Takashi Iwai <tiwai@suse.de>, Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <randy.dunlap@oracle.com>, tj@kernel.org, linux-next@vger.kernel.org

On 26.07.2010 20:30, Piotr Hosowicz wrote:
> On 26.07.2010 20:00, Takashi Iwai wrote:
>> At Mon, 26 Jul 2010 19:33:37 +0200,
>> Piotr Hosowicz wrote:
>>>
>>> On 26.07.2010 19:24, Takashi Iwai wrote:
>>>> At Mon, 26 Jul 2010 18:57:22 +0200,
>>>> Piotr Hosowicz wrote:
>>>>>
>>>>> On 26.07.2010 09:29, Takashi Iwai wrote:
>>>>>> At Sun, 25 Jul 2010 17:56:50 +0200,
>>>>>> Piotr Hosowicz wrote:
>>>>>>>
>>>>>>> On 25.07.2010 17:27, Takashi Iwai wrote:
>>>>>>>> At Sat, 24 Jul 2010 11:59:00 +1000,
>>>>>>>> Stephen Rothwell wrote:
>>>>>>>>>
>>>>>>>>> [Just cc'ing the sound tree contact]
>>>>>>>>>
>>>>>>>>> On Fri, 23 Jul 2010 20:24:36 +0200 Piotr
>>>>>>>>> Hosowicz<piotr@hosowicz.com> wrote:
>>>>>>>>>>
>>>>>>>>>> Hello,
>>>>>>>>>>
>>>>>>>>>> I just downloaded today's next and built it, then booted.
>>>>>>>>>> Sound is not
>>>>>>>>>> working, my card is:
>>>>>>>>>>
>>>>>>>>>> 00:1b.0 Audio device: Intel Corporation 82801JI (ICH10 Famil=
y)
>>>>>>>>>> HD Audio
>>>>>>>>>> Controller
>>>>>>>>>>
>>>>>>>>>> I am now booted with latest git kernel and cannot provide mo=
re
>>>>>>>>>> info
>>>>>>>>>> here, I rebooted with that kernel because I am going to slee=
p
>>>>>>>>>> and I like
>>>>>>>>>> to listen to music by night. If more details is necessary I
>>>>>>>>>> could boot
>>>>>>>>>> that next tommorow, but tell me what you need.
>>>>>>>>
>>>>>>>> Make sure that your mixer setup is correct with a new kernel.
>>>>>>>> Usually alsactl restores the right mixer values, though.
>>>>>>>>
>>>>>>>> At best, run alsa-info.sh (with --no-upload option) on both
>>>>>>>> kernels to
>>>>>>>> compare. Also you can try to pull only sound git tree instead =
of
>>>>>>>> linux-kernel to identify whether it's a problem in the sound
>>>>>>>> tree or
>>>>>>>> somewhere else. Anyway, see
>>>>>>>> Documentation/sound/alsa/HD-Audio.txt for
>>>>>>>> some details.
>>>>>>>
>>>>>>> I do not see such script, alsa-info.sh.
>>>>>>
>>>>>> The location of the script is found in the document mentioned ab=
ove.
>>>>>>
>>>>>>> I dont know how to pull only the
>>>>>>> sound tree.
>>>>>>
>>>>>> The sound git tree URL is found in the document mentioned above.
>>>>>> Just do git-pull onto your cloned Linus tree.
>>>>>
>>>>> I don't knmow how to pull _onto_ existing files. git says that it
>>>>> is not
>>>>> a repo and refuses to download files, I thought that first I have=
 to
>>>>> make git clone, but I was happy that it's not like that.
>>>>
>>>> First clone, then pull onto it,
>>>>
>>>> % git clone
>>>> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.g=
it
>>>> % cd linux-2.6
>>>> % git pull
>>>> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound-2.6.git
>>>
>>> This is what I tried but the second git invocation failed saying th=
at
>>> thre is no repo info in that directory.
>>
>> You need to pass the branch. In this case, pass for-next
>
> I passed topic/hda and rebuilt the kernel and now everything is worki=
ng.

I have just git pulled for-next and saw many files downloaded so I=20
wonder how synced with topic/hda it's working.

Regards,

Piotr Hosowicz

--=20
Zawarto=B6=E6 usuni=EAta.
Pa=F1stwowy Urz=B1d Kontroli Sygnaturek
NP: Peter Green Splinter Group - There's A River
NB: 2.6.35-rc6-20100726-1827-sndfix+
