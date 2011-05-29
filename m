From: Antony Pavlov <antony@niisi.msk.ru>
Subject: [PATCH] drivers/tty/serial/8250_pci.c: fix warning
Date: Sun, 29 May 2011 18:12:26 +0400
Message-ID: <1306678346-32045-1-git-send-email-antony@niisi.msk.ru>
References: <20110525103740.f8917fd8.sfr@canb.auug.org.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110525103740.f8917fd8.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Antony Pavlov <antony@niisi.msk.ru>
List-Id: linux-next.vger.kernel.org

Signed-off-by: Antony Pavlov <antony@niisi.msk.ru>
---
 drivers/tty/serial/8250_pci.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/tty/serial/8250_pci.c b/drivers/tty/serial/8250_pci.c
index 4b4968a..78e98a5 100644
--- a/drivers/tty/serial/8250_pci.c
+++ b/drivers/tty/serial/8250_pci.c
@@ -973,7 +973,7 @@ ce4100_serial_setup(struct serial_private *priv,
 
 static int
 pci_omegapci_setup(struct serial_private *priv,
-		      struct pciserial_board *board,
+		      const struct pciserial_board *board,
 		      struct uart_port *port, int idx)
 {
 	return setup_port(priv, port, 2, idx * 8, 0);
-- 
1.7.1
