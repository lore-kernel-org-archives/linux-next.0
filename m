From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: mmotm 2014-03-03-15-24 uploaded
Date: Tue, 4 Mar 2014 11:36:10 +1100
Message-ID: <20140304113610.a033faa8e5d3afeb38f7ac79@canb.auug.org.au>
References: <20140303232530.2AC4131C2A3@corp2gmr1-1.hot.corp.google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__4_Mar_2014_11_36_10_+1100_NPBWuroT=CRDMbzy"
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <20140303232530.2AC4131C2A3@corp2gmr1-1.hot.corp.google.com>
Sender: owner-linux-mm@kvack.org
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: linux-next.vger.kernel.org

--Signature=_Tue__4_Mar_2014_11_36_10_+1100_NPBWuroT=CRDMbzy
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Mon, 03 Mar 2014 15:25:29 -0800 akpm@linux-foundation.org wrote:
>
> The mm-of-the-moment snapshot 2014-03-03-15-24 has been uploaded to
>=20
>    http://www.ozlabs.org/~akpm/mmotm/

> * kconfig-make-allnoconfig-disable-options-behind-embedded-and-expert.pat=
ch

I am carrying 5 fix patches for the above patch (they need to go before
or as part of the above patch).

ppc_Make_PPC_BOOK3S_64_select_IRQ_WORK.patch
ia64__select_CONFIG_TTY_for_use_of_tty_write_message_in_unaligned.patch
s390__select_CONFIG_TTY_for_use_of_tty_in_unconditional_keyboard_driver.pat=
ch
cris__Make_ETRAX_ARCH_V10_select_TTY_for_use_in_debugport.patch
cris__cpuinfo_op_should_depend_on_CONFIG_PROC_FS.patch

I can send them to you if you like, but I am pretty sure you were cc'd on
all of them.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Tue__4_Mar_2014_11_36_10_+1100_NPBWuroT=CRDMbzy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJTFR/+AAoJEMDTa8Ir7ZwVjUYP/A6vUrwvbbNoLN/CzmxSqY3u
NdZAPYzUl3Avk7HZIyDm+m1a5yIYUGc99jChz0FAUb3nilTiVE3NNZszs/Y8KQcW
u0kZ2mkLsQpIGAROu8DarBQXyPzajWW69JqgHgxris026LpbS+E5dBPH3aG6SuTa
+YCQAK7PzA9HTniHCyj7XvMKgZhevKHYZD9/lx7d07C51+fZO20hGPlSIqX692u4
UOBbn1O0d2YVKjnXjFjp9lDqKPq3rfgHFfpIcCaCF9sCrzZDITuQYZDYZmCvWIVF
VeLiJ03GYwI25PN8kE2lSj2egtL9/mtfD9H+BnZKXu+vStZXakwSFNPmCEcghjZf
oGiBvnEjQM6pqT7pcExhzUyaq52armU7VvJLrhApRgONPjQnThhwzqZZWb25ZwcJ
uBf+XrGtGB3wXgFMXPJXCYaxpGK4axnBlCO2xpr/8svTDGiXRWSFm8eiN6lQql2y
4zSiIus+fytYKFD8zjqWpjfU00snMUsLDL+YyMZXIWNFrQ40v3gMIL1+4RnziikL
n7toh02e7LLylAubXuy9ubYSOPx2hkt7XBHl2WaVwWXKR3kjtyj6rzBPF658u844
IzjvA956YhRvKVKILHX5Q2b/NJ7dLKEtGZWDC5V/+4KSAs2UwGj7ah2l/EK61W5g
H3b8SUmRepILRiF6W/K1
=8e05
-----END PGP SIGNATURE-----

--Signature=_Tue__4_Mar_2014_11_36_10_+1100_NPBWuroT=CRDMbzy--

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
