From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: "ALSA: hda - Fix build of patch_sigmatel.c" commit
 breaks sparc
Date: Sun, 18 Mar 2012 14:43:34 -0400
Message-ID: <CAP=VYLrxdFQfF5bZ1wEc3qbTP8=r+wkdiE-_Tj+rTgYEoUPKKA@mail.gmail.com>
References: <20120318182555.GB2095@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:48719 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751979Ab2CRSng convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 18 Mar 2012 14:43:36 -0400
Received: by lahj13 with SMTP id j13so4240402lah.19
        for <linux-next@vger.kernel.org>; Sun, 18 Mar 2012 11:43:35 -0700 (PDT)
In-Reply-To: <20120318182555.GB2095@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: tiwai@suse.de
Cc: linux-next@vger.kernel.org

On Sun, Mar 18, 2012 at 2:25 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> Hi Takashi,
>
> If you have a spare moment, can you look at the following build failu=
re?

I see now that Randy already reported this.  Sorry for the duplicate.

http://marc.info/?l=3Dlinux-next&m=3D133191059601660&w=3D2

Paul.
---

>
> http://kisskb.ellerman.id.au/kisskb/buildresult/5884004/
>
> I didn't bisect to be 100% sure, but it does look like it might be
> caused by your commit below.
>
> Thanks,
> Paul.
> ---
>
> commit 7907ae3e50613ae1c6d1a10f34fcd63f4123b93d
> Author: Takashi Iwai <tiwai@suse.de>
> Date: =A0 Wed Mar 14 08:20:20 2012 +0100
>
> =A0 =A0ALSA: hda - Fix build of patch_sigmatel.c without CONFIG_SND_H=
DA_POWER_SAVE
>
> =A0 =A0Now the mute-LED is controlled without powersave hack, and the=
 ifdefs must
> =A0 =A0be removed.
>
> =A0 =A0Signed-off-by: Takashi Iwai <tiwai@suse.de>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-next"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
