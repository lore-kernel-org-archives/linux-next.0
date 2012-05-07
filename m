From: Michal Marek <mmarek@suse.cz>
Subject: Re: linux-next: manual merge of the tip tree with the kbuild tree
Date: Mon, 07 May 2012 21:25:54 +0200
Message-ID: <4FA821C2.4070107@suse.cz>
References: <20120507151054.3fa8df4599e81cc6ae87ca7a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120507151054.3fa8df4599e81cc6ae87ca7a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>, Sam Ravnborg <sam@ravnborg.org>
List-Id: linux-next.vger.kernel.org

Dne 7.5.2012 07:10, Stephen Rothwell napsal(a):
> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in Makefile
> between commit 1f2bfbd00e46 ("kbuild: link of vmlinux moved to a script")
> from the kbuild tree and commit 1dbdc6f177c6 ("kbuild/extable: Hook up
> sortextable into the build system") from the tip tree.
> 
> I used the Makefile bits from the kbuild tree and added the following
> patch as a merge fixup.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 7 May 2012 15:00:04 +1000
> Subject: [PATCH] kbuild: merge fix for sorting exceptions tables at build time

Looks correct, thanks.

Michal
