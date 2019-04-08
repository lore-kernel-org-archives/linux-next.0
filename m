From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the nvdimm-fixes tree
Date: Mon, 8 Apr 2019 15:52:57 +1000
Message-ID: <20190408155257.7b82b64f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Y85CkOK7KtKPvOP1lKX62K9"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Williams <dan.j.williams@intel.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Li RongQing <lirongqing@baidu.com>, Liang ZhiCheng <liangzhicheng@baidu.com>
List-Id: linux-next.vger.kernel.org

--Sig_/Y85CkOK7KtKPvOP1lKX62K9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dan,

In commit

  7c33bd4e3e97 ("libnvdimm/pmem: fix a possible OOB access when read and wr=
ite pmem")

Fixes tag

  Fixes: 98cc093cba1e "(block, THP: make block_device_operations.rw_page su=
pport THP)"

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/Y85CkOK7KtKPvOP1lKX62K9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyq4bkACgkQAVBC80lX
0GyBSQf/XNX2dgkF4NNrElEfq5+hcQh/yHDR1+vpJjQDdlq1/wCT1MoKZJKq2qKd
o7Aj3xFFPf4EPBuyTH3B1NVhewogUGci4vz0dY2pSWyr3HW9bltrGX4iCPClonBC
aXKVPDEr1xHSJjwK5LgTy49o1ndi64N85R5FbPtgr0t+YA+0UOdE2gKR7fWbnDPG
El9RksgAC9lsONjxFMTyTZUyReefjtihqMvQmO4573glEplPxzvnp2n1zu2ccEsW
KCzNBdV+iWrrEmjKKKq5tIR8Le+cuBHLWgIkiWoaQjnX9vk6dAzJ4QGH1nKzJocg
WWF8VqM/KOI1bChl8SxZLyndfDKiQw==
=lHdi
-----END PGP SIGNATURE-----

--Sig_/Y85CkOK7KtKPvOP1lKX62K9--
