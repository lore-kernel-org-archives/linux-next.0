From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for May 29
Date: Thu, 29 May 2008 09:44:54 -0700
Message-ID: <20080529094454.3605aa5c.randy.dunlap@oracle.com>
References: <20080529182556.2994310a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1758150AbYE2Qbn@vger.kernel.org>
In-Reply-To: <20080529182556.2994310a.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dmitry.torokhov@gmail.com
List-Id: linux-next.vger.kernel.org

On Thu, 29 May 2008 18:25:56 +1000 Stephen Rothwell wrote:

> Merging input/next

Most randconfig builds end with i8042 build errors (on i386 or x86_64)
when CONFIG_PNP=n:


linux-next-20080529/drivers/input/serio/i8042-x86ia64io.h:590: error: 'i8042_nopnp' undeclared (first use in this function)
linux-next-20080529/drivers/input/serio/i8042-x86ia64io.h:590: error: (Each undeclared identifier is reported only once
linux-next-20080529/drivers/input/serio/i8042-x86ia64io.h:590: error: for each function it appears in.)
make[3]: *** [drivers/input/serio/i8042.o] Error 1

---
~Randy
"He closes his eyes and drops the goggles.  You can't get hurt
by looking at a bitmap.  Or can you?"
