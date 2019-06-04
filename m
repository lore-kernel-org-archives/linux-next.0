From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [POWERPC][next-20190603] Boot failure : Kernel BUG at
 mm/vmalloc.c:470
Date: Tue, 4 Jun 2019 20:29:18 +1000
Message-ID: <20190604202918.17a1e466@canb.auug.org.au>
References: <9F9C0085-F8A4-4B66-802B-382119E34DF5@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/n.aGLPJk/wsZDAk8OiMeL=b"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9F9C0085-F8A4-4B66-802B-382119E34DF5@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sachin Sant <sachinp@linux.vnet.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org, linux-mm@kvack.org, "Uladzislau Rezki (Sony)" <urezki@gmail.com>, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Sig_/n.aGLPJk/wsZDAk8OiMeL=b
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Sachin,

On Tue, 4 Jun 2019 14:45:43 +0530 Sachin Sant <sachinp@linux.vnet.ibm.com> =
wrote:
>
> While booting linux-next [next-20190603] on a POWER9 LPAR following
> BUG is encountered and the boot fails.
>=20
> If I revert the following 2 patches I no longer see this BUG message
>=20
> 07031d37b2f9 ( mm/vmalloc.c: switch to WARN_ON() and move it under unlink=
_va() )
> 728e0fbf263e ( mm/vmalloc.c: get rid of one single unlink_va() when merge=
 )

This latter patch has been fixed in today's linux-next ...

--=20
Cheers,
Stephen Rothwell

--Sig_/n.aGLPJk/wsZDAk8OiMeL=b
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlz2R/4ACgkQAVBC80lX
0GxNXwf/fJ0Go1oz1h68yR3tc7OY90gu/bZ5Klbs+GSN973ZKndwaWH4q79zzjie
LYHNzKdPpxDLckq08NQSFajRzh6gIvzI+qeaLHjss93qbxpOhzLRjI7UQsD+isR2
S2HsUU7Tn1hAsVZhbZp3McmIOPIRet/p6jA0K43BH+eeXrcT7R6TOTNkiIV1X1/o
AGsvFmJ80rVbJ/q4mCeC4q5Dz0BrTnCRKhHXChocYDPqSRvjSrwfnI+Uqk9ywHuD
TIMSsoc1JR/xDGmxnoR8hW91OkQkQ5q8N4OSQSxEqS42HSQkLShxyyHiCBQDQa3N
8jYQuik/cymkDKNlptMJG/Ft6lrldA==
=JezC
-----END PGP SIGNATURE-----

--Sig_/n.aGLPJk/wsZDAk8OiMeL=b--
