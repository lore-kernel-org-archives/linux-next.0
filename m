From: Bob Liu <lliubbo@gmail.com>
Subject: Re: "blackfin: twi: move twi bit mask macro to twi head file"
Date: Thu, 24 May 2012 17:20:34 +0800
Message-ID: <CAA_GA1eD9cQw-SD7kA_h=TjKT67_O2k20KC+TGMuBwkw5byb5A@mail.gmail.com>
References: <20120524005940.GB24787@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:59280 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754486Ab2EXJUf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 24 May 2012 05:20:35 -0400
Received: by wibhj8 with SMTP id hj8so5553973wib.1
        for <linux-next@vger.kernel.org>; Thu, 24 May 2012 02:20:34 -0700 (PDT)
In-Reply-To: <20120524005940.GB24787@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Sonic Zhang <sonic.zhang@analog.com>, linux-next@vger.kernel.org, uclinux-dist-devel@blackfin.uclinux.org

Hi Paul,

On Thu, May 24, 2012 at 8:59 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> Hi all,
>
> This commit:
>
> ------
> commit c55c89e939f2a0a83d5c61462be554d5d2408178
> Author: Sonic Zhang <sonic.zhang@analog.com>
> Date: =C2=A0 Thu Nov 24 17:40:07 2011 +0800
>
> =C2=A0 =C2=A0blackfin: twi: move twi bit mask macro to twi head file
>
> =C2=A0 =C2=A0Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
> =C2=A0 =C2=A0Signed-off-by: Bob Liu <lliubbo@gmail.com>
> ------
>
> seems to break linux-next builds, such as this:
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0http://kisskb.ellerman.id.au/kisskb/buildr=
esult/6353497/
>
> Please have a look, thanks.

That's because some blackfin i2c patches under drivers/i2c/ are still
not merged.
I'll request the i2c maintainer to merge them soon.

Thank you!

--=20
Regards,
--Bob
