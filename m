From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] IR: jvc-decoder needs BITREVERSE
Date: Wed, 7 Jul 2010 16:41:15 -0700
Message-ID: <20100707164115.1682b172.randy.dunlap@oracle.com>
References: <20100707165539.957e7d1c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100707165539.957e7d1c.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jarod Wilson <jarod@redhat.com>, David =?ISO-8859-1?Q?H=E4rdeman?= <david@hardeman.nu>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org
List-Id: linux-next.vger.kernel.org

=46rom: Randy Dunlap <randy.dunlap@oracle.com>

ir-jvc-decoder uses bitreverse interfaces, so it should select
BITREVERSE.

ir-jvc-decoder.c:(.text+0x550bc): undefined reference to `byte_rev_tabl=
e'
ir-jvc-decoder.c:(.text+0x550c6): undefined reference to `byte_rev_tabl=
e'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Jarod Wilson <jarod@redhat.com>
Cc: David H=E4rdeman <david@hardeman.nu>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>
---
 drivers/media/IR/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20100707.orig/drivers/media/IR/Kconfig
+++ linux-next-20100707/drivers/media/IR/Kconfig
@@ -53,6 +53,7 @@ config IR_RC6_DECODER
 config IR_JVC_DECODER
 	tristate "Enable IR raw decoder for the JVC protocol"
 	depends on IR_CORE
+	select BITREVERSE
 	default y
=20
 	---help---
