From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: linux-next: manual merge of the kconfig tree with the kbuild
 tree
Date: Mon, 24 Aug 2009 20:33:13 -0400 (EDT)
Message-ID: <alpine.DEB.2.00.0908242032210.6710@gandalf.stny.rr.com>
References: <20090824113226.b61cccc6.sfr@canb.auug.org.au> <20090824083433.GA6147@streefland.net> <alpine.DEB.2.00.0908241052420.7587@gandalf.stny.rr.com> <20090825094427.b91e3329.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.124]:41435 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753960AbZHYAdN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 24 Aug 2009 20:33:13 -0400
In-Reply-To: <20090825094427.b91e3329.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dick Streefland <dick@streefland.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>


On Tue, 25 Aug 2009, Stephen Rothwell wrote:

> Hi Steve,
> 
> On Mon, 24 Aug 2009 10:54:04 -0400 (EDT) Steven Rostedt <rostedt@goodmis.org> wrote:
> >
> > On Mon, 24 Aug 2009, Dick Streefland wrote:
> > 
> > > My simplified script that you merged from the kbuild tree will also
> > > extract config information from ELF files. So both patches from the
> > > kconfig tree are not needed anymore.
> > 
> > OK what is the proper way to resolve this, before sending anything off to 
> > Linus?  Should I pull in Dick's tree and resolve the conficts myself, and 
> > let you repull? Or is something else recommended?
> 
> You could cherry-pick Dick's commit into your tree (and remove your
> conflicting commits by rebasing). Or you could rebase your work on top of
> Sam's kbuild tree (or merge Sam's tree) (but that would require Sam to
> guarantee that his tree won't be rebased). Or you could do the rebase and
> then just submit your tree to Sam for inclusion (instead of, or as well
> as, it being included in linux-next directly).  Or you could keep going
> the way you are and resolve the conflict once one of the trees has been
> merged into Linus' tree.
> 
> For the moment, I can keep resolving the conflict.

Yeah, lets just keep it as is for the moment. When Sam's is accepted into 
Linus's I'll rebase off of that. Assuming that Sam's will be accepted 
rather quickly ;-)

-- Steve
