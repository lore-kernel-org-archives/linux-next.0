From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Subject: [PATCH linux-next] ARM: shmobile: rcar-gen2: update call to dma_contiguous_reserve_area
Date: Thu, 19 Jun 2014 11:31:10 +0200
Message-ID: <1403170270-17877-1-git-send-email-vincent.stehle@laposte.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: linux-sh@vger.kernel.org, linux-next@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@arm.linux.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-next.vger.kernel.org

Commit 5ea3b1b2f8ad 'cma: add placement specifier for "cma=3D" kernel p=
arameter'
adds a new 'fixed' parameter to dma_contiguous_reserve_area(). Update
rcar_gen2_reserve() accordingly.

This fixes the following compilation error:

  arch/arm/mach-shmobile/setup-rcar-gen2.c: In function =E2=80=98rcar_g=
en2_reserve=E2=80=99:
  arch/arm/mach-shmobile/setup-rcar-gen2.c:182:10: error: too few argum=
ents to function =E2=80=98dma_contiguous_reserve_area=E2=80=99

Signed-off-by: Vincent Stehl=C3=A9 <vincent.stehle@laposte.net>
Cc: Simon Horman <horms@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Russell King <linux@arm.linux.org.uk>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
---

Hi,

This can be seen with linux next-20140619 and e.g. arm allmodconfig.

Best regards,

V.

 arch/arm/mach-shmobile/setup-rcar-gen2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c b/arch/arm/mach-s=
hmobile/setup-rcar-gen2.c
index 73fb2a6..42d5b43 100644
--- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
@@ -179,6 +179,6 @@ void __init rcar_gen2_reserve(void)
 #ifdef CONFIG_DMA_CMA
 	if (mrc.size)
 		dma_contiguous_reserve_area(mrc.size, mrc.base, 0,
-					    &rcar_gen2_dma_contiguous);
+					    &rcar_gen2_dma_contiguous, true);
 #endif
 }
--=20
2.0.0

