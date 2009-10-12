From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the i7core_edac tree with Linus'
	tree
Date: Mon, 12 Oct 2009 12:24:50 +0200
Message-ID: <20091012102450.GA20051@elte.hu>
References: <20091012142328.710881fe.sfr@canb.auug.org.au> <20091012050534.GC7629@liondog.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755582AbZJLKZm@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20091012050534.GC7629@liondog.tnic>
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <petkovbb@googlemail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Mauro Carvalho Chehab <mchehab@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org


* Borislav Petkov <petkovbb@googlemail.com> wrote:

> On Mon, Oct 12, 2009 at 02:23:28PM +1100, Stephen Rothwell wrote:
> > Today's linux-next merge of the i7core_edac tree got a conflict in
> > arch/x86/kernel/cpu/mcheck/mce.c between commit
> > f436f8bb73138bc74eb1c6527723e00988ad8a8a ("x86: EDAC: MCE: Fix MCE
> > decoding callback logic") from Linus' tree and commit
> > 699a7dbe1ffdf4b25c1475e45590b181c3e23087 ("edac_mce: Add an interface
> > driver to report mce errors via edac") from the i7core_edac tree.
> 
> The current way Ingo suggested is using an atomic notifier instead
> from within print_mce to convey MCE info to an EDAC driver, see
> http://marc.info/?l=linux-kernel&m=125455310112745&w=2
> 
> Ingo, what are your plans with that? I'm guessing the .33 timeframe?

yeah, that looks like .33 material. (unless it fixes a regression)
I have queued it up in tip:x86/mce.

Thanks,

	Ingo
