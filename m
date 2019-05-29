From: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the v4l-dvb tree
Date: Wed, 29 May 2019 18:11:04 -0300
Message-ID: <20190529181104.6ae7e5de@coco.lan>
References: <20190529080454.6d62a7fd@canb.auug.org.au>
        <20190529210511.GM1651@bigcity.dyn.berto.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190529210511.GM1651@bigcity.dyn.berto.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?= <niklas.soderlund@ragnatech.se>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
List-Id: linux-next.vger.kernel.org

Em Wed, 29 May 2019 23:05:11 +0200
"Niklas S=C3=B6derlund" <niklas.soderlund@ragnatech.se> escreveu:

> Hi Stephen, Mauro,
>=20
> On 2019-05-29 08:04:54 +1000, Stephen Rothwell wrote:
> > Hi Mauro,
> >=20
> > In commit
> >=20
> >   0c310868826e ("media: rcar-csi2: Fix coccinelle warning for PTR_ERR_O=
R_ZERO()")
> >=20
> > Fixes tag
> >=20
> >   Fixes: 3ae854cafd76 ("rcar-csi2: Use standby mode instead of resettin=
g")
> >=20
> > has these problem(s):
> >=20
> >   - Target SHA1 does not exist
> >=20
> > Did you mean
> >=20
> > Fixes: d245a940d97b ("media: rcar-csi2: Use standby mode instead of res=
etting") =20
>=20
> Yes I meant d245a940d97b commit, for some reason I was on the wrong=20
> branch when looking up the sha1 for the fixes tag and used one from a=20
> local development branch.
>=20
> This is my mess, sorry about that. What can I do to help fix it?

That's a good question... no idea. Rebasing the tree due to that sounds
a bad idea. Reverting/reapplying also doesn't sound the best thing,
as it will just make -stable people even more confused.

I should probably try to implement a script like the one Stephen
has on my patch import scripts.

Thanks,
Mauro
