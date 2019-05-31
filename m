From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
Date: Fri, 31 May 2019 11:27:52 +1000
Message-ID: <20190531112752.7f3ca857@canb.auug.org.au>
References: <20190510105913.357c15e3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/SgjzKMuKXe4areELDBT3g40"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190510105913.357c15e3@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>
Cc: Alex Deucher <alexdeucher@gmail.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jonathan Kim <jonathan.kim@amd.com>
List-Id: linux-next.vger.kernel.org

--Sig_/SgjzKMuKXe4areELDBT3g40
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 10 May 2019 10:59:13 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the amdgpu tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>=20
> In file included from drivers/gpu/drm/amd/amdgpu/df_v3_6.c:23:
> drivers/gpu/drm/amd/amdgpu/df_v3_6.c: In function 'df_v3_6_pmc_start':
> drivers/gpu/drm/amd/amdgpu/amdgpu.h:1010:29: warning: 'lo_val' may be use=
d uninitialized in this function [-Wmaybe-uninitialized]
>  #define WREG32_PCIE(reg, v) adev->pcie_wreg(adev, (reg), (v))
>                              ^~~~
> drivers/gpu/drm/amd/amdgpu/df_v3_6.c:334:39: note: 'lo_val' was declared =
here
>   uint32_t lo_base_addr, hi_base_addr, lo_val, hi_val;
>                                        ^~~~~~
>=20
> Introduced by commit
>=20
>   a6ac0b44bab9 ("drm/amdgpu: add df perfmon regs and funcs for xgmi")

I now get this warning after merging the drm tree ...

--=20
Cheers,
Stephen Rothwell

--Sig_/SgjzKMuKXe4areELDBT3g40
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzwgxgACgkQAVBC80lX
0Gx1DAf+Pbrqe4MgGO3fK7UnBMZtCpEGsyMA27mNVq3S6DRwluPK0S8cnySYNENL
2xiTU6Jwtzh89REYEtpgDpHXYMZDuB4iZWMr9gm3gUXFrtjKJg4DNRy8J6NOIthJ
IQSaW6zDPtdglhTi/w83FCDIiYljb3nqVpTjCn2Rh38SyQXmJOlGS/QeW/NgaH6y
exnRzZDA/UmVffKoEWf9B3wyLpfagRaRoTecSiprDp+Ka7NwIFrUiqdHOlj5FItf
mKLq8Lzz/wPlZDLGA5CEK9Rvc1t28H+NSFuLddLhnAs6TVjHWQzGW5z7uyGcuX+1
2dGlLN50+N0zzj4YD1DA0/sG4hVzAw==
=70m1
-----END PGP SIGNATURE-----

--Sig_/SgjzKMuKXe4areELDBT3g40--
