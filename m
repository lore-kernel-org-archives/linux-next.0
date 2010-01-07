From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for January 7 (pcmcia)
Date: Thu, 7 Jan 2010 10:10:06 -0800
Message-ID: <20100107101006.e59989a8.rdunlap@xenotime.net>
References: <20100107172134.af71c742.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <20100107172134.af71c742.sfr@canb.auug.org.au>
Sender: linux-kbuild-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kbuild@vger.kernel.org
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Valdis.Kletnieks@vt.edu
List-Id: linux-next.vger.kernel.org

On Thu, 7 Jan 2010 17:21:34 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20100106:


drivers/built-in.o: In function `yenta_probe':
yenta_socket.c:(.devinit.text+0x1e582): undefined reference to `pccard_nonstatic_ops'

CONFIG_PCCARD=y
CONFIG_PCMCIA=m
CONFIG_PCCARD_NONSTATIC=m
CONFIG_YENTA=y

so yenta code (built-in) tries to reference data that lives in a
loadable module.  But I would expect this Kconfig:

config YENTA
	tristate "CardBus yenta-compatible bridge support"
	depends on PCI
	select CARDBUS if !EMBEDDED
	select PCCARD_NONSTATIC if PCMCIA

to make PCCARD_NONSTATIC=y instead of =m.  Has something changed in
kconfig recently that would make that different?


---
~Randy
