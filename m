From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Fix patch for the merge of the v4l-dvb and slave-dma trees
Date: Sat, 25 Apr 2015 18:29:54 +1000
Message-ID: <20150425182954.388f5569@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/7cYOricwh38SQhiKXHJL2Si"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47336 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752867AbbDYIaE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 25 Apr 2015 04:30:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus <torvalds@linux-foundation.org>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hyun Kwon <hyun.kwon@xilinx.com>, Radhey Shyam Pandey <radheys@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, Hans Verkuil <hans.verkuil@cisco.com>, Vinod Koul <vinod.koul@intel.com>

--Sig_/7cYOricwh38SQhiKXHJL2Si
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Linus,

I have been applying the below merge fix patch for a while now.  I
neglected to let Vinod know that it was needed after your merge of his
tree.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 13 Apr 2015 12:48:27 +1000
Subject: [PATCH] v4l: xilinx: fix for include file movement

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/media/platform/xilinx/xilinx-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/pla=
tform/xilinx/xilinx-dma.c
index 10209c294168..efde88adf624 100644
--- a/drivers/media/platform/xilinx/xilinx-dma.c
+++ b/drivers/media/platform/xilinx/xilinx-dma.c
@@ -12,7 +12,7 @@
  * published by the Free Software Foundation.
  */
=20
-#include <linux/amba/xilinx_dma.h>
+#include <linux/dma/xilinx_dma.h>
 #include <linux/lcm.h>
 #include <linux/list.h>
 #include <linux/module.h>
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/7cYOricwh38SQhiKXHJL2Si
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVO1CIAAoJEMDTa8Ir7ZwV0NUP/2bHNQ57KI/GqeWNBZUAZi+9
au7XrwyzXZLm2jtqh3UAyFqxXiXGgjpDwdyxMtIsG2NU1DxnIVR5H3nI4m3zN4MU
Y9xWSAFXAeXz0R4AHZZfoCCaRDbPIIqo4+bXUJiYbcZ4t1UWer5C7sLcWpbyGhZ5
JNkCYv/JS1urumTBXYiPX1CC7+t8CLpLgjqxM+3EvgwkmqpXDCmKz9jfydP4690u
/CrdKfMY2Q5xF+saQeSwFGt7VUJL6OFIR2m9GkPLiFqQLcuNTFyigs7cgohJRCzX
jGWYJlnCVvtd0t7DfVzEU60Hdf5wdhkX9Friu5LJZ9lzu/PJZbCz3FpeN7RGZ2gU
T6JFWoPmxlxYVXddnF4p10j2ROECrO118DJas1Hmwstvgv/9ayjsHPmREP+K6xkc
8nx5Zc48xnpovVUeI10gahdIQK+zGvRBUQz+qLRJm2rpktaJsGi7dXWb/YCflXD7
7yLkFC4x477XHX1YVSpDCaTnW+yMvXunEIzjvkemK0yLMTY3LxsXI4qO0COL5iPR
DKxAGCQW8smravy1jaz6kxYeqk7pRy48HASvpwq5dgtZk19EDA+9Er3wKY+/NjVp
Vu013dqZdyky1Gk8wZmbJ3Gfk0ZVhPUq9kPZYhWfefU5R/oqtEbycpt90XZiCKBn
TX/4yXNylkuxXzH2SfKY
=0rE+
-----END PGP SIGNATURE-----

--Sig_/7cYOricwh38SQhiKXHJL2Si--
