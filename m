From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: Tree for July 26 (uml)
Date: Tue, 14 Aug 2012 16:06:28 +0100
Message-ID: <18933.1344956788@warthog.procyon.org.uk>
References: <502A6759.3090802@nod.at> <15981.1344955883@warthog.procyon.org.uk> <502A613F.1090600@nod.at> <87a9xys53h.fsf@rustcorp.com.au> <20120726150419.0de645e8750e3a15fa0f1aaa@canb.auug.org.au> <50115FCF.4060708@xenotime.net> <502932A0.3060001@xenotime.net> <15532.1344954413@warthog.procyon.org.uk> <18600.1344956051@warthog.procyon.org.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <502A6759.3090802@nod.at>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Weinberger <richard@nod.at>
Cc: dhowells@redhat.com, Rusty Russell <rusty@rustcorp.com.au>, Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, user-mode-linux-devel@lists.sourceforge.net
List-Id: linux-next.vger.kernel.org

Richard Weinberger <richard@nod.at> wrote:

> I think arch/x86/um/Kconfig makes more sense.

warthog>ls arch/um
defconfig     Kconfig.common  Kconfig.um     Makefile-os-Linux  scripts/
drivers/      Kconfig.debug   kernel/        Makefile-ppc       sys-ia64/
include/      Kconfig.net     Makefile       Makefile-skas      sys-ppc/
Kconfig.char  Kconfig.rest    Makefile-ia64  os-Linux/

It doesn't exist.  Should I create it?

David
