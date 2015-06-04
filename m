From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the cris tree
Date: Thu, 4 Jun 2015 14:26:22 +1000
Message-ID: <20150604142622.3b36321f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/D6=NiEYaFSr5kiA_LQ_Gssi"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37276 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753197AbbFDE0b (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 4 Jun 2015 00:26:31 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Jesper Nilsson <jesper.nilsson@axis.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Rabin Vincent <rabin@rab.in>

--Sig_/D6=NiEYaFSr5kiA_LQ_Gssi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jens,

Today's linux-next merge of the block tree got a conflict in
arch/cris/include/asm/Kbuild between commit 5527b7d955ac ("CRIS: UAPI:
use generic headers via Kbuild") from the cris tree and commit
c546d5db75b4 ("remove scatterlist.h generation from arch Kbuild files")
from the block tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/cris/include/asm/Kbuild
index 2fc4331a69ca,d294f6aaff1d..000000000000
--- a/arch/cris/include/asm/Kbuild
+++ b/arch/cris/include/asm/Kbuild
@@@ -24,23 -18,11 +24,22 @@@ generic-y +=3D linkage.
  generic-y +=3D local.h
  generic-y +=3D local64.h
  generic-y +=3D mcs_spinlock.h
 +generic-y +=3D mman.h
  generic-y +=3D module.h
 +generic-y +=3D msgbuf.h
  generic-y +=3D percpu.h
 +generic-y +=3D poll.h
  generic-y +=3D preempt.h
 +generic-y +=3D resource.h
- generic-y +=3D scatterlist.h
  generic-y +=3D sections.h
 +generic-y +=3D sembuf.h
 +generic-y +=3D shmbuf.h
 +generic-y +=3D siginfo.h
 +generic-y +=3D socket.h
 +generic-y +=3D sockios.h
 +generic-y +=3D statfs.h
  generic-y +=3D topology.h
  generic-y +=3D trace_clock.h
 +generic-y +=3D types.h
  generic-y +=3D vga.h
  generic-y +=3D xor.h

--Sig_/D6=NiEYaFSr5kiA_LQ_Gssi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVb9NzAAoJEMDTa8Ir7ZwVwyQP/1qMsE+I1ZpBfOrsWf4yzPUK
Zfy2tWFwfJfBHu92nDWwvuW1FdSBxL+RhWMeeezhrESTX7wcAlI9FlmEjEnIawj3
eEDq/ycBF8yXrSA+PRNuwA+lniKc1TxV4WVxJmmRrS8WMHXbrBSDs0Yfrv2rRK6t
YOqCJ5qRHbxASkHsiMxRGdQO+lsNv1YbYrE+R4DVU5lTg46XuGbg1erWhMnafyzo
sTsYtjRwBHgqSfE4cW5GR03Pt8uCTJjZdiwJDCbJALyWmnJjx2B3BEbA6KHWBiLJ
eRJZcPZfb/GtLmOn90mMNvkxEg3k+IwWBZnYQs2N/OwcshtOOC56iNI39GUwDvtZ
e2/W9X9PfDf2NtsQ8yKf0T706R5PPiG2d8iXTEoKq15w/byGTlnNMiFOSFeDISDK
wAHnn34bWSJG8Duaqe+IrDZLsw0wr7Chwdfn8afo/Vi7Srcn2dVal1t+qei52KHP
4Ik6m5Mz4Jds1VmWUMMfQ0+Zdh1crIsvHkjZ3tGlmJZHbINKwib9PkL8tgunK1Yh
nZ8x8OiOnk4o4ZI2aUfB8ewlbFJFIQ0wo+jAbs7iFBOZuIL9TsTFXiSUx2iLynXF
kULdI6kl6XQFHCRGVLJb65CBrF85CyXdlRNhfDnnAIhphO1TvMsYbXtjIwVD75+d
9Meo2QrdjKd5oo3zjTpB
=NaNr
-----END PGP SIGNATURE-----

--Sig_/D6=NiEYaFSr5kiA_LQ_Gssi--
