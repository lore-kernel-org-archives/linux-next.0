From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the final tree
 (ux500-core tree related)
Date: Mon, 27 Dec 2010 16:20:21 +1100
Message-ID: <20101227162021.de3af7bc.sfr@canb.auug.org.au>
References: <20101223223634.8c92ef31.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__27_Dec_2010_16_20_21_+1100_PpYWu8E18C/d9Wql"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20101223223634.8c92ef31.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sundar Iyer <sundar.iyer@stericsson.com>, Dmitry Torokhov <dtor@mail.ru>
List-Id: linux-next.vger.kernel.org

--Signature=_Mon__27_Dec_2010_16_20_21_+1100_PpYWu8E18C/d9Wql
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 23 Dec 2010 22:36:34 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the final tree, today's linux-next build (powerpc allyescon=
fig)
> failed like this:
>=20
> drivers/input/keyboard/tc3589x-keypad.c: In function 'tc3589x_keypad_enab=
le':
> drivers/input/keyboard/tc3589x-keypad.c:239: error: 'keypad' undeclared (=
first use in this function)
> drivers/input/keyboard/tc3589x-keypad.c: In function 'tc3589x_keypad_disa=
ble':
> drivers/input/keyboard/tc3589x-keypad.c:268: error: 'keypad' undeclared (=
first use in this function)
> drivers/input/keyboard/tc3589x-keypad.c: At top level:
> drivers/input/keyboard/tc3589x-keypad.c:448: error: expected ',' or ';' b=
efore 'static'
> drivers/input/keyboard/tc3589x-keypad.c: In function 'tc3589x_keypad_init=
':
> drivers/input/keyboard/tc3589x-keypad.c:460: error: 'tc3589x_keypad_drive=
r' undeclared (first use in this function)
> drivers/input/keyboard/tc3589x-keypad.c: In function 'tc3589x_keypad_exit=
':
> drivers/input/keyboard/tc3589x-keypad.c:466: error: 'tc3589x_keypad_drive=
r' undeclared (first use in this function)
> drivers/input/keyboard/tc3589x-keypad.c:466: warning: 'return' with a val=
ue, in function returning void
>=20
> Caused by commit 1967733650dac41c93954a187246c91430c4a94f
> ("input/tc3589x: add tc3589x keypad support").

This error is still there, so I reverted the above commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__27_Dec_2010_16_20_21_+1100_PpYWu8E18C/d9Wql
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJNGCIVAAoJEDMEi1NhKgbsFdkH/ie7Rh5QyRIFVZykxYzAstcf
BxMNRbGTbZ0+kA30aEXjtQ6z6pdwK74hHw9mhp7PThMzIvRxtApw6wJDZ637maqQ
D5LerzLnB/7ub6uX7vd1VOwvRR/jLLFciDB4tEygH9INro9InM2Ox3ZnseL9fEXC
n4oUPvKARWgKntiJ/myUrWlX+x/2CO73/CLTP4fGTgNIlBlUksEL+kopB7JfAsgQ
0AMSPLb5mKvDEO4ky+AVNrguHLKFwNHJSow73gHaLgrdYxxNEJp0o22lLLfRTY07
aiV3ucjw7ZlUjxSsJ7cE4drZm5BiyMjBFVs9/UWZyOuK2U/TqD6/DORnUWk3H3g=
=a1Gg
-----END PGP SIGNATURE-----

--Signature=_Mon__27_Dec_2010_16_20_21_+1100_PpYWu8E18C/d9Wql--
