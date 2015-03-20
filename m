From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: linux-next: manual merge of the battery tree with the hid tree
Date: Fri, 20 Mar 2015 09:59:46 +0100
Message-ID: <1426841986.13579.2.camel@AMDC1943>
References: <20150320151110.02e10b33@canb.auug.org.au>
 <CAJKOXPer=oM98UwobA9SmiE9cjk3BUqkJVzcHQLVTBdVzwYd7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:61766 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750916AbbCTI7v (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 20 Mar 2015 04:59:51 -0400
In-reply-to: <CAJKOXPer=oM98UwobA9SmiE9cjk3BUqkJVzcHQLVTBdVzwYd7w@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Sebastian Reichel <sre@kernel.org>, Jiri Kosina <jikos@jikos.cz>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Gerecke <killertofu@gmail.com>

On pi=C4=85, 2015-03-20 at 08:58 +0100, Krzysztof Kozlowski wrote:
> 2015-03-20 5:11 GMT+01:00 Stephen Rothwell <sfr@canb.auug.org.au>:
> > Hi Sebastian,
> >
> > Today's linux-next merge of the battery tree got conflicts in
> > drivers/hid/wacom.h and drivers/hid/wacom_sys.c between commit
> > 953f2c5f7163 ("HID: wacom: Centralize updating of wacom_wac battery
> > status") and fce9957d8f61 ("HID: wacom: Allow dynamic battery
> > creation/destruction") from the hid tree and commit 297d716f6260
> > ("power_supply: Change ownership from driver to core") from the bat=
tery
> > tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary (no ac=
tion
> > is required).  I also applied the following merge fixup patch.
> >
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Fri, 20 Mar 2015 14:59:36 +1100
> > Subject: [PATCH] HID: wacom: merge fix for "Change ownership from d=
river to core"
> >
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  drivers/hid/wacom_wac.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> > index 5588ba80ede9..57ee0d807af1 100644
> > --- a/drivers/hid/wacom_wac.c
> > +++ b/drivers/hid/wacom_wac.c
> > @@ -62,7 +62,7 @@ static void wacom_notify_battery(struct wacom_wac=
 *wacom_wac,
> >                 wacom_wac->ps_connected =3D ps_connected;
> >
> >                 if (wacom->battery.dev)
>=20
> Should be:
> if (wacom->battery)
>=20
> Rest of patch looks fine but indeed some more changes are required.

Actually after looking at current next this Stephen's merge resolution
is sufficient for HID. I did not find any more issues. After that
s/battery.dev/battery/ change:

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Thanks Stephen for fixing!

Best regards,
Krzysztof
