From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: suspend tree build warnings
Date: Wed, 19 Aug 2009 23:38:03 +0200
Message-ID: <200908192338.03910.rjw@sisk.pl>
References: <20090819172419.2cf53008.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:33822 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753114AbZHSVhU convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 19 Aug 2009 17:37:20 -0400
In-Reply-To: <20090819172419.2cf53008.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, pm list <linux-pm@lists.linux-foundation.org>, Alan Stern <stern@rowland.harvard.edu>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org

On Wednesday 19 August 2009, Stephen Rothwell wrote:
> Hi Rafael,

Hi,

> Today's linux-next build (x86_64 allmodconfig) produced these warning=
s:
>=20
> drivers/media/dvb/frontends/dib7000p.c: In function =E2=80=98dib7000p=
_i2c_enumeration=E2=80=99:
> drivers/media/dvb/frontends/dib7000p.c:1315: warning: the frame size =
of 2256 bytes is larger than 2048 bytes
> drivers/media/dvb/frontends/dib3000mc.c: In function =E2=80=98dib3000=
mc_i2c_enumeration=E2=80=99:
> drivers/media/dvb/frontends/dib3000mc.c:853: warning: the frame size =
of 2160 bytes is larger than 2048 bytes
>=20
> Introduced by commit 99307958cc9c1b0b2e0dad4bbefdafaf9ac5a681 ("PM:
> Introduce core framework for run-time PM of I/O devices (rev. 17)").

Well.

This commit increases the size of struct device quite a bit and both of=
 the
drivers above create a "state" object on the stack that contains struct=
 device
among other things.

I think they should allocate these objects using kmalloc() and I don't =
know
what I can do about this, really.  Maybe except for modifying the drive=
rs to
use kmalloc().

Thanks,
Rafael
