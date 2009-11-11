From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] pcmcia: fix printk formats
Date: Wed, 11 Nov 2009 09:31:07 -0800
Message-ID: <20091111093107.9032f4bb.randy.dunlap@oracle.com>
References: <20091111203159.a2a6eeeb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-pcmcia-bounces+glkpd-linux-pcmcia=m.gmane.org@lists.infradead.org>
In-Reply-To: <20091111203159.a2a6eeeb.sfr@canb.auug.org.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-pcmcia>,
	<mailto:linux-pcmcia-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-pcmcia/>
List-Post: <mailto:linux-pcmcia@lists.infradead.org>
List-Help: <mailto:linux-pcmcia-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-pcmcia>,
	<mailto:linux-pcmcia-request@lists.infradead.org?subject=subscribe>
Sender: linux-pcmcia-bounces@lists.infradead.org
Errors-To: linux-pcmcia-bounces+glkpd-linux-pcmcia=m.gmane.org@lists.infradead.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-pcmcia@lists.infradead.org, Harald Welte <laforge@gnumonks.org>
Cc: akpm <akpm@linux-foundation.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, gregkh@suse.de
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix printk format warnings on sizeof() [size_t] arguments.

drivers/char/pcmcia/cm4040_cs.c:267: warning: format '%lu' expects type 'long unsigned int', but argument 5 has type 'size_t'
drivers/char/pcmcia/cm4040_cs.c:272: warning: format '%lu' expects type 'long unsigned int', but argument 5 has type 'size_t'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/char/pcmcia/cm4040_cs.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20091110.orig/drivers/char/pcmcia/cm4040_cs.c
+++ linux-next-20091110/drivers/char/pcmcia/cm4040_cs.c
@@ -264,12 +264,12 @@ static ssize_t cm4040_read(struct file *
 
 	bytes_to_read = 5 + le32_to_cpu(*(__le32 *)&dev->r_buf[1]);
 
-	DEBUGP(6, dev, "BytesToRead=%lu\n", bytes_to_read);
+	DEBUGP(6, dev, "BytesToRead=%zu\n", bytes_to_read);
 
 	min_bytes_to_read = min(count, bytes_to_read + 5);
 	min_bytes_to_read = min_t(size_t, min_bytes_to_read, READ_WRITE_BUFFER_SIZE);
 
-	DEBUGP(6, dev, "Min=%lu\n", min_bytes_to_read);
+	DEBUGP(6, dev, "Min=%zu\n", min_bytes_to_read);
 
 	for (i = 0; i < (min_bytes_to_read-5); i++) {
 		rc = wait_for_bulk_in_ready(dev);
