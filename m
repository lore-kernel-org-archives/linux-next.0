From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Fri, 18 Feb 2011 09:47:54 +1100
Message-ID: <20110218094754.0436a60a.sfr@canb.auug.org.au>
References: <20110131154259.dca1f7e6.sfr@canb.auug.org.au>
	<20110217144743.2db26b27.sfr@canb.auug.org.au>
	<4D5D201A.8090304@suse.cz>
	<20110217150200.GA32177@sepie.suse.cz>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__18_Feb_2011_09_47_54_+1100_5OXtcYP7aCBQOdat"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41493 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753721Ab1BQWsE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 17 Feb 2011 17:48:04 -0500
In-Reply-To: <20110217150200.GA32177@sepie.suse.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>

--Signature=_Fri__18_Feb_2011_09_47_54_+1100_5OXtcYP7aCBQOdat
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Michal,

On Thu, 17 Feb 2011 16:02:00 +0100 Michal Marek <mmarek@suse.cz> wrote:
>
> > _Maybe_ we could work around it by letting fixdep remove the actual
> > source file from the list of dependencies in the .cmd file. The
> > dependency on the .c / .S / whatever file is given by the Makefiles, the
> > .cmd file is only needed for additional dependencies on headers. Let's
> > see what else breaks then ;).
>=20
> It seems to work for me. Can you try the patch below? It needs to be
> applied before merging 9599ec0 to have any effect.

Thanks, I will apply this as a fix on top of Linus' tree before I merge
anything else.  It looks simple enough that Linus may take it as a fix
right now.   Better to convince ourselves first, though, right?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__18_Feb_2011_09_47_54_+1100_5OXtcYP7aCBQOdat
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJNXaWaAAoJEDMEi1NhKgbs+58H/2x9q9i49DCV5AAT8YCXwqRS
IbZKf0GkQ3d2JZiO20k28iJ7leZOMd+7wl4s0ZtYnwIl/pDx7YM5Ba1f4kJdw7j+
saZ2v/CEbisBYjVjGfxZ0gy1OrG180hFqs1rdSFn2GF2lCkZVIZj0imeYt2WGYTT
56d4dQ5uywaMfxCK9h2zF1thF1sclsw1evekK/neb6YhAk39wbZOUb/+TpnmyUfT
bRQaXkA9XC6H2rrDowmBprvLD/ivYJbpkbQPkYMkHeR6lF/EQ8CukIXa+HjFrpFV
xyn/bxZpR4TS7JkXmdXyjqnk29k4KWi45X9tw1AL3aPBWW/7u/iu/mcIvKtzyVs=
=OCZC
-----END PGP SIGNATURE-----

--Signature=_Fri__18_Feb_2011_09_47_54_+1100_5OXtcYP7aCBQOdat--
