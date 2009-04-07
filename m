From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: linux-next: v4l-dvb tree build failure
Date: Mon, 6 Apr 2009 22:20:55 -0300
Message-ID: <20090406222055.26ee6a34@pedra.chehab.org>
References: <20090407105832.d2590e6e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:60900 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751727AbZDGBVX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 6 Apr 2009 21:21:23 -0400
In-Reply-To: <20090407105832.d2590e6e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>

On Tue, 7 Apr 2009 10:58:32 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Mauro,
>=20
> Today's linux-next build (x86_64 allmodconfig) failed like this:
>=20
> drivers/media/video/v4l2-common.c: In function 'v4l2_i2c_new_probed_s=
ubdev_addr':
> drivers/media/video/v4l2-common.c:874: warning: passing argument 1 of=
 'v4l2_i2c_new_probed_subdev' from incompatible pointer type
> drivers/media/video/v4l2-common.c:874: warning: passing argument 2 of=
 'v4l2_i2c_new_probed_subdev' from incompatible pointer type
> drivers/media/video/v4l2-common.c:874: warning: passing argument 4 of=
 'v4l2_i2c_new_probed_subdev' from incompatible pointer type
> drivers/media/video/v4l2-common.c:874: error: too many arguments to f=
unction 'v4l2_i2c_new_probed_subdev'
>=20
> Caused by commit b97a45dfbd99a414a1af8e7224ab12d6ccbe3789 ("V4L/DVB
> (11374): v4l2-common: add v4l2_i2c_new_probed_subdev_addr").
>=20
> This was clearly never even built ...
>=20
> I have used the v4l-dvb tree fomr next-20090406 for today.
>=20

I suspect that you've pulled from my tree a few hours ago, before I fix=
 a merge
conflict. This were already fixed.=20

The only compilation messages I'm getting here are a few warnings about
the usage of the deprecated i2c API:

drivers/media/video/ir-kbd-i2c.c: In function =E2=80=98ir_attach=E2=80=99=
:
drivers/media/video/ir-kbd-i2c.c:420: warning: =E2=80=98i2c_attach_clie=
nt=E2=80=99 is deprecated (declared at include/linux/i2c.h:434)
drivers/media/video/ir-kbd-i2c.c:455: warning: =E2=80=98i2c_detach_clie=
nt=E2=80=99 is deprecated (declared at include/linux/i2c.h:435)
drivers/media/video/ir-kbd-i2c.c: In function =E2=80=98ir_detach=E2=80=99=
:
drivers/media/video/ir-kbd-i2c.c:471: warning: =E2=80=98i2c_detach_clie=
nt=E2=80=99 is deprecated (declared at include/linux/i2c.h:435)

Cheers,
Mauro
