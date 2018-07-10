From: Maninder Singh <maninder1.s@samsung.com>
Subject: RE: linux-next: build warning after merge of the printk tree
Date: Tue, 10 Jul 2018 12:46:14 +0530
Message-ID: <2014348883.271177.1531206974788.JavaMail.jboss@ep1ml503>
References: <20180710164514.22c552db@canb.auug.org.au>
        <CGME20180710064527epcas1p16fd9ad765711d69264b3251890bbcc2e@epcms5p5>
Reply-To: maninder1.s@samsung.com
Mime-Version: 1.0
Content-Type: multipart/mixed;
        boundary="----=_Part_271176_1830423383.1531206974788"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180710164514.22c552db@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Petr Mladek <pmladek@suse.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vaneet Narang <v.narang@samsung.com>, PANKAJ MISHRA <pankaj.m@samsung.com>
List-Id: linux-next.vger.kernel.org

------=_Part_271176_1830423383.1531206974788
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"

Hi Petr,
 
> Hi all,
 
> After merging the printk tree, today's linux-next build (x86_64
> allnoconfig) produced this warning:
 
> kernel/printk/printk.c:2033:13: warning: 'suppress_message_printing' defined but not used [-Wunused-function]
> static bool suppress_message_printing(int level) { return false; }
             ^~~~~~~~~~~~~~~~~~~~~~~~~
 
seems there is no user for suppress_message_printing when CONFIG_PRINTK is disabled,
because earlier it was getting used in console_unlock and now we shifted this into vprintk_emit
which will be disabled on disabling CONFIG_PRINTk.

should we remove this defination when CONFIG_PRINTK is disabled ?

> Introduced by commit
>  375899cddcbb ("printk: make sure to print log on console.")
------=_Part_271176_1830423383.1531206974788
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="No File Name 0"
Content-Transfer-Encoding: base64

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0NCg0KaVFFekJBRUJDQUFkRmlFRU5JQzk2Z2la
ODF0V2RMZ0tBVkJDODBsWDBHd0ZBbHRFVmZvQUNna1FBVkJDODBsWA0KMEd4UVR3ZjlFWndkdHJY
TUxRd0QxL3FKT2FkUkhzMWZ5dlQ1bnlVZE1iQ1BjdGFNa2RJbTROc3l4MWxhaThyLw0Kb0ZNamps
TXFtd08rWXFuZVJ3b2podituQVo3NytDdEJVUm5WN2sycmlhemYzbUhjclVqSEN6ZlEyZWw1Rmdz
ag0KNnAzWWFvd2w0NStsVFZZYTl1RVp4czU5UVdXRnJabmZQS2REazhqREZlRnBwRzFOM1VIcjly
UUptOXBpczZUQQ0KOXJaRnVjeWVXQVpBZTd3TWticGVLUGw4d2hwVlVQWHh3RGd0Z0lqaW90Vmc1
dEtsdUM3Uk5jUXdMek1iQkgwbw0KdTJoYVgzU0RmZXFPZHhpMDVXZWg0UUlYS283a0ZBeVgzb3Mr
d3l5VVBvSXY0MHVXdWhMQWYxSTZXaGRQQmRiaQ0KZ0xDaXVLNXhybk5ZbWd4VVJnN21vSFVRKzBQ
ekR3PT0NCj1iU3JNDQotLS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0NCg==

------=_Part_271176_1830423383.1531206974788--
