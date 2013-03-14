From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [-next] staging/comedi regressions
Date: Thu, 14 Mar 2013 20:33:29 +0100
Message-ID: <CAMuHMdWS5jqA=mXsCO-Bb84PuWDH-Qc17Jt=cWzTdKEah36hpw@mail.gmail.com>
References: <CAMuHMdXyBqwqn3aWpjwer5HYYqQvyMJTxJY-WeDGxLxkg_ZXQw@mail.gmail.com>
	<20130312222132.GA12477@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ia0-f177.google.com ([209.85.210.177]:58569 "EHLO
	mail-ia0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751461Ab3CNTda convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 14 Mar 2013 15:33:30 -0400
In-Reply-To: <20130312222132.GA12477@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: H Hartley Sweeten <hsweeten@visionengravers.com>, driverdevel <devel@driverdev.osuosl.org>, Linux-Next <linux-next@vger.kernel.org>, linux-kernel@vger.kernel.org

On Tue, Mar 12, 2013 at 11:21 PM, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Tue, Mar 12, 2013 at 11:13:50PM +0100, Geert Uytterhoeven wrote:
>> m68k/allmodconfig:
>>
>> drivers/staging/comedi/drivers/ni_atmio.c: In function =E2=80=98ni_i=
sapnp_find_board=E2=80=99:
>> drivers/staging/comedi/drivers/ni_atmio.c:353: error: =E2=80=98n_ni_=
boards=E2=80=99
>> undeclared (first use in this function)
>> drivers/staging/comedi/drivers/ni_atmio.c:353: error: (Each undeclar=
ed
>> identifier is reported only once
>> drivers/staging/comedi/drivers/ni_atmio.c:353: error: for each
>> function it appears in.)
>> drivers/staging/comedi/drivers/ni_atmio.c: In function =E2=80=98ni_g=
etboardtype=E2=80=99:
>> drivers/staging/comedi/drivers/ni_atmio.c:391: error: =E2=80=98n_ni_=
boards=E2=80=99
>> undeclared (first use in this function)
>> drivers/staging/comedi/drivers/ni_atmio.c: In function =E2=80=98ni_a=
tmio_attach=E2=80=99:
>> drivers/staging/comedi/drivers/ni_atmio.c:470: error: =E2=80=98board=
type=E2=80=99
>> undeclared (first use in this function)
>>
>> http://kisskb.ellerman.id.au/kisskb/buildresult/8392062/
>
> Hartley already fixed it, this will show up in the next linux-next tr=
ee
> as I commited the fix a few hours ago.

Thanks, but now it fails differently:

http://kisskb.ellerman.id.au/kisskb/buildresult/8398995/
drivers/staging/comedi/drivers/ni_atmio.c:472:2: error: expected ';'
before 'printk'

There's a semicolon missing on the previous line.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
                                -- Linus Torvalds
