From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pcmcia tree with the mtd tree
Date: Mon, 17 May 2010 13:22:39 +1000
Message-ID: <20100517132239.5cb9eb5d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Kurz <linux@blala.de>, David Woodhouse <dwmw2@infradead.org>
List-Id: linux-next.vger.kernel.org

Hi Dominik,

Today's linux-next merge of the pcmcia tree got a conflict in
drivers/mtd/maps/pcmciamtd.c between commit
9bdde162ebcc0237e722e8c3d0d376e35188a98f ("pcmciamtd: coding style
cleanups") from the mtd tree and commit
317b6d63000b3cc48c43d582d76063500e531a6c ("pcmcia: dev_node removal
(write-only drivers)") from the pcmcia tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/mtd/maps/pcmciamtd.c
index c4aacbf,87b2b8f..0000000
--- a/drivers/mtd/maps/pcmciamtd.c
+++ b/drivers/mtd/maps/pcmciamtd.c
@@@ -656,12 -646,11 +655,10 @@@ static int pcmciamtd_config(struct pcmc
  		pcmciamtd_release(link);
  		return -ENODEV;
  	}
- 	snprintf(dev->node.dev_name, sizeof(dev->node.dev_name), "mtd%d", mtd->index);
 -	info("mtd%d: %s", mtd->index, mtd->name);
 +	dev_info(&dev->p_dev->dev, "mtd%d: %s\n", mtd->index, mtd->name);
- 	link->dev_node = &dev->node;
  	return 0;
  
 - failed:
 -	err("CS Error, exiting");
 +	dev_err(&dev->p_dev->dev, "CS Error, exiting\n");
  	pcmciamtd_release(link);
  	return -ENODEV;
  }
