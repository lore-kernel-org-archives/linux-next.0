From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the i7core_edac tree with Linus'
 tree
Date: Tue, 13 Oct 2009 22:53:04 +1100
Message-ID: <20091013225304.211dc64e.sfr@canb.auug.org.au>
References: <20091012142328.710881fe.sfr@canb.auug.org.au>
	<1209036982.100421255434636304.JavaMail.root@zmail05.collab.prod.int.phx2.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__13_Oct_2009_22_53_04_+1100_Fr+AjoaMiwNyZb+2"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1759597AbZJMLxr@vger.kernel.org>
In-Reply-To: <1209036982.100421255434636304.JavaMail.root@zmail05.collab.prod.int.phx2.redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@elte.hu>
List-Id: linux-next.vger.kernel.org

--Signature=_Tue__13_Oct_2009_22_53_04_+1100_Fr+AjoaMiwNyZb+2
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

On Tue, 13 Oct 2009 07:50:36 -0400 (EDT) Mauro Carvalho Chehab <mchehab@red=
hat.com> wrote:
>
> Thanks for letting me know. I've rebased it fixing the merge conflict. Fo=
r now,
> I just removed the call to edac_mce_parse() for Uncorrected Errors, since=
 I'll
> eventually replace that part of the code with something better.
>=20
> You should now be able to merge it without merging conflicts.

OK, thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__13_Oct_2009_22_53_04_+1100_Fr+AjoaMiwNyZb+2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkrUaiAACgkQjjKRsyhoI8ycIQCgnvYj6diFZAKYRQt1NvUuYbdr
EnoAoIOnW+cZWH1+XrR/qAdmJseQDAo9
=R4/V
-----END PGP SIGNATURE-----

--Signature=_Tue__13_Oct_2009_22_53_04_+1100_Fr+AjoaMiwNyZb+2--
