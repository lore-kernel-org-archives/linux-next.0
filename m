From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the tty tree
Date: Thu, 21 Jan 2016 12:56:18 +1100
Message-ID: <20160121125618.78f0cb37@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk+kernel@arm.linux.org.uk>
List-Id: linux-next.vger.kernel.org

Hi Greg,

After merging the tty tree (now in Linus' tree, sorry for not pointing
it out earlier), today's linux-next build (multi_v7_defconfig) produced
this warning:

drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
 static struct vendor_data vendor_zte = {
                           ^

Introduced by commit

  7ec758718920 ("tty: amba-pl011: add support for ZTE UART (EXPERIMENTAL)")

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
