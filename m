From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Next May 13:[drivers/base/firmware*] Bug while booting on x86
Date: Thu, 14 May 2009 16:54:27 +0100
Message-ID: <1242316467.3393.14.camel@macbook.infradead.org>
References: <20090513164832.c8a0de7d.sfr@canb.auug.org.au>
	 <4A0AC5E6.2010402@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756474AbZENPyo@vger.kernel.org>
In-Reply-To: <4A0AC5E6.2010402@in.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sachin Sant <sachinp@in.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, 2009-05-13 at 18:36 +0530, Sachin Sant wrote:
> BUG: unable to handle kernel NULL pointer dereference at 0000050c
> IP: [<c0119c5d>] kunmap+0x33/0x59

Oops. Does this fix it?

--- a/drivers/base/firmware_class.c
+++ b/drivers/base/firmware_class.c
@@ -328,7 +328,7 @@ firmware_data_write(struct kobject *kobj, struct
bin_attribute *bin_attr,
 
 		memcpy(page_data + page_ofs, buffer, page_cnt);
 
-		kunmap(page_data);
+		kunmap(fw_priv->pages[page_nr]);
 		buffer += page_cnt;
 		offset += page_cnt;
 		count -= page_cnt;

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
