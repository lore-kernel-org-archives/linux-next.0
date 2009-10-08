From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the drm tree with Linus' tree
Date: Thu, 8 Oct 2009 13:35:29 +1100
Message-ID: <20091008133529.eda6d568.sfr@canb.auug.org.au>
References: <20091006132857.5bd1cc3a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__8_Oct_2009_13_35_29_+1100_2TqoJqJAu=dQykXL"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756996AbZJHCgP@vger.kernel.org>
In-Reply-To: <20091006132857.5bd1cc3a.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jerome Glisse <jglisse@redhat.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Thu__8_Oct_2009_13_35_29_+1100_2TqoJqJAu=dQykXL
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Tue, 6 Oct 2009 13:28:57 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the drm tree got a conflict in
> drivers/gpu/drm/radeon/radeon_device.c between commit
> 28d520433b6375740990ab99d69b0d0067fd656b ("drm/vgaarb: add VGA
> arbitration support to the drm and kms") from Linus' tree and commit
> 62a8ea3f7bb61e5f92db0a648b7cc566852c36ec ("drm/radeon/kms: Remove old
> init path as no hw use it anymore") from the drm tree.
>=20
> I have no idea how to reconcile these, so I have just used the version
> from the drm tree.  Please do the merge with Linus' tree and fix this up
> properly.  (There are also still conflicts in
> drivers/gpu/drm/radeon/radeon.h and drivers/gpu/drm/radeon/radeon_asic.h)

Got similar conflicts today ... any way you can sort this out, please?
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__8_Oct_2009_13_35_29_+1100_2TqoJqJAu=dQykXL
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkrNT/EACgkQjjKRsyhoI8yQIQCeIgAF4twy8z9PZ90RzU1MrSpS
uisAn1xJ6uICfGagknMevuLavPHZ2+qR
=1oLs
-----END PGP SIGNATURE-----

--Signature=_Thu__8_Oct_2009_13_35_29_+1100_2TqoJqJAu=dQykXL--
