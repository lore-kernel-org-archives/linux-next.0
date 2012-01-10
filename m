From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: linux-next: Tree for Jan 4 (usb/otg)
Date: Tue, 10 Jan 2012 20:32:09 +0100
Message-ID: <CAMuHMdXg=Fr6HLCLJvGBJD6wsUKN0=nRi7rboQU6+i5NwTWe3w@mail.gmail.com>
References: <20120104191656.de575406a93b3c5226c531b2@canb.auug.org.au>
	<4F04E96F.6040501@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F04E96F.6040501-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Thu, Jan 5, 2012 at 01:06, Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org> wrote=
:
> On 01/04/2012 12:16 AM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20120103:
>
>
>
> ERROR: "usb_add_hcd" [drivers/usb/otg/mv_otg.ko] undefined!
> ERROR: "usb_remove_hcd" [drivers/usb/otg/mv_otg.ko] undefined!

And now it's in Linus' tree, for m68k allmodconfig:

http://kisskb.ellerman.id.au/kisskb/buildresult/5361188/
http://kisskb.ellerman.id.au/kisskb/buildresult/5361013/

BTW, strange that this error never popped up in linux-next before for t=
hat
config. Perhaps it was masked by the paride/bpck6.c build failure?

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
