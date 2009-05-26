From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: linux-next: manual merge of the x86 tree with Linus' tree
Date: Mon, 25 May 2009 17:56:33 -0700
Message-ID: <4A1B3E41.5030003@zytor.com>
References: <20090526105249.986c4f3c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:48061 "EHLO
	terminus.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752775AbZEZA5C (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 May 2009 20:57:02 -0400
In-Reply-To: <20090526105249.986c4f3c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the x86 tree got a conflict in
> arch/x86/boot/memory.c between commit
> bca23dba760d6705c013f89113c46570378fb626 ("x86, setup: revert ACPI 3 E820
> extended attributes support") from Linus' tree and commit
> df7699c56421c0476704f24a43409ac8c505f3d2 ("x86, setup: "glove box" BIOS
> interrupts in the core boot code") from the x86 tree.
> 
> The former removed the code that the latter modified, so I used the
> former (as is done in -tip).

tip:x86/setup should contain a proper merge between the two.

	-hpa

-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.
