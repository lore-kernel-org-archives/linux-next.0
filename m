From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH -next] thinkpad_acpi: fix build, HOTKEY_POLL is optional
Date: Mon, 12 Oct 2009 14:59:42 +0200
Message-ID: <20091012125942.GA25464@elte.hu>
References: <20091009190654.741eeffd.sfr@canb.auug.org.au> <20091009161723.b68b91a7.randy.dunlap@oracle.com> <20091010000808.GA10637@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756203AbZJLNAk@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20091010000808.GA10637@khazad-dum.debian.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, lenb@kernel.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


* Henrique de Moraes Holschuh <hmh@hmh.eng.br> wrote:

> On Fri, 09 Oct 2009, Randy Dunlap wrote:
> > From: Randy Dunlap <randy.dunlap@oracle.com>
> > 
> > Fix optional part of driver to be built optionally:
> 
> NAK!
> 
> This happens because of (linux-next) commit
> 7f6443f7238a0aa9014b11a0a31ab76825d75cdf 
> "thinkpad-acpi: Fix build on !CONFIG_THINKPAD_ACPI_HOTKEY_POLL" by
> Ingo.
> 
> That commit is wrong, it must NOT be applied as explained in the 
> thread starting at http://lkml.org/lkml/2009/9/27/30.

Yep, that was wrong - it should be gone now.

	Ingo
