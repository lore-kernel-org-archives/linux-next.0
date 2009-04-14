From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: [BUILD FAILURE 04/04] Next April 14 : x86_64 randconfig
	[drivers/media/video/cx231xx/cx231xx-alsa.ko]
Date: Tue, 14 Apr 2009 22:43:13 +0400
Message-ID: <a4423d670904141143i164e7350me0598c2b820422ab@mail.gmail.com>
References: <1239733669.5344.72.camel@subratamodak.linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f165.google.com ([209.85.219.165]:48648 "EHLO
	mail-ew0-f165.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758762AbZDNSnQ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 14 Apr 2009 14:43:16 -0400
In-Reply-To: <1239733669.5344.72.camel@subratamodak.linux.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: subrata@linux.vnet.ibm.com
Cc: Ingo Molnar <mingo@elte.hu>, Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, sachinp <sachinp@linux.vnet.ibm.com>, linux-kernel <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-media@vger.kernel.org

2009/4/14 Subrata Modak <subrata@linux.vnet.ibm.com>:
> Observed the following build error:
> ---
> Kernel: arch/x86/boot/bzImage is ready =C2=A0(#1)
> =C2=A0Building modules, stage 2.
> =C2=A0MODPOST 578 modules
> ERROR:
> "snd_pcm_period_elapsed" [drivers/media/video/cx231xx/cx231xx-alsa.ko=
]
> undefined!
> ERROR: "snd_card_create" [drivers/media/video/cx231xx/cx231xx-alsa.ko=
]
> undefined!
> ERROR:
> "snd_pcm_hw_constraint_integer" [drivers/media/video/cx231xx/cx231xx-=
alsa.ko] undefined!
> ERROR:
> "snd_pcm_link_rwlock" [drivers/media/video/cx231xx/cx231xx-alsa.ko]
> undefined!
> ERROR: "snd_pcm_set_ops" [drivers/media/video/cx231xx/cx231xx-alsa.ko=
]
> undefined!
> ERROR: "snd_pcm_lib_ioctl" [drivers/media/video/cx231xx/cx231xx-alsa.=
ko]
> undefined!
> ERROR: "snd_card_free" [drivers/media/video/cx231xx/cx231xx-alsa.ko]
> undefined!
> ERROR: "snd_card_register" [drivers/media/video/cx231xx/cx231xx-alsa.=
ko]
> undefined!
> ERROR: "snd_pcm_new" [drivers/media/video/cx231xx/cx231xx-alsa.ko]
> undefined!
> make[1]: *** [__modpost] Error 1
> make: *** [modules] Error 2
> ---

It is the same problem as #02.
