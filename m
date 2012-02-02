From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Feb 2 (fs/jffs2)
Date: Thu, 02 Feb 2012 10:24:30 -0800
Message-ID: <4F2AD4DE.7040508@xenotime.net>
References: <20120202144516.11b33e667a7cbb8d85d96226@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120202144516.11b33e667a7cbb8d85d96226@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: linux-next.vger.kernel.org

On 02/01/2012 07:45 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20120201:


fs/jffs2/*.c still contains uses of ->read etc. instead of using
mtd_read() etc.

fs/jffs2/read.c:36:8: error: 'struct mtd_info' has no member named 'read'
fs/jffs2/read.c:112:8: error: 'struct mtd_info' has no member named 'read'
fs/jffs2/nodemgmt.c:669:8: error: 'struct mtd_info' has no member named 'read'
fs/jffs2/readinode.c:83:9: error: 'struct mtd_info' has no member named 'read'
fs/jffs2/readinode.c:676:9: error: 'struct mtd_info' has no member named 'read'
fs/jffs2/readinode.c:954:8: error: 'struct mtd_info' has no member named 'read'
fs/jffs2/readinode.c:1040:9: error: 'struct mtd_info' has no member named 'read'
fs/jffs2/readinode.c:1216:8: error: 'struct mtd_info' has no member named 'read'
fs/jffs2/readinode.c:1275:10: error: 'struct mtd_info' has no member named 'read'
fs/jffs2/scan.c:286:8: error: 'struct mtd_info' has no member named 'read'
fs/jffs2/gc.c:590:8: error: 'struct mtd_info' has no member named 'read'
fs/jffs2/gc.c:894:10: error: 'struct mtd_info' has no member named 'read'
fs/jffs2/gc.c:977:9: error: 'struct mtd_info' has no member named 'read'

-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
