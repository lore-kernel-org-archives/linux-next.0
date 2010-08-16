From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] spi: update for of_device to platform_device replacement
Date: Mon, 16 Aug 2010 12:20:59 +1000
Message-ID: <20100816122059.c3ee7f6a.sfr@canb.auug.org.au>
References: <20100809120509.be36a4fa.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100809120509.be36a4fa.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>, Linus <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org


Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/ata/sata_dwc_460ex.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

Hi Grant,

On Mon, 9 Aug 2010 12:05:09 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> I also added this merge fix patch (as suggest by you):

This patch now is needed in Linus' tree.  I will add it to my fixes tree
for today.  Linus, can you take this, please?

diff --git a/drivers/ata/sata_dwc_460ex.c b/drivers/ata/sata_dwc_460ex.c
index ea24c1e..2673a3d 100644
--- a/drivers/ata/sata_dwc_460ex.c
+++ b/drivers/ata/sata_dwc_460ex.c
@@ -1588,7 +1588,7 @@ static const struct ata_port_info sata_dwc_port_info[] = {
 	},
 };
 
-static int sata_dwc_probe(struct of_device *ofdev,
+static int sata_dwc_probe(struct platform_device *ofdev,
 			const struct of_device_id *match)
 {
 	struct sata_dwc_device *hsdev;
@@ -1702,7 +1702,7 @@ error_out:
 	return err;
 }
 
-static int sata_dwc_remove(struct of_device *ofdev)
+static int sata_dwc_remove(struct platform_device *ofdev)
 {
 	struct device *dev = &ofdev->dev;
 	struct ata_host *host = dev_get_drvdata(dev);
-- 
1.7.1

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
