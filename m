From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH -next] metag: Fix ioremap_wc/ioremap_cached build errors
Date: Tue, 24 Mar 2015 08:02:38 +1100
Message-ID: <20150324080238.222953d5@canb.auug.org.au>
References: <1427113575-29222-1-git-send-email-james.hogan@imgtec.com>
	<20150323195401.GA863@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/N1daEiW6aeE+OeLM=ev4gav"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53863 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752214AbbCWVCq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Mar 2015 17:02:46 -0400
In-Reply-To: <20150323195401.GA863@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: James Hogan <james.hogan@imgtec.com>, linux-metag@vger.kernel.org, linux-next@vger.kernel.org, Abhilash Kesavan <a.kesavan@samsung.com>

--Sig_/N1daEiW6aeE+OeLM=ev4gav
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Mon, 23 Mar 2015 20:54:01 +0100 Greg Kroah-Hartman <gregkh@linuxfoundati=
on.org> wrote:
>
> On Mon, Mar 23, 2015 at 12:26:15PM +0000, James Hogan wrote:
> > When ioremap_wc() or ioremap_cached() are used without first including
> > asm/pgtable.h, the _PAGE_CACHEABLE or _PAGE_WR_COMBINE definitions
> > aren't found, resulting in build errors like the following (in
> > next-20150323 due to "lib: devres: add a helper function for
> > ioremap_wc"):
> >=20
> > lib/devres.c: In function =E2=80=98devm_ioremap_wc=E2=80=99:
> > lib/devres.c:91: error: =E2=80=98_PAGE_WR_COMBINE=E2=80=99 undeclared
> >=20
> > We can't easily include asm/pgtable.h in asm/io.h due to dependency
> > problems, so split out the _PAGE_* definitions from asm/pgtable.h into a
> > separate asm/pgtable-bits.h header (as a couple of other architectures
> > already do), and include that in io.h instead.
> >=20
> > Signed-off-by: James Hogan <james.hogan@imgtec.com>
> > Cc: linux-metag@vger.kernel.org
> > Cc: Abhilash Kesavan <a.kesavan@samsung.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> > GregKH: I can apply this patch to the metag tree for 4.0. However commit
> > 34644524bce9 "lib: devres: add a helper function for ioremap_wc" in
> > your char-misc-next branch in next-20150323 will still break the metag
> > build until the two changes merge. How do you want to handle that?
>=20
> I don't know, I can't pull that into 4.0-final as it's not 4.0-final
> material.  So there's nothing I can do from my end, sorry.

Am I missing something?  Why can't you just put that commit in your
char-misc-next branch along with the commit that causes the need for
that commit?  If James put it in it's own (non rebasing) branch, you
could even both merge it into your trees ...
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/N1daEiW6aeE+OeLM=ev4gav
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVEH9zAAoJEMDTa8Ir7ZwVDBsP/R9MaEso6XP8R7jRN9IfK2T5
fm8O7JkKzF9dGmc3uhW+xGROEb++iG/WOnCpoAb8MJ3z9vnBG4kMm+OtOm3zcWje
pRkZd37O+QcF2CSxmJRaPhbZxL13eHpQQf9537xeJlpShTEvrT41MXBoiJFCN7LR
1LVTQKx9W5lK5qXbocHRzLQmdmr4NiPSJO8sz3tLuUyYzCl5ukRpZx02d7OGewbL
4zizL3HN+Z84rcDYMgKmXpCcqqHbQO2Dd/Gv2MKlu28FGm/mRjmXWNE4TMLRvLJR
Wfs4IQ+mTV5xA7IQ5rau8mPBZzEjbWRqyEPKsCcrNHgmgSsmLwM8+gLKVxDzdG5n
S1/bOkPkAIMVmO4zjr9joqjhovdlZ1CJZI5RZJWVQjydHMAcltPSdKxAANyP2zOC
AIj0AG5Pa5ppJo3/Lh6HdpVCPWjFeG12nHvJkc8o+5HXK5eMQTK4YLoZcTN6qQYf
yNIlqBrkbUbTKV8/pKJFYM56nAszGLItbeHjrXjQnpk5AF0ltVlmsKaMIVUlLRLW
44o/Wz54YBTrYj12GHsVu4nfINkUua8Fyytanu6qGSjz6M64GTNen+Y4v8MRqwOf
Ql/HCldMBHDjPd/EVKOj1AypIMdKpwrN6Rw6w+9kI3WcnoVPAN9LLjcnS+VEmzmi
DWU7EN1N82Zr9JTuhq9k
=Qiel
-----END PGP SIGNATURE-----

--Sig_/N1daEiW6aeE+OeLM=ev4gav--
