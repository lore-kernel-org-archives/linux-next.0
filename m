From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: origin tree build failure
Date: Sat, 13 Jun 2009 15:06:34 +1000
Message-ID: <20090613150634.3221d74a.sfr@canb.auug.org.au>
References: <20090612102427.32582baa.sfr@canb.auug.org.au>
	<1244768406.7172.1.camel@pasglop> <20090612092054.GB32052@elte.hu>
	<1244799197.7172.106.camel@pasglop>
	<20090612125335.GH31845@elte.hu>
	<1244812224.7172.146.camel@pasglop>
	<1244813397.7172.156.camel@pasglop>
	<20090612134940.GD32105@elte.hu>
	<1244815574.7172.171.camel@pasglop>
	<20090612141118.GK32105@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0440895793983238378=="
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <20090612141118.GK32105@elte.hu>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Mime-version: 1.0
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
To: Ingo Molnar <mingo@elte.hu>
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>, ppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, paulus@samba.org, Linus <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

--===============0440895793983238378==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__13_Jun_2009_15_06_34_+1000_2EUVha+RtjHgWiRz"

--Signature=_Sat__13_Jun_2009_15_06_34_+1000_2EUVha+RtjHgWiRz
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Fri, 12 Jun 2009 16:11:18 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>
> But that's axiomatic, isnt it? linux-next build-tests PowerPC as the=20
> first in the row of tests - so no change that was in linux-next can=20
> ever cause a build failure on PowerPC, right?

Not really.  I build a powerpc ppc64_defconfig and an x86_64 allmodconfig
between merging most trees.  At the end of the day, I do the following
builds before releasing linux-next:

powerpc allnoconfig
powerpc64 allnoconfig
powerpc ppc44x_defconfig
powerpc allyesconfig
i386 defconfig
sparc64 defconfig
sparc defconfig

Which clearly doesn't cover all possible configs, but is a start and
catches a lot (the powerpc allyesconfig is only 64 bit).

Then after release, linux-next gets built for a lot of architectures and
configs (see http://kisskb.ellerman.id.au/kisskb/branch/9/).  A couple of
people also do randconfig builds which find all sorts of things.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__13_Jun_2009_15_06_34_+1000_2EUVha+RtjHgWiRz
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkozM9oACgkQjjKRsyhoI8xBVwCeNVCbILrnRv1ZNcEBWJwr2lbO
3pwAn0PmPtwU7KAQ2sXl8NNi3bYnjxhY
=bu6d
-----END PGP SIGNATURE-----

--Signature=_Sat__13_Jun_2009_15_06_34_+1000_2EUVha+RtjHgWiRz--

--===============0440895793983238378==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linuxppc-dev mailing list
Linuxppc-dev@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/linuxppc-dev
--===============0440895793983238378==--
