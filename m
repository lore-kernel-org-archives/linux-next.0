From: Michal Hocko <mhocko@suse.cz>
Subject: Re: inux-next: Tree for Apr 27 (uml + mm/memcontrol.c)
Date: Mon, 7 May 2012 16:01:04 +0200
Message-ID: <20120507140103.GA4251@tiehlicka.suse.cz>
References: <alpine.DEB.2.00.1204271141040.28516@chino.kir.corp.google.com>
 <20120427132343.fbb443b9.akpm@linux-foundation.org>
 <alpine.DEB.2.00.1204271420350.4631@chino.kir.corp.google.com>
 <20120427143646.8209627e.akpm@linux-foundation.org>
 <87fwbnag6u.fsf@skywalker.in.ibm.com>
 <alpine.DEB.2.00.1205030208120.21476@chino.kir.corp.google.com>
 <CABEgKgqWo=b=o7PwOLc=QqCWXQxUaYvMX99GP9cR_Y-RoTEW3g@mail.gmail.com>
 <alpine.DEB.2.00.1205031343300.1631@chino.kir.corp.google.com>
 <CABEgKgoNaWtoNN_DOH+KTg7VHYDxVCyekcUC3TBfA313TR0jCw@mail.gmail.com>
 <20120504172420.GF24639@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:50691 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756571Ab2EGOBH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 May 2012 10:01:07 -0400
Content-Disposition: inline
In-Reply-To: <20120504172420.GF24639@google.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Hiroyuki Kamezawa <kamezawa.hiroyuki@gmail.com>, David Rientjes <rientjes@google.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, Johannes Weiner <hannes@cmpxchg.org>

On Fri 04-05-12 10:24:20, Tejun Heo wrote:
> Hello,
>=20
> (cc'ing Johannes and Michal, hi guys)
>=20
> On Fri, May 04, 2012 at 08:17:11AM +0900, Hiroyuki Kamezawa wrote:
> > > Cgroups is moving to a single hierarchy for simplification, this =
isn't the
> > > only example of where this is currently suboptimal and it would b=
e
> > > disappointing to solidify hugetlb control as part of memcg becaus=
e of this
> > > current limitation that will be addressed by generic cgroups deve=
lopment.
> > >
> > > Folks, once these things are merged they become an API that can't=
 easily
> > > be shifted around and seperated out later. =A0The decision now is=
 either to
> > > join hugetlb control with memcg forever when they act in very dif=
ferent
> > > ways or to seperate them so they can be used and configured indiv=
idually.
> >=20
> > How do other guys think ? Tejun ?
>=20
> I don't know.  hugetlbfs already is this franken thing which is
> separate from the usual memory management.  It needing cgroup type
> resource limitation feels a bit weird to me.  Isn't this supposed to
> be used in more-or-less tightly controlled setups?  The whole thing
> needs to have its memory cut out from boot after all.
>=20
> If someone really has to add cgroup support to hugetlbfs, I'm more
> inclined to say let them play in their own corner unless incorporatin=
g
> it into memcg makes it inherently better.

I would agree with you but my impression from the previous (hugetlb)
implementation was that it is much harder to implement the charge movin=
g
if we do not use page_cgroup.
Also the range tracking is rather ugly and clumsy.

> That said, I really don't know that much about mm.  Johannes, Michal,
> what do you guys think?
>=20
> Thanks.
>=20
> --=20
> tejun

--=20
Michal Hocko
SUSE Labs
SUSE LINUX s.r.o.
Lihovarska 1060/12
190 00 Praha 9   =20
Czech Republic
