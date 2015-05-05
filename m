From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Coresight tree to -next please
Date: Wed, 6 May 2015 00:27:03 +1000
Message-ID: <20150506002703.3fa4618f@canb.auug.org.au>
References: <CANLsYky=XeD6ednBkgv4Qe3=a7RUa6bW9-9X2DKKCmUXUwKsyA@mail.gmail.com>
	<20150505104834.47f528ba@canb.auug.org.au>
	<CANLsYkyjBEGJ=L52GWqUPeY5egsceK34phSdFcaoLUxZxxnXfA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/SZ9oH4aSaGzSMe.qeckUGEp"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59781 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S2993177AbbEEO1N (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 5 May 2015 10:27:13 -0400
In-Reply-To: <CANLsYkyjBEGJ=L52GWqUPeY5egsceK34phSdFcaoLUxZxxnXfA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-next@vger.kernel.org

--Sig_/SZ9oH4aSaGzSMe.qeckUGEp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

On Tue, 5 May 2015 08:22:20 -0600 Mathieu Poirier <mathieu.poirier@linaro.o=
rg> wrote:
>
> On 4 May 2015 at 18:48, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > I used git://git.linaro.org/kernel/coresight.git, and added it from
> > today.
>=20
> Perfect - did you use the "next" branch?

Yes.

> > Is this tree to be submitted directly to Linus, or via some
> > other tree? (just gives me a clue as to where to positiion it in the
> > merge list)
>=20
> I take patches in my next tree and about twice per cycle will send a
> tally to GKH for inclusion in his char-misc-next branch.  As such when
> he takes my patches there should be some duplication between the
> coresight next branch and his char-misc-next.  Do you see this as a
> problem?

It can cause conflicts if you send patches to Greg and keep them in
your tree (if there are further changes to the same files in either
tree).  Much better would be to ask him to pull your tree (or a subset)
that way you have the same commits (as opposed to patches) in both
trees.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/SZ9oH4aSaGzSMe.qeckUGEp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVSNM9AAoJEMDTa8Ir7ZwVSGkP/ipbITL3oFdRpKGUa9DOctmn
hmYwyD567T1FkezdEWx0lWHO1/BAR+Nnf2S8b5X25t7oDcgGuaQlyBBBmDZ3kPwK
/uo6T05S8XmzvPtpiqx3q1xAI30I4a4zVueFdQKt5fl0akn1sOjAJETZKWcHzpEy
QWkauwoH2wwJC1f4hW0MGnfJl8fvUeEhVQKHrIpXkKF0aBf+vpoDH9t8nRAEEJqG
47cuKhL1xTwM+YSBWRkwKJsw2RUgd/N8g5GGXYkUcCZdEtVNaa2/5aUjbflNR/y9
RE5q8dWrMEVA2z1BVzBPVW2g9UcTtXQuEr76wUtz0ubLvLdFWxfXG6tncCGdY5PA
qg474VtsQV+t0gGmOn61+Nd5JdTV2yiIEjwF7e3gRSP+jJk62B7fpV7/mwsfTOw0
aTsD4ZNtJRz0wqG7JUiQbKgWfrSYSsns4JIndKqMjqz2g3lzr/O9R3yywZKxhsT4
CHJVto6pIfrqeY28I1y3oe+m8nAh+ZgPtgNbzNfrzYrnWkBKcSvMg27k7fjmR2xQ
+TaMReZGydT0VrgEI01BMCWuciOiL8arK4Z/OE4jQwJ5OoQdGZNxn0Iee5JF8FGP
C/6S6U3fY2LIsx/D5Pra3LYl6SDkYeV9wCgl8PBRa3F2yt7VM1dXeHyPiI+A1D4a
VsSkDIaytsC1IohbBfkv
=z12h
-----END PGP SIGNATURE-----

--Sig_/SZ9oH4aSaGzSMe.qeckUGEp--
