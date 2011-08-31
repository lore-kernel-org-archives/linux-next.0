From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Removing msm tree from direct linux-next
Date: Wed, 31 Aug 2011 10:35:32 +1000
Message-ID: <20110831103532.0aa0fb4ba8bc446c19b205a8@canb.auug.org.au>
References: <20110830225433.GA7138@huya.qualcomm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__31_Aug_2011_10_35_32_+1000_T2+SoEsV1najs7i2"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110830225433.GA7138@huya.qualcomm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Brown <davidb@codeaurora.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__31_Aug_2011_10_35_32_+1000_T2+SoEsV1najs7i2
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Tue, 30 Aug 2011 15:54:33 -0700 David Brown <davidb@codeaurora.org> wrot=
e:
>
> Stephen, now that the MSM tree is going through Arnd's ARM SOC tree,
> it doesn't need to be pulled directly into linux-next.  You can remove
> this tree:
>=20
> msm git://codeaurora.org/quic/kernel/davidb/linux-msm.git#for-next

OK, I have removed it.  Thanks for letting me know.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__31_Aug_2011_10_35_32_+1000_T2+SoEsV1najs7i2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOXYHUAAoJEDMEi1NhKgbsb7cH/0qcavoZhqtqcLNhF8RxAy1B
r0cPf4p1ScpHZur9qHt8S8NnkUVXISgw9P69kHf51rHIKn6E0q0Tr3/72LPY/6ad
Jb08+b2xVZ026zJ00+Ig/6ui5ifo0pcUb6mzEIdXiwhLlYjnDeN68fX12qh2ogm0
ZpW3CdKQz0qzzxpJCTQNR6l8mhs9ukgXREv+J1UHktUD9vlWPTznRlQnGieetEyx
tbivdDqNVqFV/1NxnnkGyFIbAXxGFyKgXUQKRkuGqokykb+7CgzdhTQ4OLX4e7mk
lEfJqXrAOtYcd1tVRvWVVUu56g6d9ot1TWNeNTI2WtV/UCXASne+XaArfQE6+7c=
=oEhO
-----END PGP SIGNATURE-----

--Signature=_Wed__31_Aug_2011_10_35_32_+1000_T2+SoEsV1najs7i2--
