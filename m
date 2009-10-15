From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for October 15 (i7core_edac)
Date: Thu, 15 Oct 2009 12:17:20 -0700
Message-ID: <20091015121720.57710ad2.randy.dunlap@oracle.com>
References: <20091015152538.74a1cb15.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S935220AbZJOTSd@vger.kernel.org>
In-Reply-To: <20091015152538.74a1cb15.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, 15 Oct 2009 15:25:38 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20091014:


Hi Mauro,

i7core_edac has a few glitches when building on X86_32 or on SMP=n.
Should it be restricted to X86_64 and SMP=y?


drivers/edac/i7core_edac.c:860: error: implicit declaration of function 'msleep'
--> #include <linux/delay.h>

SMP=n:
drivers/edac/i7core_edac.c:1700: error: 'struct cpuinfo_x86' has no member named 'phys_proc_id'


X86_32=y:
drivers/edac/i7core_edac.c:919: warning: left shift count >= width of type
drivers/edac/i7core_edac.c:922: warning: left shift count >= width of type
drivers/edac/i7core_edac.c:924: warning: left shift count >= width of type
drivers/edac/i7core_edac.c:929: warning: left shift count >= width of type
drivers/edac/i7core_edac.c:932: warning: left shift count >= width of type
drivers/edac/i7core_edac.c:934: warning: left shift count >= width of type
drivers/edac/i7core_edac.c:939: warning: left shift count >= width of type
drivers/edac/i7core_edac.c:945: warning: left shift count >= width of type
drivers/edac/i7core_edac.c:951: warning: left shift count >= width of type

---
~Randy
