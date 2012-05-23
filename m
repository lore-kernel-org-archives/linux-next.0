From: Olof Johansson <olof@lixom.net>
Subject: Re: Bad ux500 merge fix leads to linux-next failure
Date: Tue, 22 May 2012 17:10:10 -0700
Message-ID: <CAOesGMgSGZqMtcCGv0f8oyoPmDFiGbPm0=1KxkNsZVG0LZPO9w@mail.gmail.com>
References: <20120523000346.GB3610@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:42433 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756940Ab2EWAKM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 22 May 2012 20:10:12 -0400
Received: by dady13 with SMTP id y13so8928505dad.19
        for <linux-next@vger.kernel.org>; Tue, 22 May 2012 17:10:11 -0700 (PDT)
In-Reply-To: <20120523000346.GB3610@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org

Hi,

Yeah, there was some confusion earlier, and I noticed that when
staging the branches for Linus last night. I'll rebuild for-next
tonight and take care of it then, thanks for the reminder!


-Olof

On Tue, May 22, 2012 at 5:03 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> Hi Olof,
>
> This change:
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
id.o usb.o timer.o
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
id.o pins.o usb.o timer.o
>
> breaks the u8500_defconfig as follows:
>
> make[2]: *** No rule to make target `arch/arm/mach-ux500/pins.o', nee=
ded
> by `arch/arm/mach-ux500/built-in.o'. =A0Stop.
> make[1]: *** [arch/arm/mach-ux500/] Error 2
> make: *** [sub-make] Error 2
>
> A bisect shows the following:
>
> cda6f4d8cae969e08e6662573b538db73191873b is the first bad commit
> commit cda6f4d8cae969e08e6662573b538db73191873b
> Author: Olof Johansson <olof@lixom.net>
> Date: =A0 Wed May 16 14:47:24 2012 -0700
>
> =A0 =A0ARM: ux500: fix mismerge in for-next
>
> =A0 =A0Signed-off-by: Olof Johansson <olof@lixom.net>
>
> :040000 040000 abc42227f7daa6a7ff6153e0908add25ffb38a54
> 45d2618822e6075aea188089191791091c2e5c38 M =A0 =A0 =A0arch
> bisect run success
>
> The linux-next fail is here:
> =A0 =A0 =A0 =A0http://kisskb.ellerman.id.au/kisskb/buildresult/634860=
9/
>
> Can you have a look please?
>
> Thanks,
> Paul.
