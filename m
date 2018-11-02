From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Nov 2
Date: Sat, 3 Nov 2018 00:22:18 +1100
Message-ID: <20181103002218.3bd015b3@canb.auug.org.au>
References: <20181102143018.09feb051@canb.auug.org.au>
        <CANiq72m65bQZefAoFF5dTUB-rPzm4vofZFnDn0nYBG3MsGrjZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/KVQ2XWkcfW3Bxgio75KWddp"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANiq72m65bQZefAoFF5dTUB-rPzm4vofZFnDn0nYBG3MsGrjZg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/KVQ2XWkcfW3Bxgio75KWddp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Miguel,

On Fri, 2 Nov 2018 11:44:07 +0100 Miguel Ojeda <miguel.ojeda.sandonis@gmail=
.com> wrote:
>
> On Fri, Nov 2, 2018 at 4:33 AM Stephen Rothwell <sfr@canb.auug.org.au> wr=
ote:
> >
> > Please do not add any v4.21/v5.1 code to your linux-next included trees
> > until after the merge window closes. =20
>=20
> Is it OK to move forward the branch up to the point where it landed in
> mainline, no? What about changes for this release that will be sent
> for -rc2, -rc3... etc.?

Its always OK (and actually useful) to move your branch head up to
where Linus merged it (this is usually a fast forward anyway) since
that doesn't add any new code to linux-next to conflict with code that
is still pending to be merged by Linus.

Also, adding bug fixes is always fine.

I just want to avoid getting conflicts in linux-next between code
that Linus will merge during this merge window and new code destined
for the next merge window.
--=20
Cheers,
Stephen Rothwell

--Sig_/KVQ2XWkcfW3Bxgio75KWddp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvcT4oACgkQAVBC80lX
0GwE/Qf/daFJ5clgwmnwyYGxELmK/o0SXf4y4lrmjbmt7XI32EUZyCa/py4cAbLE
cq0rhecb2HbmBk+QQLGNC3R0UBkO/g9yRrJ7e8zDNSoMJCFNBZt3BMR4gGLSWS79
DlOcVGP8abcdxtO1n3SB2FZKu6ekqIGizFzqxqJo4tCEb655YHnsWoZqtjY94ell
BjRGbNfvwqKOh8+ZLn/3fcPpwUTrIK4fD8Cea/ZdjGHpj6+GkFHc8tNgKOg+n8kL
bu5xEZxOCcjkiD0Q1SsDFRwD88WO3oSKGRKczi0PLiNgGkNuCHEostdWHUuRCBGt
TJrxAFEYjaRjCMQ3BIAuBq+o18pKzQ==
=sSum
-----END PGP SIGNATURE-----

--Sig_/KVQ2XWkcfW3Bxgio75KWddp--
