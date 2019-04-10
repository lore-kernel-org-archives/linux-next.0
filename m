From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the scsi-mkp tree
Date: Wed, 10 Apr 2019 14:57:34 +1000
Message-ID: <20190410145734.150e881c@canb.auug.org.au>
References: <20190409162749.7eb6656f@canb.auug.org.au>
        <20190410112138.178aa7bd@canb.auug.org.au>
        <yq1tvf6myp6.fsf@oracle.com>
        <1554869059.3208.0.camel@HansenPartnership.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Wbmrv9PJSc+XgRhNyovFeHs"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554869059.3208.0.camel@HansenPartnership.com>
Sender: linux-kernel-owner@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bart Van Assche <bvanassche@acm.org>
List-Id: linux-next.vger.kernel.org

--Sig_/Wbmrv9PJSc+XgRhNyovFeHs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 10 Apr 2019 06:04:19 +0200 James Bottomley <James.Bottomley@HansenP=
artnership.com> wrote:
>
> On Tue, 2019-04-09 at 21:33 -0400, Martin K. Petersen wrote:
> >  =20
> > > > I have reverted that commit for today. =20
> > >=20
> > > This has now migrated to the scsi tree. =20
> >=20
> > I have a fix in my tree but I haven't pushed it yet. =20
>=20
> It's upstream in both trees now.

Thanks, it'll be in -next tomorrow.

--=20
Cheers,
Stephen Rothwell

--Sig_/Wbmrv9PJSc+XgRhNyovFeHs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlytd74ACgkQAVBC80lX
0GwAxQf9G/Oe1vx4RmBGQbAqqUzUf9qqKv56OZYl2ZlDh8RUkobpvr4IhSDcRpiQ
IYIGdZpmIhMkJY8J5775ZHl0VOazURYYoF2QfHCR4OUaj0HIrDinHHvk8a0XX/7C
Gxs46pST9T4OnZ8NvdBpw71zZRVRtQefJBBSZCYsQuy8kIwt7+4YGciUMWFEX4Yn
g+Kp8LCB7g3Oh4JzMQT2sj5SlP6kS01ysKS5qJFhMMn3jFH0iNZw8u8fek/pnwwu
F5klR+nqHBHdK45c/vYT1efwrfHPTZnOaaAyb7H4yGPYdClCHoRlhJRJvROg8jtz
sJm69uav7e3I9EOaq/KdvNWltzxwVQ==
=g+UW
-----END PGP SIGNATURE-----

--Sig_/Wbmrv9PJSc+XgRhNyovFeHs--
