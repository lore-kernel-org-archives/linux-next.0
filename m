From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: sparc tree build failure
Date: Mon, 4 Aug 2008 15:35:40 +1000
Message-ID: <20080804153540.238a079c.sfr@canb.auug.org.au>
References: <20080725170527.00a7bf4a.sfr@canb.auug.org.au>
	<20080803.212620.17129972.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__4_Aug_2008_15_35_40_+1000_hw=kqP/dURyQw7pD"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51107 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752981AbYHDFfs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 4 Aug 2008 01:35:48 -0400
In-Reply-To: <20080803.212620.17129972.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Steven Whitehouse <swhiteho@redhat.com>

--Signature=_Mon__4_Aug_2008_15_35_40_+1000_hw=kqP/dURyQw7pD
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Sun, 03 Aug 2008 21:26:20 -0700 (PDT) David Miller <davem@davemloft.net>=
 wrote:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 25 Jul 2008 17:05:27 +1000
>=20
> > Hi Dave,
> >=20
> > Today's linux-next build (sparc defconfig) failed like this:
> >=20
> >   Building modules, stage 2.
> > .tmp_kallsyms2.o(.rodata+0x0): In function `kallsyms_addresses':
> > : relocation truncated to fit: R_SPARC_32 _text
>=20
> FWIW, Sam had narrowed it down to:
>=20
> commit fd593d12770d4a0d1ff095d44b96436c18479ee8
> Author: Eric W. Biederman <ebiederm@xmission.com>
> Date:   Thu Dec 7 02:14:04 2006 +0100
>=20
>     [PATCH] relocatable kernel: Kallsyms generate relocatable symbols
>    =20
>     Print the addresses of non-absolute symbols relative to _text
>     so that ld will generate relocations.  Allowing a relocatable
>     kernel to relocate them.  We can't actually use the symbol names
>     because kallsyms includes static symbols that are not exported
>     from their object files.
>    =20
>     Add the _text symbol definitions to the architectures which don't
>     define it otherwise linker will fail.
>    =20
>     Signed-off-by: Eric W. Biederman <ebiederm@xmission.com>
>     Signed-off-by: Vivek Goyal <vgoyal@in.ibm.com>
>     Signed-off-by: Andi Kleen <ak@suse.de>
>=20
> and
>=20
> commit 2c22d8baa98a92022acb85b0b7c6f4a60df55f47
> Author: Vivek Goyal <vgoyal@in.ibm.com>
> Date:   Thu Dec 7 02:14:10 2006 +0100
>=20
>     [PATCH] relocatable kernel: Fix kallsyms on avr32 after relocatable k=
ernel changes
>    =20
>     o On some platforms like avr32, section init comes before .text and
>       not necessarily a symbol's relative position w.r.t _text is positiv=
e.
>       In such cases assembler detects the overflow and emits warning. This
>       patch fixes it.
>    =20
>     Signed-off-by: Vivek Goyal <vgoyal@in.ibm.com>
>     Signed-off-by: Andi Kleen <ak@suse.de>
>     Cc: Andi Kleen <ak@suse.de>
>     Cc: Haavard Skinnemoen <hskinnemoen@atmel.com>
>     Signed-off-by: Andrew Morton <akpm@osdl.org>
>=20
> but I personally still can't reproduce this.  I even had the gcc-3.4.5
> that's installed on my box, using defconfig just like you, and I can't
> trigger this problem.

Weird because I tracked it down to the following:

I finally bisected it down to this commit:

commit f9247273cb69ba101877e946d2d83044409cc8c5
Author: Steven Whitehouse <swhiteho@redhat.com>
Date:   Thu Jul 24 17:22:13 2008 +0100

    UFS: add const to parser token table


(I sent you an email about this on July 31.)
If I revert this and the followup commit:

commit fb2e405fc1fc8b20d9c78eaa1c7fd5a297efde43
Author: Adrian Bunk <bunk@kernel.org>
Date:   Fri Jul 25 02:55:49 2008 +0300

    fix fs/nfs/nfsroot.c compilation

the build succeeds.  Though I must admit Sam's culprits look more likely.

Also weird because I first saw this on July 25 (commit
f9247273cb69ba101877e946d2d83044409cc8c5 first appeared in linux-next
(via Linus' tree) on that day).  It could be some interaction between the
two sets of patches.

Weirder yet, my build system (kisskb) never got this failure even though
it uses the same toolchain that I used.

I just tried again and reverting the two patches I mentioned above does
make the failure go away.

Steve Whitehouse and Andrew asked Linus to revert those two patches but
nothing has happened yet.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__4_Aug_2008_15_35_40_+1000_hw=kqP/dURyQw7pD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiWlSwACgkQjjKRsyhoI8w/HACgsg9CTvV4jh0X5HCfM7tjQ7qK
WhIAoIQefEr6zFRzAu3fhNyEMkIKpNIu
=1ysK
-----END PGP SIGNATURE-----

--Signature=_Mon__4_Aug_2008_15_35_40_+1000_hw=kqP/dURyQw7pD--
