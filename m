From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: tracing/powerpc tree build failure
Date: Thu, 2 Apr 2009 00:03:15 +1100
Message-ID: <20090402000315.7c6a9a4d.sfr@canb.auug.org.au>
References: <20090327230834.93d0221d.sfr@canb.auug.org.au>
	<1238158131.22033.10.camel@localhost.localdomain>
	<20090331165430.383fe51d.sfr@canb.auug.org.au>
	<20090401125148.GL12966@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__2_Apr_2009_00_03_15_+1100_y9tbRDlZPerlbFV="
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53307 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752944AbZDAND0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 1 Apr 2009 09:03:26 -0400
In-Reply-To: <20090401125148.GL12966@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Steven Rostedt <srostedt@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org

--Signature=_Thu__2_Apr_2009_00_03_15_+1100_y9tbRDlZPerlbFV=
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

[Its midnight, so this is just a quick reply.]

On Wed, 1 Apr 2009 14:51:48 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>=20
> > This patch is now applicable to the tracing tree after merging=20
> > with Linus' tree.
>=20
> Thanks, that's useful info.
>=20
> There's the skb tracepoints related merge fixlet needed too.=20
> Anything else in this context you are aware of?

They are the only two build fixes I have at the moment.  On top of that
these are the only conflicts I get when merging the tip trees:

Merging tip-core/auto-core-next
CONFLICT (content): Merge conflict in include/linux/netfilter/xt_limit.h
CONFLICT (content): Merge conflict in include/linux/netfilter/xt_statistic.h
CONFLICT (content): Merge conflict in lib/Kconfig.debug
Merging cpus4096/auto-cpus4096-next
CONFLICT (content): Merge conflict in arch/x86/include/asm/topology.h
CONFLICT (content): Merge conflict in arch/x86/kernel/cpu/common.c
CONFLICT (content): Merge conflict in arch/x86/kernel/cpu/intel_cacheinfo.c
CONFLICT (content): Merge conflict in drivers/oprofile/buffer_sync.c
Merging tracing/auto-tracing-next
CONFLICT (add/add): Merge conflict in arch/parisc/include/asm/ftrace.h
CONFLICT (content): Merge conflict in include/linux/slub_def.h
CONFLICT (content): Merge conflict in kernel/extable.c
CONFLICT (content): Merge conflict in mm/slob.c
CONFLICT (content): Merge conflict in mm/slub.c

I think these are mostly trivial (except the parisc one you commented on
before).  Some are caused by the same commit being in two trees and
further work in one of them.  Anything non-tivial will have been reported
previously.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__2_Apr_2009_00_03_15_+1100_y9tbRDlZPerlbFV=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknTZhMACgkQjjKRsyhoI8xaxgCffoL5BJQFDfY6o5R6cxyQfoDC
2roAn0bbEPqXqJogOcbtcTYhS3qQaMxd
=RwnT
-----END PGP SIGNATURE-----

--Signature=_Thu__2_Apr_2009_00_03_15_+1100_y9tbRDlZPerlbFV=--
