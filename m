From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: randconfig build error with next-20150806, in
 drivers/usb/gadget/function/f_mass_storage.c
Date: Thu, 6 Aug 2015 11:25:32 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1508061120480.1268-100000@iolanthe.rowland.org>
References: <CA+r1ZhiXvhiL7o7v02gGc8goWOzk99JKA5KsvbDRiKXT4QAKnw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+r1ZhiXvhiL7o7v02gGc8goWOzk99JKA5KsvbDRiKXT4QAKnw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jim Davis <jim.epost@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb <linux-usb@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, 6 Aug 2015, Jim Davis wrote:

> Building with the attached random configuration file,
>=20
> drivers/usb/gadget/function/f_mass_storage.c: In function =E2=80=98fs=
g_main_thread=E2=80=99:
> drivers/usb/gadget/function/f_mass_storage.c:2520:2: error: implicit
> declaration of function =E2=80=98set_fs=E2=80=99
> [-Werror=3Dimplicit-function-declaration]
>   set_fs(get_ds());
>   ^
> drivers/usb/gadget/function/f_mass_storage.c:2520:2: error: implicit
> declaration of function =E2=80=98get_ds=E2=80=99
> [-Werror=3Dimplicit-function-declaration]

Looks like the source file needs to #include <linux/uaccess.h>. =20
Apparently it got brought in indirectly from some other header file in
4.1, but not in current linux-next.

Alan Stern
