From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the vfs tree with the orangefs tree
Date: Sat, 4 May 2019 08:26:34 +1000
Message-ID: <20190504082634.6f78a061@canb.auug.org.au>
References: <20190503111510.6e866e3b@canb.auug.org.au>
        <CAOg9mSSGUiCoeecpdLs-8-TAMkVDubHK5jG87dGseV4gkGRiOQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/2IlGFZ=ogMBV774+e4=+kt8"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOg9mSSGUiCoeecpdLs-8-TAMkVDubHK5jG87dGseV4gkGRiOQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Marshall <hubcap@omnibond.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Martin Brandenburg <martin@omnibond.com>
List-Id: linux-next.vger.kernel.org

--Sig_/2IlGFZ=ogMBV774+e4=+kt8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On Fri, 3 May 2019 13:34:49 -0400 Mike Marshall <hubcap@omnibond.com> wrote:
>
> I noticed the conflict too when I added Al's patch series to the orangefs
> tree we have on next. I understood Linus to say he'd fix the conflict the
> way you did during the merge window. I guess that means you'll have to
> keep fixing it on next until then... I hate causing trouble, let me know =
if
> there's something different I should do to help...

Its all good.  I use "git rerere" which remembers the conflicts I have
fixed once and fixes them automatically the next time I do the same
merge.

--=20
Cheers,
Stephen Rothwell

--Sig_/2IlGFZ=ogMBV774+e4=+kt8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzMwBoACgkQAVBC80lX
0GztzAgAnZiH9dzA+04iUsXDwzAq2LEaP+Ssd4oLtGy7w2IiizC4jrg4/1F50ZxB
52hW5YkohsJfHj0/aSLlifXztvTnT4yIHcNDxcIFNkV3ISw2eVcfolJQL88I8Wcf
TEPf6jgUbcipodTfVK7kKVPweyMf0xCDxtZerivvs7BOzDgXlVVM774qmJAGeuJR
zb53TvWHtvCaiHeCdRZ4go5fhJhdzu/Gel42o4/gqHCiGzKzabVK7JpMxGFmUEV3
aAauzCc1QxZKe6V89AAr9YJYicKvHYc6KtKz7od9cym2aKIqTEMSwmrujsamNTVh
oulnM6F/2593DFbTEIgpHs8Yo5utpA==
=wZCW
-----END PGP SIGNATURE-----

--Sig_/2IlGFZ=ogMBV774+e4=+kt8--
