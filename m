From: Piotr Hosowicz <piotr@hosowicz.com>
Subject: Re: Intel sound proke in today;s next
Date: Mon, 26 Jul 2010 20:30:42 +0200
Message-ID: <4C4DD452.9030000@example.com>
References: <20100723164931.7bf2160f.sfr@canb.auug.org.au>	<20100723090831.6af4a288.randy.dunlap@oracle.com>	<4C49DE64.6000902@example.com>	<20100724115900.6b31c691.sfr@canb.auug.org.au>	<s5hy6cza8ei.wl%tiwai@suse.de>	<4C4C5EC2.4050205@example.com>	<s5hlj8yya3v.wl%tiwai@suse.de>	<4C4DBE72.7070900@example.com>	<s5hr5iq9mwk.wl%tiwai@suse.de>	<4C4DC6F1.7090109@example.com> <s5hocdu9l8k.wl%tiwai@suse.de>
Reply-To: piotr@hosowicz.com
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080005070302040606020106"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 30.mail-out.ovh.net ([213.186.62.213]:35974 "HELO
	30.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1754982Ab0GZSar (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 26 Jul 2010 14:30:47 -0400
In-Reply-To: <s5hocdu9l8k.wl%tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <randy.dunlap@oracle.com>, tj@kernel.org, linux-next@vger.kernel.org

This is a multi-part message in MIME format.
--------------080005070302040606020106
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8bit

On 26.07.2010 20:00, Takashi Iwai wrote:
> At Mon, 26 Jul 2010 19:33:37 +0200,
> Piotr Hosowicz wrote:
>>
>> On 26.07.2010 19:24, Takashi Iwai wrote:
>>> At Mon, 26 Jul 2010 18:57:22 +0200,
>>> Piotr Hosowicz wrote:
>>>>
>>>> On 26.07.2010 09:29, Takashi Iwai wrote:
>>>>> At Sun, 25 Jul 2010 17:56:50 +0200,
>>>>> Piotr Hosowicz wrote:
>>>>>>
>>>>>> On 25.07.2010 17:27, Takashi Iwai wrote:
>>>>>>> At Sat, 24 Jul 2010 11:59:00 +1000,
>>>>>>> Stephen Rothwell wrote:
>>>>>>>>
>>>>>>>> [Just cc'ing the sound tree contact]
>>>>>>>>
>>>>>>>> On Fri, 23 Jul 2010 20:24:36 +0200 Piotr Hosowicz<piotr@hosowicz.com>     wrote:
>>>>>>>>>
>>>>>>>>> Hello,
>>>>>>>>>
>>>>>>>>> I just downloaded today's next and built it, then booted. Sound is not
>>>>>>>>> working, my card is:
>>>>>>>>>
>>>>>>>>> 00:1b.0 Audio device: Intel Corporation 82801JI (ICH10 Family) HD Audio
>>>>>>>>> Controller
>>>>>>>>>
>>>>>>>>> I am now booted with latest git kernel and cannot provide more info
>>>>>>>>> here, I rebooted with that kernel because I am going to sleep and I like
>>>>>>>>> to listen to music by night. If more details is necessary I could boot
>>>>>>>>> that next tommorow, but tell me what you need.
>>>>>>>
>>>>>>> Make sure that your mixer setup is correct with a new kernel.
>>>>>>> Usually alsactl restores the right mixer values, though.
>>>>>>>
>>>>>>> At best, run alsa-info.sh (with --no-upload option) on both kernels to
>>>>>>> compare.  Also you can try to pull only sound git tree instead of
>>>>>>> linux-kernel to identify whether it's a problem in the sound tree or
>>>>>>> somewhere else.  Anyway, see Documentation/sound/alsa/HD-Audio.txt for
>>>>>>> some details.
>>>>>>
>>>>>> I do not see such script, alsa-info.sh.
>>>>>
>>>>> The location of the script is found in the document mentioned above.
>>>>>
>>>>>> I dont know how to pull only the
>>>>>> sound tree.
>>>>>
>>>>> The sound git tree URL is found in the document mentioned above.
>>>>> Just do git-pull onto your cloned Linus tree.
>>>>
>>>> I don't knmow how to pull _onto_ existing files. git says that it is not
>>>> a repo and refuses to download files, I thought that first I have to
>>>> make git clone, but I was happy that it's not like that.
>>>
>>> First clone, then pull onto it,
>>>
>>>     % git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
>>>     % cd linux-2.6
>>>     % git pull git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound-2.6.git
>>
>> This is what I tried but the second git invocation failed saying that
>> thre is no repo info in that directory.
>
> You need to pass the branch.  In this case, pass for-next

I passed topic/hda and rebuilt the kernel and now everything is working.

>   % git pull git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound-2.6.git for-next
>
>>> Anyway, if your codec is either IDT or STAC codec, try the latest sound
>>> git or wait for tomorrow's linux-next tree.  A fix regarding the volume
>>> was committed today.
>>
>> I bet it is not a problem with volume, because it (fresh from linus
>> repo) prints error messages when loading alsa sound during system start.
>> Something that there is no sound device, as far as I remember.
>
> With which kernel did it work at all...?

Please see attached output from working sound from alsa-info.sh. The 
version is in the filename.

How shall I know tommorrow when there is a new kernel version that I 
need to do the git magic again?

Regards and thanks,

Piotr Hosowicz

-- 
Nie pytaj co rz±d mo¿e zrobiæ dla ciebie. Pytaj, jak mo¿esz temu zapobiec.
NP: Peter Green Splinter Group - Tribal Dance
NB: 2.6.35-rc6-20100726-1827-sndfix+

--------------080005070302040606020106
Content-Type: text/plain;
 name="alsa-info.txt.2.6.35-rc6-git1"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="alsa-info.txt.2.6.35-rc6-git1"

upload=true&script=true&cardinfo=
!!################################
!!ALSA Information Script v 0.4.59
!!################################

!!Script ran on: Mon Jul 26 18:10:49 UTC 2010


!!Linux Distribution
!!------------------

Debian GNU/Linux squeeze/sid \n \l


!!DMI Information
!!---------------

Manufacturer:      Gigabyte Technology Co., Ltd.
Product Name:      EP45-UD3


!!Kernel Information
!!------------------

Kernel release:    2.6.35-rc6-git1
Operating System:  GNU/Linux
Architecture:      x86_64
Processor:         unknown
SMP Enabled:       Yes


!!ALSA Version
!!------------

Driver version:     1.0.23
Library version:    1.0.23
Utilities version:  1.0.23


!!Loaded ALSA modules
!!-------------------

snd_hda_intel


!!Sound Servers on this system
!!----------------------------

aRts:
      Installed - Yes (/usr/bin/artsd)
      Running - No


!!Soundcards recognised by ALSA
!!-----------------------------

 0 [Intel          ]: HDA-Intel - HDA Intel
                      HDA Intel at 0xeb200000 irq 45


!!PCI Soundcards installed in the system
!!--------------------------------------

00:1b.0 Audio device: Intel Corporation 82801JI (ICH10 Family) HD Audio Controller


!!Advanced information - PCI Vendor/Device/Susbsystem ID's
!!--------------------------------------------------------

00:1b.0 0403: 8086:3a3e
	Subsystem: 1458:a002


!!Modprobe options (Sound related)
!!--------------------------------

snd-atiixp-modem: index=-2
snd-intel8x0m: index=-2
snd-via82xx-modem: index=-2
snd-pcsp: index=-2
snd-usb-audio: index=-2


!!Loaded sound module options
!!--------------------------

!!Module: snd_hda_intel
	bdl_pos_adj : 1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	beep_mode : 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	enable : Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y
	enable_msi : -1
	id : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
	index : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	model : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
	position_fix : 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	power_save : 0
	power_save_controller : Y
	probe_mask : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	probe_only : 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	single_cmd : N


!!HDA-Intel Codec information
!!---------------------------
--startcollapse--

Codec: Realtek ALC889A
Address: 2
Function Id: 0x1
Vendor Id: 0x10ec0885
Subsystem Id: 0x1458a102
Revision Id: 0x100101
No Modem Function Group found
Default PCM:
    rates [0x560]: 44100 48000 96000 192000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
Default Amp-In caps: N/A
Default Amp-Out caps: N/A
GPIO: io=2, o=0, i=0, unsolicited=1, wake=0
  IO[0]: enable=0, dir=0, wake=0, sticky=0, data=0, unsol=0
  IO[1]: enable=0, dir=0, wake=0, sticky=0, data=0, unsol=0
Node 0x02 [Audio Output] wcaps 0x11: Stereo
  Device: name="ALC889A Analog", type="Audio", device=0
  Converter: stream=5, channel=0
  PCM:
    rates [0x560]: 44100 48000 96000 192000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
Node 0x03 [Audio Output] wcaps 0x11: Stereo
  Converter: stream=5, channel=0
  PCM:
    rates [0x560]: 44100 48000 96000 192000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
Node 0x04 [Audio Output] wcaps 0x11: Stereo
  Converter: stream=5, channel=0
  PCM:
    rates [0x560]: 44100 48000 96000 192000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
Node 0x05 [Audio Output] wcaps 0x11: Stereo
  Converter: stream=5, channel=0
  PCM:
    rates [0x560]: 44100 48000 96000 192000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
Node 0x06 [Audio Output] wcaps 0x211: Stereo Digital
  Control: name="IEC958 Playback Con Mask", index=0, device=0
  Control: name="IEC958 Playback Pro Mask", index=0, device=0
  Control: name="IEC958 Playback Default", index=0, device=0
  Control: name="IEC958 Playback Switch", index=0, device=0
  Control: name="IEC958 Default PCM Playback Switch", index=0, device=0
  Device: name="ALC889A Digital", type="SPDIF", device=1
  Converter: stream=5, channel=0
  Digital: Enabled
  Digital category: 0x0
  PCM:
    rates [0x5e0]: 44100 48000 88200 96000 192000
    bits [0x1e]: 16 20 24 32
    formats [0x1]: PCM
Node 0x07 [Audio Input] wcaps 0x10011b: Stereo Amp-In
  Control: name="Capture Switch", index=0, device=0
  Control: name="Capture Volume", index=0, device=0
  Device: name="ALC889A Analog", type="Audio", device=0
  Amp-In caps: ofs=0x10, nsteps=0x2e, stepsize=0x03, mute=1
  Amp-In vals:  [0x80 0x80]
  Converter: stream=0, channel=0
  SDI-Select: 0
  PCM:
    rates [0x560]: 44100 48000 96000 192000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
  Connection: 1
     0x24
Node 0x08 [Audio Input] wcaps 0x10011b: Stereo Amp-In
  Control: name="Capture Switch", index=1, device=0
  Control: name="Capture Volume", index=1, device=0
  Device: name="ALC889A Analog", type="Audio", device=2
  Amp-In caps: ofs=0x10, nsteps=0x2e, stepsize=0x03, mute=1
  Amp-In vals:  [0x80 0x80]
  Converter: stream=0, channel=0
  SDI-Select: 0
  PCM:
    rates [0x560]: 44100 48000 96000 192000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
  Connection: 1
     0x23
Node 0x09 [Audio Input] wcaps 0x10011b: Stereo Amp-In
  Control: name="Capture Switch", index=2, device=0
  Control: name="Capture Volume", index=2, device=0
  Amp-In caps: ofs=0x10, nsteps=0x2e, stepsize=0x03, mute=1
  Amp-In vals:  [0x80 0x80]
  Converter: stream=0, channel=0
  SDI-Select: 0
  PCM:
    rates [0x560]: 44100 48000 96000 192000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
  Connection: 1
     0x22
Node 0x0a [Audio Input] wcaps 0x100391: Stereo Digital
  Control: name="IEC958 Capture Switch", index=0, device=0
  Control: name="IEC958 Capture Default", index=0, device=0
  Device: name="ALC889A Digital", type="SPDIF", device=1
  Converter: stream=0, channel=0
  SDI-Select: 0
  Digital:
  Digital category: 0x0
  PCM:
    rates [0x560]: 44100 48000 96000 192000
    bits [0x1e]: 16 20 24 32
    formats [0x1]: PCM
  Unsolicited: tag=00, enabled=0
  Connection: 1
     0x1f
Node 0x0b [Audio Mixer] wcaps 0x20010b: Stereo Amp-In
  Control: name="CD Playback Volume", index=0, device=0
    ControlAmp: chs=3, dir=In, idx=4, ofs=0
  Control: name="CD Playback Switch", index=0, device=0
    ControlAmp: chs=3, dir=In, idx=4, ofs=0
  Control: name="Line Playback Volume", index=0, device=0
    ControlAmp: chs=3, dir=In, idx=2, ofs=0
  Control: name="Line Playback Switch", index=0, device=0
    ControlAmp: chs=3, dir=In, idx=2, ofs=0
  Control: name="Mic Playback Volume", index=0, device=0
    ControlAmp: chs=3, dir=In, idx=0, ofs=0
  Control: name="Mic Playback Switch", index=0, device=0
    ControlAmp: chs=3, dir=In, idx=0, ofs=0
  Control: name="Front Mic Playback Volume", index=0, device=0
    ControlAmp: chs=3, dir=In, idx=1, ofs=0
  Control: name="Front Mic Playback Switch", index=0, device=0
    ControlAmp: chs=3, dir=In, idx=1, ofs=0
  Amp-In caps: ofs=0x17, nsteps=0x1f, stepsize=0x05, mute=1
  Amp-In vals:  [0x80 0x80] [0x80 0x80] [0x17 0x17] [0x97 0x97] [0x17 0x17] [0x97 0x97] [0x97 0x97] [0x97 0x97] [0x97 0x97] [0x97 0x97]
  Connection: 10
     0x18 0x19 0x1a 0x1b 0x1c 0x1d 0x14 0x15 0x16 0x17
Node 0x0c [Audio Mixer] wcaps 0x20010f: Stereo Amp-In Amp-Out
  Control: name="Front Playback Volume", index=0, device=0
    ControlAmp: chs=3, dir=Out, idx=0, ofs=0
  Amp-In caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-In vals:  [0x00 0x00] [0x00 0x00]
  Amp-Out caps: ofs=0x40, nsteps=0x40, stepsize=0x03, mute=0
  Amp-Out vals:  [0x31 0x31]
  Connection: 2
     0x02 0x0b
Node 0x0d [Audio Mixer] wcaps 0x20010f: Stereo Amp-In Amp-Out
  Control: name="Surround Playback Volume", index=0, device=0
    ControlAmp: chs=3, dir=Out, idx=0, ofs=0
  Amp-In caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-In vals:  [0x80 0x80] [0x80 0x80]
  Amp-Out caps: ofs=0x40, nsteps=0x40, stepsize=0x03, mute=0
  Amp-Out vals:  [0x00 0x00]
  Connection: 2
     0x03 0x0b
Node 0x0e [Audio Mixer] wcaps 0x20010f: Stereo Amp-In Amp-Out
  Control: name="Center Playback Volume", index=0, device=0
    ControlAmp: chs=1, dir=Out, idx=0, ofs=0
  Control: name="LFE Playback Volume", index=0, device=0
    ControlAmp: chs=2, dir=Out, idx=0, ofs=0
  Amp-In caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-In vals:  [0x80 0x80] [0x80 0x80]
  Amp-Out caps: ofs=0x40, nsteps=0x40, stepsize=0x03, mute=0
  Amp-Out vals:  [0x00 0x00]
  Connection: 2
     0x04 0x0b
Node 0x0f [Audio Mixer] wcaps 0x20010f: Stereo Amp-In Amp-Out
  Control: name="Side Playback Volume", index=0, device=0
    ControlAmp: chs=3, dir=Out, idx=0, ofs=0
  Amp-In caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-In vals:  [0x80 0x80] [0x80 0x80]
  Amp-Out caps: ofs=0x40, nsteps=0x40, stepsize=0x03, mute=0
  Amp-Out vals:  [0x00 0x00]
  Connection: 2
     0x05 0x0b
Node 0x10 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x11 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x12 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x13 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x14 [Pin Complex] wcaps 0x40018f: Stereo Amp-In Amp-Out
  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
  Amp-In vals:  [0x00 0x00]
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x00 0x00]
  Pincap 0x0000373c: IN OUT HP Detect
    Vref caps: HIZ 50 GRD 80 100
  Pin Default 0x01014410: [Jack] Line Out at Ext Rear
    Conn = 1/8, Color = Green
    DefAssociation = 0x1, Sequence = 0x0
  Pin-ctls: 0x40: OUT VREF_HIZ
  Unsolicited: tag=00, enabled=0
  Connection: 5
     0x0c* 0x0d 0x0e 0x0f 0x26
Node 0x15 [Pin Complex] wcaps 0x40018f: Stereo Amp-In Amp-Out
  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
  Amp-In vals:  [0x00 0x00]
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x00 0x00]
  Pincap 0x0000373c: IN OUT HP Detect
    Vref caps: HIZ 50 GRD 80 100
  Pin Default 0x01011412: [Jack] Line Out at Ext Rear
    Conn = 1/8, Color = Black
    DefAssociation = 0x1, Sequence = 0x2
  Pin-ctls: 0x40: OUT VREF_HIZ
  Unsolicited: tag=00, enabled=0
  Connection: 5
     0x0c 0x0d* 0x0e 0x0f 0x26
Node 0x16 [Pin Complex] wcaps 0x40018f: Stereo Amp-In Amp-Out
  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
  Amp-In vals:  [0x00 0x00]
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x00 0x00]
  Pincap 0x0000003c: IN OUT HP Detect
  Pin Default 0x01016411: [Jack] Line Out at Ext Rear
    Conn = 1/8, Color = Orange
    DefAssociation = 0x1, Sequence = 0x1
  Pin-ctls: 0x40: OUT
  Unsolicited: tag=00, enabled=0
  Connection: 5
     0x0c 0x0d 0x0e* 0x0f 0x26
Node 0x17 [Pin Complex] wcaps 0x40018f: Stereo Amp-In Amp-Out
  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
  Amp-In vals:  [0x00 0x00]
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x00 0x00]
  Pincap 0x0000003c: IN OUT HP Detect
  Pin Default 0x01012414: [Jack] Line Out at Ext Rear
    Conn = 1/8, Color = Grey
    DefAssociation = 0x1, Sequence = 0x4
  Pin-ctls: 0x40: OUT
  Unsolicited: tag=00, enabled=0
  Connection: 5
     0x0c 0x0d 0x0e 0x0f* 0x26
Node 0x18 [Pin Complex] wcaps 0x40018f: Stereo Amp-In Amp-Out
  Control: name="Mic Boost", index=0, device=0
    ControlAmp: chs=3, dir=In, idx=0, ofs=0
  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
  Amp-In vals:  [0x00 0x00]
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x80 0x80]
  Pincap 0x0000373c: IN OUT HP Detect
    Vref caps: HIZ 50 GRD 80 100
  Pin Default 0x01a19c40: [Jack] Mic at Ext Rear
    Conn = 1/8, Color = Pink
    DefAssociation = 0x4, Sequence = 0x0
  Pin-ctls: 0x24: IN VREF_80
  Unsolicited: tag=00, enabled=0
  Connection: 5
     0x0c* 0x0d 0x0e 0x0f 0x26
Node 0x19 [Pin Complex] wcaps 0x40018f: Stereo Amp-In Amp-Out
  Control: name="Front Mic Boost", index=0, device=0
    ControlAmp: chs=3, dir=In, idx=0, ofs=0
  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
  Amp-In vals:  [0x00 0x00]
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x80 0x80]
  Pincap 0x0000373c: IN OUT HP Detect
    Vref caps: HIZ 50 GRD 80 100
  Pin Default 0x02a19c50: [Jack] Mic at Ext Front
    Conn = 1/8, Color = Pink
    DefAssociation = 0x5, Sequence = 0x0
  Pin-ctls: 0x24: IN VREF_80
  Unsolicited: tag=00, enabled=0
  Connection: 5
     0x0c* 0x0d 0x0e 0x0f 0x26
Node 0x1a [Pin Complex] wcaps 0x40018f: Stereo Amp-In Amp-Out
  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
  Amp-In vals:  [0x00 0x00]
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x80 0x80]
  Pincap 0x0000373c: IN OUT HP Detect
    Vref caps: HIZ 50 GRD 80 100
  Pin Default 0x0181344f: [Jack] Line In at Ext Rear
    Conn = 1/8, Color = Blue
    DefAssociation = 0x4, Sequence = 0xf
  Pin-ctls: 0x20: IN VREF_HIZ
  Unsolicited: tag=00, enabled=0
  Connection: 5
     0x0c* 0x0d 0x0e 0x0f 0x26
Node 0x1b [Pin Complex] wcaps 0x40018f: Stereo Amp-In Amp-Out
  Control: name="Headphone Playback Switch", index=0, device=0
    ControlAmp: chs=3, dir=Out, idx=0, ofs=0
  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
  Amp-In vals:  [0x00 0x00]
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x80 0x80]
  Pincap 0x0000373c: IN OUT HP Detect
    Vref caps: HIZ 50 GRD 80 100
  Pin Default 0x02214c20: [Jack] HP Out at Ext Front
    Conn = 1/8, Color = Green
    DefAssociation = 0x2, Sequence = 0x0
  Pin-ctls: 0xc0: OUT HP VREF_HIZ
  Unsolicited: tag=00, enabled=0
  Connection: 5
     0x0c* 0x0d 0x0e 0x0f 0x26
Node 0x1c [Pin Complex] wcaps 0x400001: Stereo
  Pincap 0x00000020: IN
  Pin Default 0x593301f0: [N/A] CD at Int ATAPI
    Conn = ATAPI, Color = Unknown
    DefAssociation = 0xf, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x20: IN
Node 0x1d [Pin Complex] wcaps 0x400000: Mono
  Pincap 0x00000020: IN
  Pin Default 0x4005e601: [N/A] Line Out at Ext N/A
    Conn = Optical, Color = White
    DefAssociation = 0x0, Sequence = 0x1
  Pin-ctls: 0x20: IN
Node 0x1e [Pin Complex] wcaps 0x400300: Mono Digital
  Pincap 0x00000010: OUT
  Pin Default 0x014b6130: [Jack] SPDIF Out at Ext Rear
    Conn = Comb, Color = Orange
    DefAssociation = 0x3, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x40: OUT
  Connection: 1
     0x06
Node 0x1f [Pin Complex] wcaps 0x400200: Mono Digital
  Pincap 0x00000020: IN
  Pin Default 0x01cb7160: [Jack] SPDIF In at Ext Rear
    Conn = Comb, Color = Yellow
    DefAssociation = 0x6, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x20: IN
Node 0x20 [Vendor Defined Widget] wcaps 0xf00040: Mono
  Processing caps: benign=0, ncoeff=17
Node 0x21 [Volume Knob Widget] wcaps 0x600080: Mono
  Volume-Knob: delta=0, steps=32, direct=0, val=0
  Unsolicited: tag=00, enabled=0
  Connection: 0
Node 0x22 [Audio Mixer] wcaps 0x20010b: Stereo Amp-In
  Control: name="Input Source", index=2, device=0
  Amp-In caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-In vals:  [0x00 0x00] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80]
  Connection: 11
     0x18 0x19 0x1a 0x1b 0x1c 0x1d 0x14 0x15 0x16 0x17 0x0b
Node 0x23 [Audio Mixer] wcaps 0x20010b: Stereo Amp-In
  Control: name="Input Source", index=1, device=0
  Amp-In caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-In vals:  [0x00 0x00] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80]
  Connection: 11
     0x18 0x19 0x1a 0x1b 0x1c 0x1d 0x14 0x15 0x16 0x17 0x0b
Node 0x24 [Audio Mixer] wcaps 0x20010b: Stereo Amp-In
  Control: name="Input Source", index=0, device=0
  Amp-In caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-In vals:  [0x00 0x00] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80]
  Connection: 11
     0x18 0x19 0x1a 0x1b 0x1c 0x1d 0x14 0x15 0x16 0x17 0x0b
Node 0x25 [Audio Output] wcaps 0x11: Stereo
  Converter: stream=0, channel=0
  PCM:
    rates [0x560]: 44100 48000 96000 192000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
Node 0x26 [Audio Mixer] wcaps 0x20010f: Stereo Amp-In Amp-Out
  Amp-In caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-In vals:  [0x00 0x00] [0x80 0x80]
  Amp-Out caps: ofs=0x40, nsteps=0x40, stepsize=0x03, mute=0
  Amp-Out vals:  [0x40 0x40]
  Connection: 2
     0x25 0x0b
--endcollapse--


!!ALSA Device nodes
!!-----------------

crw-rw----+ 1 root audio 116, 9 Jul 26 19:20 /dev/snd/controlC0
crw-rw----+ 1 root audio 116, 8 Jul 26 19:20 /dev/snd/pcmC0D0c
crw-rw----+ 1 root audio 116, 7 Jul 26 20:02 /dev/snd/pcmC0D0p
crw-rw----+ 1 root audio 116, 6 Jul 26 19:20 /dev/snd/pcmC0D1c
crw-rw----+ 1 root audio 116, 5 Jul 26 19:20 /dev/snd/pcmC0D1p
crw-rw----+ 1 root audio 116, 4 Jul 26 19:20 /dev/snd/pcmC0D2c
crw-rw----+ 1 root audio 116, 3 Jul 26 19:20 /dev/snd/seq
crw-rw----+ 1 root audio 116, 2 Jul 26 19:20 /dev/snd/timer

/dev/snd/by-path:
total 0
drwxr-xr-x 2 root root  60 Jul 26 19:20 .
drwxr-xr-x 3 root root 220 Jul 26 19:20 ..
lrwxrwxrwx 1 root root  12 Jul 26 19:20 pci-0000:00:1b.0 -> ../controlC0


!!Aplay/Arecord output
!!------------

APLAY

**** List of PLAYBACK Hardware Devices ****
card 0: Intel [HDA Intel], device 0: ALC889A Analog [ALC889A Analog]
  Subdevices: 0/1
  Subdevice #0: subdevice #0
card 0: Intel [HDA Intel], device 1: ALC889A Digital [ALC889A Digital]
  Subdevices: 1/1
  Subdevice #0: subdevice #0

ARECORD

**** List of CAPTURE Hardware Devices ****
card 0: Intel [HDA Intel], device 0: ALC889A Analog [ALC889A Analog]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: Intel [HDA Intel], device 1: ALC889A Digital [ALC889A Digital]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: Intel [HDA Intel], device 2: ALC889A Analog [ALC889A Analog]
  Subdevices: 2/2
  Subdevice #0: subdevice #0
  Subdevice #1: subdevice #1

!!Amixer output
!!-------------

!!-------Mixer controls for card 0 [Intel]

Card hw:0 'Intel'/'HDA Intel at 0xeb200000 irq 45'
  Mixer name	: 'Realtek ALC889A'
  Components	: 'HDA:10ec0885,1458a102,00100101'
  Controls      : 42
  Simple ctrls  : 24
Simple mixer control 'Master',0
  Capabilities: pvolume pvolume-joined pswitch pswitch-joined penum
  Playback channels: Mono
  Limits: Playback 0 - 64
  Mono: Playback 51 [80%] [-13.00dB] [on]
Simple mixer control 'Headphone',0
  Capabilities: pswitch penum
  Playback channels: Front Left - Front Right
  Mono:
  Front Left: Playback [off]
  Front Right: Playback [off]
Simple mixer control 'PCM',0
  Capabilities: pvolume penum
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 255
  Mono:
  Front Left: Playback 89 [35%] [-33.20dB]
  Front Right: Playback 89 [35%] [-33.20dB]
Simple mixer control 'Front',0
  Capabilities: pvolume pswitch penum
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 64
  Mono:
  Front Left: Playback 62 [97%] [-2.00dB] [on]
  Front Right: Playback 62 [97%] [-2.00dB] [on]
Simple mixer control 'Front Mic',0
  Capabilities: pvolume pswitch penum
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 31
  Mono:
  Front Left: Playback 0 [0%] [-34.50dB] [off]
  Front Right: Playback 0 [0%] [-34.50dB] [off]
Simple mixer control 'Front Mic Boost',0
  Capabilities: volume penum
  Playback channels: Front Left - Front Right
  Capture channels: Front Left - Front Right
  Limits: 0 - 3
  Front Left: 0 [0%]
  Front Right: 0 [0%]
Simple mixer control 'Surround',0
  Capabilities: pvolume pswitch penum
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 64
  Mono:
  Front Left: Playback 0 [0%] [-64.00dB] [off]
  Front Right: Playback 0 [0%] [-64.00dB] [off]
Simple mixer control 'Center',0
  Capabilities: pvolume pvolume-joined pswitch pswitch-joined penum
  Playback channels: Mono
  Limits: Playback 0 - 64
  Mono: Playback 0 [0%] [-64.00dB] [off]
Simple mixer control 'LFE',0
  Capabilities: pvolume pvolume-joined pswitch pswitch-joined penum
  Playback channels: Mono
  Limits: Playback 0 - 64
  Mono: Playback 0 [0%] [-64.00dB] [off]
Simple mixer control 'Side',0
  Capabilities: pvolume pswitch penum
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 64
  Mono:
  Front Left: Playback 0 [0%] [-64.00dB] [off]
  Front Right: Playback 0 [0%] [-64.00dB] [off]
Simple mixer control 'Line',0
  Capabilities: pvolume pswitch penum
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 31
  Mono:
  Front Left: Playback 23 [74%] [0.00dB] [on]
  Front Right: Playback 23 [74%] [0.00dB] [on]
Simple mixer control 'CD',0
  Capabilities: pvolume pswitch penum
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 31
  Mono:
  Front Left: Playback 23 [74%] [0.00dB] [on]
  Front Right: Playback 23 [74%] [0.00dB] [on]
Simple mixer control 'Mic',0
  Capabilities: pvolume pswitch penum
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 31
  Mono:
  Front Left: Playback 0 [0%] [-34.50dB] [off]
  Front Right: Playback 0 [0%] [-34.50dB] [off]
Simple mixer control 'Mic Boost',0
  Capabilities: volume penum
  Playback channels: Front Left - Front Right
  Capture channels: Front Left - Front Right
  Limits: 0 - 3
  Front Left: 0 [0%]
  Front Right: 0 [0%]
Simple mixer control 'IEC958',0
  Capabilities: pswitch pswitch-joined cswitch cswitch-joined penum
  Playback channels: Mono
  Capture channels: Mono
  Mono: Playback [on] Capture [off]
Simple mixer control 'IEC958 Default PCM',0
  Capabilities: pswitch pswitch-joined penum
  Playback channels: Mono
  Mono: Playback [on]
Simple mixer control 'Capture',0
  Capabilities: cvolume cswitch penum
  Capture channels: Front Left - Front Right
  Limits: Capture 0 - 46
  Front Left: Capture 0 [0%] [-16.00dB] [off]
  Front Right: Capture 0 [0%] [-16.00dB] [off]
Simple mixer control 'Capture',1
  Capabilities: cvolume cswitch penum
  Capture channels: Front Left - Front Right
  Limits: Capture 0 - 46
  Front Left: Capture 0 [0%] [-16.00dB] [off]
  Front Right: Capture 0 [0%] [-16.00dB] [off]
Simple mixer control 'Capture',2
  Capabilities: cvolume cswitch penum
  Capture channels: Front Left - Front Right
  Limits: Capture 0 - 46
  Front Left: Capture 0 [0%] [-16.00dB] [off]
  Front Right: Capture 0 [0%] [-16.00dB] [off]
Simple mixer control 'Channel Mode',0
  Capabilities: enum
  Items: '6ch' '8ch'
  Item0: '6ch'
Simple mixer control 'Digital',0
  Capabilities: cvolume penum
  Capture channels: Front Left - Front Right
  Limits: Capture 0 - 120
  Front Left: Capture 60 [50%] [0.00dB]
  Front Right: Capture 60 [50%] [0.00dB]
Simple mixer control 'Input Source',0
  Capabilities: cenum
  Items: 'Mic' 'Front Mic' 'Line' 'CD'
  Item0: 'Mic'
Simple mixer control 'Input Source',1
  Capabilities: cenum
  Items: 'Mic' 'Front Mic' 'Line' 'CD'
  Item0: 'Mic'
Simple mixer control 'Input Source',2
  Capabilities: cenum
  Items: 'Mic' 'Front Mic' 'Line' 'CD'
  Item0: 'Mic'


!!Alsactl output
!!-------------

--startcollapse--
state.Intel {
	control.1 {
		comment.access 'read write'
		comment.type INTEGER
		comment.count 2
		comment.range '0 - 64'
		comment.dbmin -6400
		comment.dbmax 0
		iface MIXER
		name 'Front Playback Volume'
		value.0 62
		value.1 62
	}
	control.2 {
		comment.access 'read write'
		comment.type BOOLEAN
		comment.count 2
		iface MIXER
		name 'Front Playback Switch'
		value.0 true
		value.1 true
	}
	control.3 {
		comment.access 'read write'
		comment.type INTEGER
		comment.count 2
		comment.range '0 - 64'
		comment.dbmin -6400
		comment.dbmax 0
		iface MIXER
		name 'Surround Playback Volume'
		value.0 0
		value.1 0
	}
	control.4 {
		comment.access 'read write'
		comment.type BOOLEAN
		comment.count 2
		iface MIXER
		name 'Surround Playback Switch'
		value.0 false
		value.1 false
	}
	control.5 {
		comment.access 'read write'
		comment.type INTEGER
		comment.count 1
		comment.range '0 - 64'
		comment.dbmin -6400
		comment.dbmax 0
		iface MIXER
		name 'Center Playback Volume'
		value 0
	}
	control.6 {
		comment.access 'read write'
		comment.type INTEGER
		comment.count 1
		comment.range '0 - 64'
		comment.dbmin -6400
		comment.dbmax 0
		iface MIXER
		name 'LFE Playback Volume'
		value 0
	}
	control.7 {
		comment.access 'read write'
		comment.type BOOLEAN
		comment.count 1
		iface MIXER
		name 'Center Playback Switch'
		value false
	}
	control.8 {
		comment.access 'read write'
		comment.type BOOLEAN
		comment.count 1
		iface MIXER
		name 'LFE Playback Switch'
		value false
	}
	control.9 {
		comment.access 'read write'
		comment.type INTEGER
		comment.count 2
		comment.range '0 - 64'
		comment.dbmin -6400
		comment.dbmax 0
		iface MIXER
		name 'Side Playback Volume'
		value.0 0
		value.1 0
	}
	control.10 {
		comment.access 'read write'
		comment.type BOOLEAN
		comment.count 2
		iface MIXER
		name 'Side Playback Switch'
		value.0 false
		value.1 false
	}
	control.11 {
		comment.access 'read write'
		comment.type BOOLEAN
		comment.count 2
		iface MIXER
		name 'Headphone Playback Switch'
		value.0 false
		value.1 false
	}
	control.12 {
		comment.access 'read write'
		comment.type INTEGER
		comment.count 2
		comment.range '0 - 31'
		comment.dbmin -3450
		comment.dbmax 1200
		iface MIXER
		name 'CD Playback Volume'
		value.0 23
		value.1 23
	}
	control.13 {
		comment.access 'read write'
		comment.type BOOLEAN
		comment.count 2
		iface MIXER
		name 'CD Playback Switch'
		value.0 true
		value.1 true
	}
	control.14 {
		comment.access 'read write'
		comment.type INTEGER
		comment.count 2
		comment.range '0 - 31'
		comment.dbmin -3450
		comment.dbmax 1200
		iface MIXER
		name 'Line Playback Volume'
		value.0 23
		value.1 23
	}
	control.15 {
		comment.access 'read write'
		comment.type BOOLEAN
		comment.count 2
		iface MIXER
		name 'Line Playback Switch'
		value.0 true
		value.1 true
	}
	control.16 {
		comment.access 'read write'
		comment.type INTEGER
		comment.count 2
		comment.range '0 - 31'
		comment.dbmin -3450
		comment.dbmax 1200
		iface MIXER
		name 'Mic Playback Volume'
		value.0 0
		value.1 0
	}
	control.17 {
		comment.access 'read write'
		comment.type INTEGER
		comment.count 2
		comment.range '0 - 3'
		comment.dbmin 0
		comment.dbmax 3000
		iface MIXER
		name 'Mic Boost'
		value.0 0
		value.1 0
	}
	control.18 {
		comment.access 'read write'
		comment.type BOOLEAN
		comment.count 2
		iface MIXER
		name 'Mic Playback Switch'
		value.0 false
		value.1 false
	}
	control.19 {
		comment.access 'read write'
		comment.type INTEGER
		comment.count 2
		comment.range '0 - 31'
		comment.dbmin -3450
		comment.dbmax 1200
		iface MIXER
		name 'Front Mic Playback Volume'
		value.0 0
		value.1 0
	}
	control.20 {
		comment.access 'read write'
		comment.type INTEGER
		comment.count 2
		comment.range '0 - 3'
		comment.dbmin 0
		comment.dbmax 3000
		iface MIXER
		name 'Front Mic Boost'
		value.0 0
		value.1 0
	}
	control.21 {
		comment.access 'read write'
		comment.type BOOLEAN
		comment.count 2
		iface MIXER
		name 'Front Mic Playback Switch'
		value.0 false
		value.1 false
	}
	control.22 {
		comment.access 'read write'
		comment.type ENUMERATED
		comment.count 1
		comment.item.0 '6ch'
		comment.item.1 '8ch'
		iface MIXER
		name 'Channel Mode'
		value '6ch'
	}
	control.23 {
		comment.access 'read write'
		comment.type BOOLEAN
		comment.count 2
		iface MIXER
		name 'Capture Switch'
		value.0 false
		value.1 false
	}
	control.24 {
		comment.access 'read write'
		comment.type BOOLEAN
		comment.count 2
		iface MIXER
		name 'Capture Switch'
		index 1
		value.0 false
		value.1 false
	}
	control.25 {
		comment.access 'read write'
		comment.type BOOLEAN
		comment.count 2
		iface MIXER
		name 'Capture Switch'
		index 2
		value.0 false
		value.1 false
	}
	control.26 {
		comment.access 'read write'
		comment.type INTEGER
		comment.count 2
		comment.range '0 - 46'
		comment.dbmin -1600
		comment.dbmax 3000
		iface MIXER
		name 'Capture Volume'
		value.0 0
		value.1 0
	}
	control.27 {
		comment.access 'read write'
		comment.type INTEGER
		comment.count 2
		comment.range '0 - 46'
		comment.dbmin -1600
		comment.dbmax 3000
		iface MIXER
		name 'Capture Volume'
		index 1
		value.0 0
		value.1 0
	}
	control.28 {
		comment.access 'read write'
		comment.type INTEGER
		comment.count 2
		comment.range '0 - 46'
		comment.dbmin -1600
		comment.dbmax 3000
		iface MIXER
		name 'Capture Volume'
		index 2
		value.0 0
		value.1 0
	}
	control.29 {
		comment.access 'read write'
		comment.type ENUMERATED
		comment.count 1
		comment.item.0 Mic
		comment.item.1 'Front Mic'
		comment.item.2 Line
		comment.item.3 CD
		iface MIXER
		name 'Input Source'
		value Mic
	}
	control.30 {
		comment.access 'read write'
		comment.type ENUMERATED
		comment.count 1
		comment.item.0 Mic
		comment.item.1 'Front Mic'
		comment.item.2 Line
		comment.item.3 CD
		iface MIXER
		name 'Input Source'
		index 1
		value Mic
	}
	control.31 {
		comment.access 'read write'
		comment.type ENUMERATED
		comment.count 1
		comment.item.0 Mic
		comment.item.1 'Front Mic'
		comment.item.2 Line
		comment.item.3 CD
		iface MIXER
		name 'Input Source'
		index 2
		value Mic
	}
	control.32 {
		comment.access read
		comment.type IEC958
		comment.count 1
		iface MIXER
		name 'IEC958 Playback Con Mask'
		value '0fff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
	}
	control.33 {
		comment.access read
		comment.type IEC958
		comment.count 1
		iface MIXER
		name 'IEC958 Playback Pro Mask'
		value '0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
	}
	control.34 {
		comment.access 'read write'
		comment.type IEC958
		comment.count 1
		iface MIXER
		name 'IEC958 Playback Default'
		value '0400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
	}
	control.35 {
		comment.access 'read write'
		comment.type BOOLEAN
		comment.count 1
		iface MIXER
		name 'IEC958 Playback Switch'
		value true
	}
	control.36 {
		comment.access 'read write'
		comment.type BOOLEAN
		comment.count 1
		iface MIXER
		name 'IEC958 Default PCM Playback Switch'
		value true
	}
	control.37 {
		comment.access 'read write'
		comment.type BOOLEAN
		comment.count 1
		iface MIXER
		name 'IEC958 Capture Switch'
		value false
	}
	control.38 {
		comment.access read
		comment.type IEC958
		comment.count 1
		iface MIXER
		name 'IEC958 Capture Default'
		value '0400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
	}
	control.39 {
		comment.access 'read write'
		comment.type INTEGER
		comment.count 1
		comment.range '0 - 64'
		comment.dbmin -6400
		comment.dbmax 0
		iface MIXER
		name 'Master Playback Volume'
		value 51
	}
	control.40 {
		comment.access 'read write'
		comment.type BOOLEAN
		comment.count 1
		iface MIXER
		name 'Master Playback Switch'
		value true
	}
	control.41 {
		comment.access 'read write user'
		comment.type INTEGER
		comment.count 2
		comment.range '0 - 255'
		comment.tlv '0000000100000008ffffec1400000014'
		comment.dbmin -5100
		comment.dbmax 0
		iface MIXER
		name 'PCM Playback Volume'
		value.0 89
		value.1 89
	}
	control.42 {
		comment.access 'read write user'
		comment.type INTEGER
		comment.count 2
		comment.range '0 - 120'
		comment.tlv '0000000100000008fffff44800000032'
		comment.dbmin -3000
		comment.dbmax 3000
		iface MIXER
		name 'Digital Capture Volume'
		value.0 60
		value.1 60
	}
}
--endcollapse--


!!All Loaded Modules
!!------------------

Module
ppdev
lp
sco
bridge
stp
bnep
rfcomm
l2cap
bluetooth
rfkill
ipv6
xt_owner
nf_conntrack_ftp
xt_state
xt_tcpudp
ipt_MASQUERADE
iptable_nat
nf_nat
nf_conntrack_ipv4
nf_conntrack
nf_defrag_ipv4
iptable_filter
ip_tables
ipt_REJECT
x_tables
ext3
jbd
fuse
coretemp
it87
hwmon_vid
sbp2
loop
nvidia
snd_hda_codec_realtek
snd_hda_intel
snd_hda_codec
snd_pcm_oss
snd_mixer_oss
snd_pcm
snd_seq_dummy
snd_seq_oss
snd_seq_midi
snd_rawmidi
snd_seq_midi_event
snd_seq
i2c_i801
snd_timer
snd_seq_device
i2c_core
snd
intel_agp
psmouse
serio_raw
evdev
pcspkr
parport_pc
soundcore
snd_page_alloc
parport
button
processor
ext4
mbcache
jbd2
crc16
sg
sr_mod
sd_mod
cdrom
ahci
libahci
ata_generic
ata_piix
libata
uhci_hcd
ohci1394
scsi_mod
jmicron
floppy
ide_pci_generic
ieee1394
r8169
thermal
mii
thermal_sys
ide_core
ehci_hcd


!!ALSA/HDA dmesg
!!------------------

[    5.385246]   alloc kstat_irqs on node -1
[    5.385254] HDA Intel 0000:00:1b.0: PCI INT A -> GSI 22 (level, low) -> IRQ 22
[    5.385351]   alloc irq_desc for 45 on node -1
[    5.385354]   alloc kstat_irqs on node -1
[    5.385363] HDA Intel 0000:00:1b.0: irq 45 for MSI/MSI-X
[    5.385389] HDA Intel 0000:00:1b.0: setting latency timer to 64
[    5.385393] ALSA sound/pci/hda/hda_intel.c:2516: chipset global capabilities = 0x4401
[    5.417517] ALSA sound/pci/hda/hda_intel.c:907: codec_mask = 0x4
[    5.417588] ALSA sound/pci/hda/hda_intel.c:1345: codec #2 probed OK
[    5.443744] ALSA sound/pci/hda/patch_realtek.c:1308: SKU: Nid=0x1d sku_cfg=0x4005e601
[    5.443749] ALSA sound/pci/hda/patch_realtek.c:1310: SKU: port_connectivity=0x1
[    5.443752] ALSA sound/pci/hda/patch_realtek.c:1311: SKU: enable_pcbeep=0x0
[    5.443754] ALSA sound/pci/hda/patch_realtek.c:1312: SKU: check_sum=0x00000005
[    5.443757] ALSA sound/pci/hda/patch_realtek.c:1313: SKU: customization=0x000000e6
[    5.443760] ALSA sound/pci/hda/patch_realtek.c:1314: SKU: external_amp=0x0
[    5.443762] ALSA sound/pci/hda/patch_realtek.c:1315: SKU: platform_type=0x0
[    5.443765] ALSA sound/pci/hda/patch_realtek.c:1316: SKU: swap=0x0
[    5.443767] ALSA sound/pci/hda/patch_realtek.c:1317: SKU: override=0x1
[    5.443770] ALSA sound/pci/hda/hda_codec.c:3544: hda_codec: model '6stack-dig' is selected for config 1458:a002 (Gigabyte P35 DS3R)
[    5.443828] input: HDA Digital PCBeep as /devices/pci0000:00/0000:00:1b.0/input/input5
[    5.446363] ALSA sound/pci/hda/hda_codec.c:2008: Cannot find slave Headphone Playback Volume, skipped
[    5.446367] ALSA sound/pci/hda/hda_codec.c:2008: Cannot find slave Speaker Playback Volume, skipped
[    5.446370] ALSA sound/pci/hda/hda_codec.c:2008: Cannot find slave Mono Playback Volume, skipped
[    5.446373] ALSA sound/pci/hda/hda_codec.c:2008: Cannot find slave Line-Out Playback Volume, skipped
[    5.446376] ALSA sound/pci/hda/hda_codec.c:2008: Cannot find slave PCM Playback Volume, skipped
[    5.446388] ALSA sound/pci/hda/hda_codec.c:2008: Cannot find slave Speaker Playback Switch, skipped
[    5.446391] ALSA sound/pci/hda/hda_codec.c:2008: Cannot find slave Mono Playback Switch, skipped
[    5.446396] ALSA sound/pci/hda/hda_codec.c:2008: Cannot find slave Line-Out Playback Switch, skipped
[    5.446399] ALSA sound/pci/hda/hda_codec.c:2008: Cannot find slave PCM Playback Switch, skipped
[    6.089110] nvidia 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
--
[   24.854960] i2c i2c-6: adapter [NVIDIA i2c adapter ] registered
[   60.278755] ALSA sound/pci/hda/hda_codec.c:1202: hda_codec_cleanup_stream: NID=0x6
[   60.282271] ALSA sound/pci/hda/hda_codec.c:1202: hda_codec_cleanup_stream: NID=0xa
[   60.400209] ALSA sound/pci/hda/hda_intel.c:1668: azx_pcm_prepare: bufsize=0x10000, format=0x31
[   60.400224] ALSA sound/pci/hda/hda_codec.c:1184: hda_codec_setup_stream: NID=0x6, stream=0x5, channel=0, format=0x31
[   60.408037] ALSA sound/pci/hda/hda_codec.c:1184: hda_codec_setup_stream: NID=0x2, stream=0x5, channel=0, format=0x31
[   60.416023] ALSA sound/pci/hda/hda_codec.c:1184: hda_codec_setup_stream: NID=0x3, stream=0x5, channel=0, format=0x31
[   60.424027] ALSA sound/pci/hda/hda_codec.c:1184: hda_codec_setup_stream: NID=0x4, stream=0x5, channel=0, format=0x31
[   60.432023] ALSA sound/pci/hda/hda_codec.c:1184: hda_codec_setup_stream: NID=0x5, stream=0x5, channel=0, format=0x31
[   60.441301] ALSA sound/pci/hda/hda_codec.c:1202: hda_codec_cleanup_stream: NID=0x2
[   60.441306] ALSA sound/pci/hda/hda_codec.c:1202: hda_codec_cleanup_stream: NID=0x3
[   60.441310] ALSA sound/pci/hda/hda_codec.c:1202: hda_codec_cleanup_stream: NID=0x4
[   60.441313] ALSA sound/pci/hda/hda_codec.c:1202: hda_codec_cleanup_stream: NID=0x5
[   60.441318] ALSA sound/pci/hda/hda_codec.c:1202: hda_codec_cleanup_stream: NID=0x6
[   60.777175] ALSA sound/pci/hda/hda_intel.c:1668: azx_pcm_prepare: bufsize=0x10000, format=0x31
[   60.777188] ALSA sound/pci/hda/hda_codec.c:1184: hda_codec_setup_stream: NID=0x6, stream=0x5, channel=0, format=0x31
[   60.788026] ALSA sound/pci/hda/hda_codec.c:1184: hda_codec_setup_stream: NID=0x2, stream=0x5, channel=0, format=0x31
[   60.796026] ALSA sound/pci/hda/hda_codec.c:1184: hda_codec_setup_stream: NID=0x3, stream=0x5, channel=0, format=0x31
[   60.804022] ALSA sound/pci/hda/hda_codec.c:1184: hda_codec_setup_stream: NID=0x4, stream=0x5, channel=0, format=0x31
[   60.812018] ALSA sound/pci/hda/hda_codec.c:1184: hda_codec_setup_stream: NID=0x5, stream=0x5, channel=0, format=0x31
[   60.820842] ALSA sound/pci/hda/hda_codec.c:1202: hda_codec_cleanup_stream: NID=0x2
[   60.820847] ALSA sound/pci/hda/hda_codec.c:1202: hda_codec_cleanup_stream: NID=0x3
[   60.820850] ALSA sound/pci/hda/hda_codec.c:1202: hda_codec_cleanup_stream: NID=0x4
[   60.820854] ALSA sound/pci/hda/hda_codec.c:1202: hda_codec_cleanup_stream: NID=0x5
[   60.820857] ALSA sound/pci/hda/hda_codec.c:1202: hda_codec_cleanup_stream: NID=0x6
[   60.821860] ALSA sound/pci/hda/hda_intel.c:1668: azx_pcm_prepare: bufsize=0x10000, format=0x31
[   60.821871] ALSA sound/pci/hda/hda_codec.c:1184: hda_codec_setup_stream: NID=0x6, stream=0x5, channel=0, format=0x31
[   60.828520] ALSA sound/pci/hda/hda_codec.c:1184: hda_codec_setup_stream: NID=0x2, stream=0x5, channel=0, format=0x31
[   60.836520] ALSA sound/pci/hda/hda_codec.c:1184: hda_codec_setup_stream: NID=0x3, stream=0x5, channel=0, format=0x31
[   60.844514] ALSA sound/pci/hda/hda_codec.c:1184: hda_codec_setup_stream: NID=0x4, stream=0x5, channel=0, format=0x31
[   60.852520] ALSA sound/pci/hda/hda_codec.c:1184: hda_codec_setup_stream: NID=0x5, stream=0x5, channel=0, format=0x31
[   60.860862] ALSA sound/pci/hda/hda_codec.c:1202: hda_codec_cleanup_stream: NID=0x2
[   60.860866] ALSA sound/pci/hda/hda_codec.c:1202: hda_codec_cleanup_stream: NID=0x3
[   60.860870] ALSA sound/pci/hda/hda_codec.c:1202: hda_codec_cleanup_stream: NID=0x4
[   60.860873] ALSA sound/pci/hda/hda_codec.c:1202: hda_codec_cleanup_stream: NID=0x5
[   60.860876] ALSA sound/pci/hda/hda_codec.c:1202: hda_codec_cleanup_stream: NID=0x6
[   62.695984] ALSA sound/pci/hda/hda_intel.c:1668: azx_pcm_prepare: bufsize=0x10000, format=0x31
[   62.695996] ALSA sound/pci/hda/hda_codec.c:1184: hda_codec_setup_stream: NID=0x6, stream=0x5, channel=0, format=0x31
[   62.705014] ALSA sound/pci/hda/hda_codec.c:1184: hda_codec_setup_stream: NID=0x2, stream=0x5, channel=0, format=0x31
[   62.713155] ALSA sound/pci/hda/hda_codec.c:1184: hda_codec_setup_stream: NID=0x3, stream=0x5, channel=0, format=0x31
[   62.721522] ALSA sound/pci/hda/hda_codec.c:1184: hda_codec_setup_stream: NID=0x4, stream=0x5, channel=0, format=0x31
[   62.729516] ALSA sound/pci/hda/hda_codec.c:1184: hda_codec_setup_stream: NID=0x5, stream=0x5, channel=0, format=0x31
[   71.099607] ALSA sound/pci/hda/hda_codec.c:1202: hda_codec_cleanup_stream: NID=0x2
[   71.099614] ALSA sound/pci/hda/hda_codec.c:1202: hda_codec_cleanup_stream: NID=0x3
[   71.099618] ALSA sound/pci/hda/hda_codec.c:1202: hda_codec_cleanup_stream: NID=0x4
[   71.099621] ALSA sound/pci/hda/hda_codec.c:1202: hda_codec_cleanup_stream: NID=0x5
[   71.099625] ALSA sound/pci/hda/hda_codec.c:1202: hda_codec_cleanup_stream: NID=0x6
[   94.300938] ALSA sound/pci/hda/hda_intel.c:1668: azx_pcm_prepare: bufsize=0x10000, format=0x31
[   94.300950] ALSA sound/pci/hda/hda_codec.c:1184: hda_codec_setup_stream: NID=0x6, stream=0x5, channel=0, format=0x31
[   94.312021] ALSA sound/pci/hda/hda_codec.c:1184: hda_codec_setup_stream: NID=0x2, stream=0x5, channel=0, format=0x31
[   94.320017] ALSA sound/pci/hda/hda_codec.c:1184: hda_codec_setup_stream: NID=0x3, stream=0x5, channel=0, format=0x31
[   94.328049] ALSA sound/pci/hda/hda_codec.c:1184: hda_codec_setup_stream: NID=0x4, stream=0x5, channel=0, format=0x31
[   94.336011] ALSA sound/pci/hda/hda_codec.c:1184: hda_codec_setup_stream: NID=0x5, stream=0x5, channel=0, format=0x31
[   94.344618] ALSA sound/pci/hda/hda_codec.c:1202: hda_codec_cleanup_stream: NID=0x2
[   94.344622] ALSA sound/pci/hda/hda_codec.c:1202: hda_codec_cleanup_stream: NID=0x3
[   94.344626] ALSA sound/pci/hda/hda_codec.c:1202: hda_codec_cleanup_stream: NID=0x4
[   94.344629] ALSA sound/pci/hda/hda_codec.c:1202: hda_codec_cleanup_stream: NID=0x5
[   94.344632] ALSA sound/pci/hda/hda_codec.c:1202: hda_codec_cleanup_stream: NID=0x6
[  106.605272] ALSA sound/pci/hda/hda_intel.c:1668: azx_pcm_prepare: bufsize=0x10000, format=0x31
[  106.605345] ALSA sound/pci/hda/hda_codec.c:1184: hda_codec_setup_stream: NID=0x6, stream=0x5, channel=0, format=0x31
[  106.612516] ALSA sound/pci/hda/hda_codec.c:1184: hda_codec_setup_stream: NID=0x2, stream=0x5, channel=0, format=0x31
[  106.620513] ALSA sound/pci/hda/hda_codec.c:1184: hda_codec_setup_stream: NID=0x3, stream=0x5, channel=0, format=0x31
[  106.628519] ALSA sound/pci/hda/hda_codec.c:1184: hda_codec_setup_stream: NID=0x4, stream=0x5, channel=0, format=0x31
[  106.636514] ALSA sound/pci/hda/hda_codec.c:1184: hda_codec_setup_stream: NID=0x5, stream=0x5, channel=0, format=0x31



--------------080005070302040606020106--
