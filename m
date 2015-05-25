From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the wireless-drivers-next tree with the
 wireless-drivers tree
Date: Mon, 25 May 2015 13:07:47 +1000
Message-ID: <20150525130747.12747385@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/V/t2O_YWQFqhhAW7l2rqTF0"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51875 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750783AbbEYDHy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 24 May 2015 23:07:54 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Emmanuel Grumbach <emmanuel.grumbach@intel.com>

--Sig_/V/t2O_YWQFqhhAW7l2rqTF0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kalle,

Today's linux-next merge of the wireless-drivers-next tree got a
conflict in drivers/net/wireless/iwlwifi/Kconfig between commit
ed65918735a5 ("iwlwifi: 7000: modify the firmware name for 3165") from
the wireless-drivers tree and commit 87411456834a ("iwlwifi: clarify
the device / firmware mapping in Kconfig") from the
wireless-drivers-next tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/net/wireless/iwlwifi/Kconfig
index f89f446e5c8a,99f9760fc11e..000000000000
--- a/drivers/net/wireless/iwlwifi/Kconfig
+++ b/drivers/net/wireless/iwlwifi/Kconfig
@@@ -21,7 -21,7 +21,8 @@@ config IWLWIF
  		Intel 7260 Wi-Fi Adapter
  		Intel 3160 Wi-Fi Adapter
  		Intel 7265 Wi-Fi Adapter
 +		Intel 3165 Wi-Fi Adapter
+ 		Intel 8260 Wi-Fi Adapter
 =20
 =20
  	  This driver uses the kernel's mac80211 subsystem.

--Sig_/V/t2O_YWQFqhhAW7l2rqTF0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVYpIIAAoJEMDTa8Ir7ZwVvWEP/iSD3hACndJNmCh0xg4duNjk
R86vEuWJM0zxq+hmPEO9VI39+Za81axQ5YL/WY5p5g6lxjiZzh4opy5/UZ6Ms/Nj
Oh3niljHx3OaUYlynsqxbNOvKddwUHL5u1GeCZFYehoyz+Vw/aO4lpBPQBrbCa9d
wW+r44fg4OHBwzhyzNiUHGhl681H2VxjBBRXasNQaf9BHT8zU2kxN5RvQpb289SN
rgHFA2cIC7mQz8aFqtEpQhRW09TbhP7NsJxqYsXTttonYsmG4G9j5+tEfYCrzw9t
SOW+PXt6os99hwERLKcfK4+Bt4+XUC1UBoPiAxIv1NVNqBEZxEDrbxlIB232PUK/
Gz4QQjDbjwOwX5nziU3/vZR6rC15ULyzEwA50XIUoiYxWElfwRS/aRloPJxAojo4
9X2wCg4zyzAHCnUGu0LAWhDHYJFdlunM52Iq+0zOCBaUGv66ZKrolkcP+IYQw47W
ZHuD1wjMpXt1xPrd0Y8GPDpetQUdxO2ZStx2qXzy48EWaTqLB0nAsS3j6LuSU8d/
m3Y7RGBiHGxaGsgs0vHD4zQliY/o2ThL2rLYNG/NPHEQAVi0RJ6eikOMEVW3GKe7
JoP/JJj0BPDyrxFaKUt5W2+NSoIuZUah4p1bEh7E/dqbLlM1IUnyZ8hut08qDffJ
OpSkdCXZrSC/Sz9YZ0+5
=517v
-----END PGP SIGNATURE-----

--Sig_/V/t2O_YWQFqhhAW7l2rqTF0--
