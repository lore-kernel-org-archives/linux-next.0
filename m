From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] IR: fix ir-nec-decoder build, select BITREVERSE
Date: Fri, 14 May 2010 10:09:57 -0700
Message-ID: <20100514100957.b4f9753f.randy.dunlap@oracle.com>
References: <20100514161407.740da901.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100514161407.740da901.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-media@vger.kernel.org
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix ir-nec-decoder build: it uses bitrev library code, so
select BITREVERSE in its Kconfig.

ir-nec-decoder.c:(.text+0x1a2517): undefined reference to `byte_rev_table'
ir-nec-decoder.c:(.text+0x1a2526): undefined reference to `byte_rev_table'
ir-nec-decoder.c:(.text+0x1a2530): undefined reference to `byte_rev_table'
ir-nec-decoder.c:(.text+0x1a2539): undefined reference to `byte_rev_table'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc:	Mauro Carvalho Chehab <mchehab@infradead.org>
---
 drivers/media/IR/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20100514.orig/drivers/media/IR/Kconfig
+++ linux-next-20100514/drivers/media/IR/Kconfig
@@ -13,6 +13,7 @@ source "drivers/media/IR/keymaps/Kconfig
 config IR_NEC_DECODER
 	tristate "Enable IR raw decoder for the NEC protocol"
 	depends on IR_CORE
+	select BITREVERSE
 	default y
 
 	---help---
