From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the f2fs tree
Date: Tue, 27 Nov 2018 09:17:47 +1100
Message-ID: <20181127091747.4830d123@canb.auug.org.au>
References: <20181126111933.1b0fb324@canb.auug.org.au>
        <20181126215924.GA55960@jaegeuk-macbookpro.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1CNKR_JuZ7EXqjn9Aby.ik6"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181126215924.GA55960@jaegeuk-macbookpro.roam.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Kees Cook <keescook@google.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-Id: linux-next.vger.kernel.org

--Sig_/1CNKR_JuZ7EXqjn9Aby.ik6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jaegeuk,

On Mon, 26 Nov 2018 13:59:24 -0800 Jaegeuk Kim <jaegeuk@kernel.org> wrote:
>
> On 11/26, Stephen Rothwell wrote:
> >=20
> > After merging the f2fs tree, today's linux-next build
> > (x86_64_allmodconfig) produced this warning:
> >=20
> > In file included from fs/f2fs/dir.c:11:
> > fs/f2fs/f2fs.h: In function '__mark_inode_dirty_flag':
> > fs/f2fs/f2fs.h:2388:6: warning: this statement may fall through [-Wimpl=
icit-fallthrough=3D]
> >    if (set)
> >       ^
> > fs/f2fs/f2fs.h:2390:2: note: here
> >   case FI_DATA_EXIST:
> >   ^~~~
> >=20
> > Exposed by my use of -Wimplicit-fallthrough
> >=20
> > I am not sure why this has turned up now (as opposed to earlier today).=
 =20
>=20
> The above change had been there for a long time, as an intended behavior.

Yeah, it popped up due to line number changes in that file and the way
I was filtering new warnings.

> Hmm, I'm not sure how to avoid this.

if you add a comment
	/* fall through */
at the point the fall through occurs, then the warning is suppressed
(and it documents that it is deliberate).

--=20
Cheers,
Stephen Rothwell

--Sig_/1CNKR_JuZ7EXqjn9Aby.ik6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlv8cQsACgkQAVBC80lX
0GxO+Qf9G6YnjUx/tFlb5nlzFmjONkb4fSe4BTc2s3LWhClbBmvIJ1ZwAy5xV52R
uqL2orFeRi0I2VfXYhAhspGf4a2xaQC0bD9QMfiWKfYq+CDHb+lyuZzP69ZL7uFS
BvoK3gXsFgnQWRn5VjOLCTArqN17RouqE1l4iPxbHOpNLybnXwpBL0El//38bYEd
/CDHPGVg7rNHG1cV07v7uaI5W3nt7PTlRAaSi6gckGqxkRfcH0IM+DoCYK35ys9d
OiFQhx8oglPj1YQ2mg1ihMOXWmj3eIU5lTBKCf8P3pk9uUKRgzH9pZZqSHWp3wqC
A2ssZNP5pFRsVU/Rkz9ycV6Jy5QtEA==
=I5ve
-----END PGP SIGNATURE-----

--Sig_/1CNKR_JuZ7EXqjn9Aby.ik6--
