From: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH -next] metag: Fix ioremap_wc/ioremap_cached build errors
Date: Tue, 24 Mar 2015 15:16:46 +0000
Message-ID: <55117FDE.1030904@imgtec.com>
References: <1427113575-29222-1-git-send-email-james.hogan@imgtec.com>	<20150323195401.GA863@kroah.com> <20150324080238.222953d5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="UIX44Nj0TmReiK9vL6NboXwJE1VtLVcm9"
Return-path: <linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150324080238.222953d5-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Sender: linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-next.vger.kernel.org

--UIX44Nj0TmReiK9vL6NboXwJE1VtLVcm9
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 23/03/15 21:02, Stephen Rothwell wrote:
> Hi Greg,
>=20
> On Mon, 23 Mar 2015 20:54:01 +0100 Greg Kroah-Hartman <gregkh@linuxfoun=
dation.org> wrote:
>>
>> On Mon, Mar 23, 2015 at 12:26:15PM +0000, James Hogan wrote:
>>> When ioremap_wc() or ioremap_cached() are used without first includin=
g
>>> asm/pgtable.h, the _PAGE_CACHEABLE or _PAGE_WR_COMBINE definitions
>>> aren't found, resulting in build errors like the following (in
>>> next-20150323 due to "lib: devres: add a helper function for
>>> ioremap_wc"):
>>>
>>> lib/devres.c: In function =E2=80=98devm_ioremap_wc=E2=80=99:
>>> lib/devres.c:91: error: =E2=80=98_PAGE_WR_COMBINE=E2=80=99 undeclared=

>>>
>>> We can't easily include asm/pgtable.h in asm/io.h due to dependency
>>> problems, so split out the _PAGE_* definitions from asm/pgtable.h int=
o a
>>> separate asm/pgtable-bits.h header (as a couple of other architecture=
s
>>> already do), and include that in io.h instead.
>>>
>>> Signed-off-by: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
>>> Cc: linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> Cc: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>> Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
>>> ---
>>> GregKH: I can apply this patch to the metag tree for 4.0. However com=
mit
>>> 34644524bce9 "lib: devres: add a helper function for ioremap_wc" in
>>> your char-misc-next branch in next-20150323 will still break the meta=
g
>>> build until the two changes merge. How do you want to handle that?
>>
>> I don't know, I can't pull that into 4.0-final as it's not 4.0-final
>> material.  So there's nothing I can do from my end, sorry.
>=20
> Am I missing something?  Why can't you just put that commit in your
> char-misc-next branch along with the commit that causes the need for
> that commit?  If James put it in it's own (non rebasing) branch, you
> could even both merge it into your trees ...

Greg: I've pushed a fix_ioremap_wc branch to:
git://git.kernel.org/pub/scm/linux/kernel/git/jhogan/metag.git

based on v4.0-rc3, with just this patch. Feel free to merge it if you're
happy to do so.

Cheers
James


--UIX44Nj0TmReiK9vL6NboXwJE1VtLVcm9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJVEX/eAAoJEGwLaZPeOHZ64ZYP/RfOtACPxD++2Gi9qhegu70z
GUslbU4IC13mAkXCan3cEdDL0jIaC5fSmpKS9WKJxxtSxy93eQK02zi91lI8Z6Qw
7zAxeiwTB6eB6pymwvwdKXO3kgHxx6PoYd3+s0ZumceBgzFjlPrxoctbXLCKtFk/
HGD4f3x3a9PRPfCHSiwQK6OrVKx4G2n+UIi5djDLfF4ntXQFpv3P3LD8vFKQL4un
bUDtwSHTkEEpNyOaRvwaIYj7uF4zpgnA2sWBcGYp1dpU5Et1V9x1Affyhg6sSef5
EuQ9PRHOHTC/CP6KBxRVXGKU8TiFtHG4gpmGVwf6fkMGxmaWwknn+tK8M/iwX1uW
xra97LiUOoSsMsbtu4TctJkO7CTE/suDRewsSrUuj7ALjntambt47py9FcrSq/tn
0tdkutope4ulVLd4FfD4Icd8KNdubZ4Q8PckaTqKflelJMsVQbz5+p3Gqm/GkdBP
95fX1zU0FlwU7TiFMuJHRGYso/HPt6Qmt8rr4ew6v0RCvsIXD6FezpdHUfyvNqiC
1VJ3z3qLebl5b8zM0DccfUjjstHMn6t2RRefVwWxHqM+WwBgnG+fS9J/uxeC8LQM
Y4fF8kwgsMfL6Cye1MwbJIA3PV9TBL0qfm1fuzDzduSpKfCeSN817a6O3qO2foLq
MI7GXsADEqXazNR5WkO7
=4MOH
-----END PGP SIGNATURE-----

--UIX44Nj0TmReiK9vL6NboXwJE1VtLVcm9--
--
To unsubscribe from this list: send the line "unsubscribe linux-metag" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
