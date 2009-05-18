From: Borislav Petkov <borislav.petkov@amd.com>
Subject: Re: linux-next: Tree for May 15
Date: Mon, 18 May 2009 11:48:22 +0200
Message-ID: <20090518094822.GB4905@aftab>
References: <20090515153733.4384db9f.sfr@canb.auug.org.au> <20090515130729.GA13026@aftab> <20090518000734.6fd3d652.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756528AbZERJyc@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090518000734.6fd3d652.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Doug Thompson <dougthompson@xmission.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Mon, May 18, 2009 at 12:07:34AM +1000, Stephen Rothwell wrote:
> Hi Boris,
>=20
> On Fri, 15 May 2009 15:07:29 +0200 Borislav Petkov <borislav.petkov@a=
md.com> wrote:
> >
> > can you please add the tree at
> >=20
> > git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp.git for-next
> >=20
> > to linux-test for a wider testing. It is rebased ontop of
> > 45d447406a19cbfd42720f066f156f4eb9d68801 (Linus's tree from yesterd=
ay).
>=20
> A hint as to what the tree is about would be nice.  It looks like EDA=
C
> stuff (mostly AMD64).

It is an EDAC module for AMD k8, Fam10h and Fam11h processors.

> If so, you are not listed as a maintainer of that code (Doug cc'd).

I'll send a patch to update that later.

> The boilerplate:
>=20
> What I tell everyone: all patches/commits in the tree/series must
> have been:
>=20
> 	posted to a relevant mailing list

done, lkml.

> 	reviewed

The review process had 3 iterations, see:

http://lkml.indiana.edu/hypermail/linux/kernel/0904.3/02606.html
http://lwn.net/Articles/332324/
http://lkml.indiana.edu/hypermail/linux/kernel/0905.1/03571.html

Reviewers: x86 maintainers, Andrew Morton, Greg KH, Mauro Carvalho Cheh=
ab

> 	unit tested

done.

> 	destined for the next merge window (or the current release)

It is destined for the .31 merge window, as Andrew suggested.

Let me know if there's anything more needed.

Thanks.

--=20
Regards/Gruss,
Boris.

Operating | Advanced Micro Devices GmbH
  System  | Karl-Hammerschmidt-Str. 34, 85609 Dornach b. M=FCnchen, Ger=
many
 Research | Gesch=E4ftsf=FChrer: Thomas M. McCoy, Giuliano Meroni
  Center  | Sitz: Dornach, Gemeinde Aschheim, Landkreis M=FCnchen
  (OSRC)  | Registergericht M=FCnchen, HRB Nr. 43632
