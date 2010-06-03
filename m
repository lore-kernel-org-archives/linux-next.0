From: Dave Young <hidave.darkstar@gmail.com>
Subject: Re: linux-next: Tree for June 3
Date: Thu, 3 Jun 2010 15:39:25 +0800
Message-ID: <AANLkTilr92GkR8bfgyjtb8ToYEEAv4oCsFsfsy04HJRU@mail.gmail.com>
References: <20100603134753.710a64b3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:44365 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755602Ab0FCHj0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 Jun 2010 03:39:26 -0400
In-Reply-To: <20100603134753.710a64b3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rusty Russell <rusty@rustcorp.com.au>

On Thu, Jun 3, 2010 at 11:47 AM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi all,
>
> Changes since 20100602:
>
> My fixes tree contains:
> =C2=A0 =C2=A0 =C2=A0v4l-dvb: update gfp/slab.h includes
> =C2=A0 =C2=A0 =C2=A0arm: update gfp/slab.h includes
> =C2=A0 =C2=A0 =C2=A0davinci: update gfp/slab.h includes
> =C2=A0 =C2=A0 =C2=A0ocfs2: update gfp/slab.h includes
> =C2=A0 =C2=A0 =C2=A0acpi: update gfp/slab.h includes
>
> The sh tree lost its build failure.
>
> The rr tree lost its build failure.
>
> ---------------------------------------------------------------------=
-------
>
> I have created today's linux-next tree at
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> (patches at http://www.kernel.org/pub/linux/kernel/v2.6/next/ ). =C2=A0=
If you
> are tracking the linux-next tree using git, you should not use "git p=
ull"
> to do so as that will try to merge the new linux-next release with th=
e
> old one. =C2=A0You should use "git fetch" as mentioned in the FAQ on =
the wiki
> (see below).
>

Hi,

With this build, I got weird module refcount:

bash-3.1$ cat /proc/modules
radeon 703776 4294967295 - Live 0xffffffffa017c000
ttm 55891 0 radeon, Live 0xffffffffa0164000
drm_kms_helper 25154 0 radeon, Live 0xffffffffa015b000
drm 174333 2 radeon,ttm,drm_kms_helper, Live 0xffffffffa011f000
fb 45136 1 radeon,drm_kms_helper, Live 0xffffffffa00ff000
fbdev 861 0 fb, Live 0xffffffffa009e000
i2c_algo_bit 4925 0 radeon, Live 0xffffffffa0069000
cfbcopyarea 3229 0 radeon, Live 0xffffffffa0059000
cfbimgblt 2138 0 radeon, Live 0xffffffffa002c000
cfbfillrect 3241 0 radeon, Live 0xffffffffa0026000
tun 13180 2 - Live 0xffffffffa0039000
kvm_intel 42801 4294967295 - Live 0xffffffffa0112000
kvm 250629 0 kvm_intel, Live 0xffffffffa00bf000
dell_wmi 2939 4294967295 - Live 0xffffffffa000e000
snd_hda_codec_analog 72342 0 - Live 0xffffffffa00ab000
wmi 7636 0 dell_wmi, Live 0xffffffffa0004000
e1000e 186408 4294967295 - Live 0xffffffffa006e000
snd_hda_intel 22245 4294967295 - Live 0xffffffffa0061000
snd_hda_codec 69600 1 snd_hda_codec_analog,snd_hda_intel, Live 0xffffff=
ffa004600
0
snd_hwdep 5914 0 snd_hda_codec, Live 0xffffffffa003e000
8139too 31275 4294967295 - Live 0xffffffffa002f000
snd_pcm 70720 1 snd_hda_intel,snd_hda_codec, Live 0xffffffffa0012000
snd_timer 18357 0 snd_pcm, Live 0xffffffffa0007000
snd_page_alloc 7365 1 snd_hda_intel,snd_pcm, Live 0xffffffffa0000000

As you can see, some refcount become negtive
--
Regards
dave
