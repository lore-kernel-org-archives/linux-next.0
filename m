From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: linux-next: firmware build failure
Date: Fri, 06 Jun 2008 10:31:05 +0100
Message-ID: <1212744665.32207.304.camel@pmac.infradead.org>
References: <20080606174723.05ae4f28.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:52435 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750944AbYFFJbI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Jun 2008 05:31:08 -0400
In-Reply-To: <20080606174723.05ae4f28.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Fri, 2008-06-06 at 17:47 +1000, Stephen Rothwell wrote:
> Hi David,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
>   IHEX2FW firmware/atmsar11.fw
> Bad EOF record (type 01) format
> make[2]: *** [firmware/atmsar11.fw] Error 1

Bah. The actual fix is something like this, which I forgot to commit.
Sorry again -- it's there now (with some more minor cleanups).

--- a/firmware/ihex2fw.c
+++ b/firmware/ihex2fw.c
@@ -146,7 +146,6 @@ next_record:
 
        record->addr  = hex(data + i, &crc) << 8; i += 2;
        record->addr |= hex(data + i, &crc); i += 2;
-       record->addr += offset;
        type = hex(data + i, &crc); i += 2;
 
        for (j = 0; j < record->len; j++, i += 2)
@@ -166,12 +165,13 @@ next_record:
                if (!record->len)
                        break;
 
+               record->addr += offset;
                file_record(record);
                goto next_record;
 
        case 1: /* End-Of-File Record */
                if (record->addr || record->len) {
                        fprintf(stderr, "Bad EOF record (type 01) format\n");


> 
-- 
dwmw2

