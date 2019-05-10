From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the amdgpu tree
Date: Fri, 10 May 2019 10:59:13 +1000
Message-ID: <20190510105913.357c15e3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/wjdZqcrecLj/0QnYLKM3.fn"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jonathan Kim <jonathan.kim@amd.com>
List-Id: linux-next.vger.kernel.org

--Sig_/wjdZqcrecLj/0QnYLKM3.fn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

In file included from drivers/gpu/drm/amd/amdgpu/df_v3_6.c:23:
drivers/gpu/drm/amd/amdgpu/df_v3_6.c: In function 'df_v3_6_pmc_start':
drivers/gpu/drm/amd/amdgpu/amdgpu.h:1010:29: warning: 'lo_val' may be used =
uninitialized in this function [-Wmaybe-uninitialized]
 #define WREG32_PCIE(reg, v) adev->pcie_wreg(adev, (reg), (v))
                             ^~~~
drivers/gpu/drm/amd/amdgpu/df_v3_6.c:334:39: note: 'lo_val' was declared he=
re
  uint32_t lo_base_addr, hi_base_addr, lo_val, hi_val;
                                       ^~~~~~

Introduced by commit

  a6ac0b44bab9 ("drm/amdgpu: add df perfmon regs and funcs for xgmi")

--=20
Cheers,
Stephen Rothwell

--Sig_/wjdZqcrecLj/0QnYLKM3.fn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzUzOEACgkQAVBC80lX
0Gw1TAf/ai35uQnY98yR9OeNyjhZGsvBCLPPvchvu4uUkyfQC8hcfPNMK6KGUB9f
wc3ncmFVMHkawM0qXR34LZk3yvIXABUoUjT3BNuEgVbGbufSzT5f99P8eWD+MYxv
Bjit6j/peEdr1C0AUysOnqfkdse3Zj4mrnbGIXEzmKYr1fwCwsQaEHxjTt7zFTdf
TQg8A5zoGUOQ0ySa4BiukWEGKfIzdjER1LC18mn5ZhwOYtjCfOg3ZI75XeM4d75Q
TO2iH+YVL9ldjkKM44aDLjuWiwawzeGqs85yuMMCgUDFWNfLsGFfw45gKV2j+ztD
OQqEIZzDk2BghSrbRMXcp4SftkiICg==
=UIhV
-----END PGP SIGNATURE-----

--Sig_/wjdZqcrecLj/0QnYLKM3.fn--
