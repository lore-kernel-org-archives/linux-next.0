From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commits in the mips tree
Date: Mon, 4 Sep 2017 02:13:18 +1000
Message-ID: <20170904021318.613b0a21@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@imgtec.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Paul Burton <paul.burton@imgtec.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Commits

bb19a5e5205b MIPS: lantiq: Remove the arch/mips/lantiq/xway/reset.c implementation
f6a4de1654c9 MIPS: lantiq: Add a GPHY driver which uses the RCU syscon-mfd
565f7e8292f5 reset: Add a reset controller driver for the Lantiq XWAY based SoCs
e55bfdfacaed Documentation: DT: MIPS: lantiq: Add docs for the RCU bindings
5a7715f4b8e0 MIPS: lantiq: Enable MFD_SYSCON to be able to use it for the RCU MFD
114f298226a3 MIPS: Malta: Use new GIC accessor functions

are missing a Signed-off-by from their author.

Commit

114f298226a3 MIPS: Malta: Use new GIC accessor functions

is missing a Signed-off-by from its commiter.

-- 
Cheers,
Stephen Rothwell
