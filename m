From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm tree
Date: Wed, 20 May 2015 13:08:28 +1000
Message-ID: <20150520130828.4fdacf54@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/f.cCvU7twZWYt7FW3GwG49B"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45261 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751450AbbETDIj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 19 May 2015 23:08:39 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Oded Gabbay <oded.gabbay@gmail.com>, Alex Deucher <alexander.deucher@amd.com>

--Sig_/f.cCvU7twZWYt7FW3GwG49B
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dave,

After merging the drm tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c: In function 'create_=
queue_cpsch':
drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c:888:2: error: implici=
t declaration of function 'init_sdma_vm' [-Werror=3Dimplicit-function-decla=
ration]
  init_sdma_vm(dqm, q, qpd);
  ^

Caused by commit 3e3f6e1a90a8 ("drm/amdkfd: make the sdma vm init to be
asic specific").

I have used the drm tree from next-20150519 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/f.cCvU7twZWYt7FW3GwG49B
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVW/q1AAoJEMDTa8Ir7ZwVS+wP/0el5CwWuWJKbhe3QZzX3s8P
CiE6IZHD/ngbV/X6hsrzRNTH71ivbZGp4FO4u1cbMK02V8NHf1iLB3IdMUAKJRdA
RAOeDWktcKKMTcyIpUq8/IYyosQ/aAtweV1xnVlkA/332/lp6HitH3hE7b3Z3guQ
rtfsqDuCwjIgALK2Fe6WJC5gcW4q2NwN7tKZth27cBjYtkROpSkRCrfuZaiIVhWI
62JRdbUS/FbhvvMM7S1P6ilsaxcuU8KG4VrPpT25+UuXVen5htVS1E25xCL8RX1X
GdBnIxnB9zzGjr8Ikn5rJELpqf3giqN7vvkKL9Y+zeGjSTi1td9Zth71CdVx8Spy
bUFEpHgAvQWyPIWv3Hp4e9dwXjHWstEWJ3tFrvdBWbzOvWHVh7CjtioQysXhG3sq
iQZoWTPnwDBE5s+nA0uiM+MuF4+nl2ON8i9z+nSqbU/E7UUwWptN3z8qRv0nn9YQ
zEiJNT9qR/W7d1DdRo9aMlH8/Duy8J/oL2QcRCnc925dpb1qPtKvpLn1FJTH1LS4
V6Wn9i07ONXd4f3rVo1dJcqAaF6SJGarE7W5siQ609MGw+ssWpKHFRyRINP83J3u
5pAo/Cg/BEYay+wuW+tE+2xhaRmC76yuADrxdoLdyOwtV9NNBnoZKsiSSZQA00vP
Ck6TWlg7QhSS8h9m1TQb
=RChQ
-----END PGP SIGNATURE-----

--Sig_/f.cCvU7twZWYt7FW3GwG49B--
