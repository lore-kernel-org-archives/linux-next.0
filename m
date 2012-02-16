From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Build fail in hugetlbpage.c with linux-next and
 mpc85xx_defconfig
Date: Thu, 16 Feb 2012 11:15:13 +1100
Message-ID: <20120216111513.918494b07a5331eabe3d32ac@canb.auug.org.au>
References: <14174.1329347321@neuling.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__16_Feb_2012_11_15_13_+1100_dv05nZy3IL++H+4Z"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:54028 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756519Ab2BPAP0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 15 Feb 2012 19:15:26 -0500
In-Reply-To: <14174.1329347321@neuling.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Michael Neuling <mikey@neuling.org>, Pawel Moll <pawel.moll@arm.com>, galak@kernel.crashing.org, Becky Bruce <beckyb@kernel.crashing.org>, linux-next@vger.kernel.org, linuxppc-dev@ozlabs.org, McClintock Matthew-B29882 <B29882@freescale.com>

--Signature=_Thu__16_Feb_2012_11_15_13_+1100_dv05nZy3IL++H+4Z
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

On Thu, 16 Feb 2012 10:08:41 +1100 Michael Neuling <mikey@neuling.org> wrot=
e:
>
> This has been broken in linux-next for a while.  Looks like a merge
> issue but you were the last to touch it...
>=20
> arch/powerpc/mm/hugetlbpage.c: In function 'reserve_hugetlb_gpages':
> arch/powerpc/mm/hugetlbpage.c:313: error: passing argument 5 of 'parse_ar=
gs' makes integer from pointer without a cast
> include/linux/moduleparam.h:317: note: expected 's16' but argument is of =
type 'int (*)(char *, char *)'
> arch/powerpc/mm/hugetlbpage.c:313: error: too few arguments to function '=
parse_args'

This was broken by commit b8076966e8e1 ("params: <level>_initcall-like
kernel parameters") from the rr tree which changed the parse_args() API wit=
hout fixing all
the callers ....

Please add a fix ...

Grep is your friend:

$ git grep -l '\<parse_args(' v3.3-rc1=20
v3.3-rc1:Documentation/target/tcm_mod_builder.py
v3.3-rc1:arch/powerpc/mm/hugetlbpage.c
v3.3-rc1:arch/x86/tools/insn_sanity.c
v3.3-rc1:arch/x86/tools/test_get_len.c
v3.3-rc1:include/linux/moduleparam.h
v3.3-rc1:init/main.c
v3.3-rc1:kernel/module.c
v3.3-rc1:kernel/params.c

(The Documentation and x86 ones are a false positives, the powerpc one is r=
eal)
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Thu__16_Feb_2012_11_15_13_+1100_dv05nZy3IL++H+4Z
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJPPEqRAAoJEECxmPOUX5FEmsEP/35Ra0ph/ST967T5JpYRoLsN
Js0Irr6H8VfTHUzSeyNRCfe20VroXuqw91bsqBtfBEggKeyTxpE7N9T/P4uWQ1kF
wYRM/+kOKS4rhpfjTyHi2Ykykghx4M3X21VjUWd6I4scWvDCKxjnKvolGYJs45ax
OADBrYtY8TAIng1c1Mm39PcuDviYAVHcJeaYYEhYc3QjGx4ggNjPv5eWDqsGiy8Q
yPLdXHPHPC83bOQwE7OjvWtt8/sshSKQIyJgDE945rthlYzvdsMux8Z/qOePXVSP
M/9hCQwi7ly0t8bbUsnu2rxmmuxUGGzsifjqUfU8hdSDpA5vfNJkGlbDvlqGkdL8
RBgNXm7NvATQJ5d03/MiZu18uv+i77yFd79fh/t3N57gdbwcNmrr8JCs+YM0zTC8
dqfbVuA/5DFbvXO4CehfsUIc2EOnVBNGppVcV4cRJjaStN4YV96KGQ3rn/wjbR1e
yCmqbc4laqOeDuysoY2xfXVwkJd5XnCax7AzGzbup5HZBfktbvIF26+JJUPDf+Ws
Plp0+UpX5Vgd6TX2cMoP7GuMp+6OGUsVqwbzFUMjKehIAYU2hxbFGUaZXLNtiFUK
0ioJdxOuen3jrejfjGnE//6s23VvBIGLUpb0Zfss8F9ZT2j1I2gMG0OQR03koZwt
P6hIdjdfCZ8JHHpWu1gi
=LwsZ
-----END PGP SIGNATURE-----

--Signature=_Thu__16_Feb_2012_11_15_13_+1100_dv05nZy3IL++H+4Z--
