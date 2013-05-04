From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Splitting stk1160-ac97 as a module (Re: linux-next: Tree for May 1
 (media/usb/stk1160))
Date: Sat, 4 May 2013 14:21:44 -0300
Message-ID: <20130504172142.GA21656@localhost>
References: <20130501183734.7ad1efca2d06e75432edabbd@canb.auug.org.au>
 <518157EB.3010700@infradead.org>
 <51827DB1.7000304@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <51827DB1.7000304@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Ezequiel =?utf-8?Q?Garc=C3=ADa?= <elezegarcia@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media <linux-media@vger.kernel.org>, linux-kbuild@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Mauro,

On Thu, May 02, 2013 at 11:52:33AM -0300, Mauro Carvalho Chehab wrote:
> >
> > is unreliable (doesn't do what some people expect) when SND=3Dm and=
 SND_AC97_CODEC=3Dm,
> > since VIDEO_STK1160_AC97 is a bool.
>=20
> Using select is always tricky.
>=20
> I can see a few possible fixes for it:
>=20
> 1) split the alsa part into a separate module. IMHO, this is cleaner,
> but requires a little more work.
>=20

I'm trying to split the ac97 support into a separate module.
So far I've managed to do this with two different approaches,
but both of them are broken in some way :-(

Couple questions:

1. Is it possible to force two symbols to be both built-in (=3Dy) or bo=
th
modules (=3Dm)? This would make one of my solutions work.

2. Do you think it's possible to split this as a module *without*
requesting the driver dynamically? I've tried the same extensions appro=
ach
as in em28xx and others, but found some problems with the way
snd-usb-audio driver registers.
=20
Thanks,
--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
