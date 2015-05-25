From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with Linus' tree
Date: Mon, 25 May 2015 17:25:07 +1000
Message-ID: <20150525172507.20799066@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/zrKKqHYJOcLhS=22PM4ncwQ"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53343 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750793AbbEYHZO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 May 2015 03:25:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Liang Li <liang.z.li@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, Yang Zhang <yang.z.zhang@intel.com>, Rik van Riel <riel@redhat.com>

--Sig_/zrKKqHYJOcLhS=22PM4ncwQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm tree got a conflict in
arch/x86/kvm/x86.c between commit c447e76b4cab ("kvm/fpu: Enable eager
restore kvm FPU for MPX") from the  tree and commit 653f52c316a4
("kvm,x86: load guest FPU context more eagerly") from the kvm tree.

I fixed it up (I used the version from the kvm tree) and can carry the
fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/zrKKqHYJOcLhS=22PM4ncwQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVYs5XAAoJEMDTa8Ir7ZwVjIoP/iZjdJ0mqVwhK/YYojoW6hqs
oMgik+YkuWH0/klp8qu7tr13wrk51xTjcRfdNoBrLOhR77iRqxSHsQDxl7Oix0vL
8oSa6npGmy6sND99xvZ6s/PGiMooVzTq6zpaIXj4oDJPTykiQYDqA0in01ddwvzF
JePDGGJda/2dPPaFwXXyioz96Q3ygVS10m1KhsHAxAELWK5E28cmDG4MSIC7p1qR
g+UmhdbP15ySkb0OFSZidOBCkE5Uudxf8cbH5fvCCaCmCbTHPwYxwk+aqRJ906Mw
QVaTNfFl3mSy770FwgCOhHDEYBcpHYrfPcuO4HmBClvbQ1B8erTt0CD04WbJqPTf
R7BD/2+CIJo54rkc/ewB9ZvK3RPqCSiGtNSJtfmvdRx3o0QRf12KMuEW3n0i9zi6
1IduCJPOjHT8z8x54MHCRRR89WYDTpF20A0Lc/hJW2ZeEqi9gznV5o+QMEgdhTm4
gPIqQY22OspBrN/PNpFSLEnVgnajFT+nhoz1fsbticyrOFtEr8tV2xhsoqPO9XTz
flOW2s9UcR6NqQtBOjwf1YeGdoN4ZzAPUMn4+PoY4278WpYefFRHR+Q9elpGkuH5
KfKbDotSI6sqFp2w/zRW1pceRWdiF4cJAQM/3/1yHUHorOt83L0/thLYHagoscQ7
i0y7zHo5ZmCFeYc5robM
=vGqn
-----END PGP SIGNATURE-----

--Sig_/zrKKqHYJOcLhS=22PM4ncwQ--
