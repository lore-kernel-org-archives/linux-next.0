From: "Tobin C. Harding" <me@tobin.cc>
Subject: Re: linux-next: build warning after merge of the random tree
Date: Mon, 18 Jun 2018 15:29:00 +1000
Message-ID: <20180618052900.GA4579@eros>
References: <20180608133748.58a272d5@canb.auug.org.au>
 <20180618133523.30db3ba0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180618133523.30db3ba0@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Theodore Ts'o <tytso@mit.edu>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Jun 18, 2018 at 01:35:23PM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> On Fri, 8 Jun 2018 13:37:48 +1000 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > After merging the random tree, today's linux-next build (arm
> > multi_v7_defconfig) produced this warning:
> >=20
> > lib/vsprintf.c:1668:13: warning: 'have_filled_random_ptr_key' defined b=
ut not used [-Wunused-variable]
> >  static bool have_filled_random_ptr_key __read_mostly;
> >              ^~~~~~~~~~~~~~~~~~~~~~~~~~
> >=20
> > Introduced by commit
> >=20
> >   bfe80ed3d7c7 ("vsprintf: add command line option debug_boot_weak_hash=
")
>=20
> I am still getting this ...

This is fixed in:

	[PATCH v7 0/4] enable early printing of hashed pointers


FYI v8 to come with unrelated change removing EXPORT_SYMBOL() (as suggested
on LKML in response to v7)



thanks,
Tobin.
