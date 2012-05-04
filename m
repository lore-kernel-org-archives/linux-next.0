From: Tejun Heo <tj@kernel.org>
Subject: Re: inux-next: Tree for Apr 27 (uml + mm/memcontrol.c)
Date: Fri, 4 May 2012 10:24:20 -0700
Message-ID: <20120504172420.GF24639@google.com>
References: <4F9ABF9C.2070707@xenotime.net>
 <alpine.DEB.2.00.1204271141040.28516@chino.kir.corp.google.com>
 <20120427132343.fbb443b9.akpm@linux-foundation.org>
 <alpine.DEB.2.00.1204271420350.4631@chino.kir.corp.google.com>
 <20120427143646.8209627e.akpm@linux-foundation.org>
 <87fwbnag6u.fsf@skywalker.in.ibm.com>
 <alpine.DEB.2.00.1205030208120.21476@chino.kir.corp.google.com>
 <CABEgKgqWo=b=o7PwOLc=QqCWXQxUaYvMX99GP9cR_Y-RoTEW3g@mail.gmail.com>
 <alpine.DEB.2.00.1205031343300.1631@chino.kir.corp.google.com>
 <CABEgKgoNaWtoNN_DOH+KTg7VHYDxVCyekcUC3TBfA313TR0jCw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CABEgKgoNaWtoNN_DOH+KTg7VHYDxVCyekcUC3TBfA313TR0jCw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hiroyuki Kamezawa <kamezawa.hiroyuki@gmail.com>
Cc: David Rientjes <rientjes@google.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@suse.cz>
List-Id: linux-next.vger.kernel.org

Hello,

(cc'ing Johannes and Michal, hi guys)

On Fri, May 04, 2012 at 08:17:11AM +0900, Hiroyuki Kamezawa wrote:
> > Cgroups is moving to a single hierarchy for simplification, this is=
n't the
> > only example of where this is currently suboptimal and it would be
> > disappointing to solidify hugetlb control as part of memcg because =
of this
> > current limitation that will be addressed by generic cgroups develo=
pment.
> >
> > Folks, once these things are merged they become an API that can't e=
asily
> > be shifted around and seperated out later. =A0The decision now is e=
ither to
> > join hugetlb control with memcg forever when they act in very diffe=
rent
> > ways or to seperate them so they can be used and configured individ=
ually.
>=20
> How do other guys think ? Tejun ?

I don't know.  hugetlbfs already is this franken thing which is
separate from the usual memory management.  It needing cgroup type
resource limitation feels a bit weird to me.  Isn't this supposed to
be used in more-or-less tightly controlled setups?  The whole thing
needs to have its memory cut out from boot after all.

If someone really has to add cgroup support to hugetlbfs, I'm more
inclined to say let them play in their own corner unless incorporating
it into memcg makes it inherently better.

That said, I really don't know that much about mm.  Johannes, Michal,
what do you guys think?

Thanks.

--=20
tejun
