From: Greg KH <gregkh@suse.de>
Subject: Re: linux-next: Tree for March 1 (staging/winbond)
Date: Tue, 1 Mar 2011 15:07:07 -0500
Message-ID: <20110301200707.GA12492@suse.de>
References: <20110301181119.f1c7a9c3.sfr@canb.auug.org.au>
 <20110301104924.071044ef.randy.dunlap@oracle.com>
 <AANLkTimX0zvBEMxedXnhXiaxwEKHmm_Tu6fiZQkahZrC@mail.gmail.com>
 <20110301111922.69b0d8c1.randy.dunlap@oracle.com>
 <AANLkTimayi4tSe=r1HOPgpcSucBWC7SoBV1ocmV5LEs4@mail.gmail.com>
 <20110301113930.69d7d992.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110301113930.69d7d992.randy.dunlap@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Pekka Enberg <penberg@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Mar 01, 2011 at 11:39:30AM -0800, Randy Dunlap wrote:
> On Tue, 1 Mar 2011 21:35:59 +0200 Pekka Enberg wrote:
>=20
> > On Tue, Mar 1, 2011 at 9:19 PM, Randy Dunlap <randy.dunlap@oracle.c=
om> wrote:
> > > On Tue, 1 Mar 2011 21:10:23 +0200 Pekka Enberg wrote:
> > >
> > >> On Tue, Mar 1, 2011 at 8:49 PM, Randy Dunlap <randy.dunlap@oracl=
e.com> wrote:
> > >> > On Tue, 1 Mar 2011 18:11:19 +1100 Stephen Rothwell wrote:
> > >> >
> > >> >> Hi all,
> > >> >>
> > >> >> Changes since 20110228:
> > >> >
> > >> >
> > >> > commit ddee7e28e7d5e4ba2b8537c6a59b035745c250bb
> > >> > Author: Pekka Enberg <penberg@kernel.org>
> > >> > Date: =A0 Sun Nov 28 23:00:01 2010 +0200
> > >> > =A0 =A0Staging: w35und: Remove empty sysdef.h header
> > >> >
> > >> >
> > >> > This header should not have been empty, since in
> > >> >
> > >> > commit 412dc7f368bf10a8049a8a4c41abbfd0108742e7
> > >> > Author: Randy Dunlap <randy.dunlap@oracle.com>
> > >> > Date: =A0 Fri Nov 19 09:30:18 2010 -0800
> > >> > =A0 =A0staging: fix winbond build, needs delay.h
> > >> >
> > >> > I added delay.h to it. =A0And now we have the same build
> > >> > errors that I fixed last November:
> > >> >
> > >> > drivers/staging/winbond/phy_calibration.c:986: error: implicit=
 declaration of function 'msleep'
> > >> > drivers/staging/winbond/phy_calibration.c:1555: error: implici=
t declaration of function 'udelay'
> > >> > drivers/staging/winbond/reg.c:893: error: implicit declaration=
 of function 'msleep'
> > >> > drivers/staging/winbond/reg.c:1169: error: implicit declaratio=
n of function 'udelay'
> > >>
> > >> Strange. I didn't see the problem. We should add delay.h to
> > >> phy_calibration.c and reg.c instead. Care to make a patch?
> > >> --
> > >
> > > No thanks, I'll let the staging people do that.
> >=20
> > Hmm, commit cecf826df8648c843ea8db63b1f82c154a74db36 ("staging:
> > winbond: needs <linux/delay.h> for msleep and friends") should fix =
it.
> > Isn't it in linux-next yet?

It should be in there tomorrow, the linux-next pull-time happened after
I pushed out my trees.

thanks,

greg k-h
