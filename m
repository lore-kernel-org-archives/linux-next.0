From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: manual merge of the tip tree with the acpi tree
Date: Thu, 24 Feb 2011 11:29:52 +0100
Message-ID: <201102241129.53232.rjw@sisk.pl>
References: <20110224155221.4f35f728.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:54692 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753025Ab1BXKaU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 24 Feb 2011 05:30:20 -0500
In-Reply-To: <20110224155221.4f35f728.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Len Brown <lenb@kernel.org>

On Thursday, February 24, 2011, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in
> arch/x86/kernel/acpi/sleep.c between commit
> a69fa313606a51cee99d802c14895330948f60c8 ("ACPI / PM: Drop
> acpi_restore_state_mem()") from the acpi tree and commit
> d1ee433539ea5963a8f946f3428b335d1c5fdb20 ("x86, trampoline: Use the
> unified trampoline setup for ACPI wakeup") from the tip tree.
> 
> Just context (I think).

Yes.  The ACPI tree renames a function that the x86 tree modifies.

> I fixed it up (see below) and can carry the fix as necessary.

Please do, thanks!
