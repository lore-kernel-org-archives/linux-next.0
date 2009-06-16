From: Theodore Tso <tytso@mit.edu>
Subject: Re: linux-next: ext4 tree build failure
Date: Tue, 16 Jun 2009 18:11:47 -0400
Message-ID: <20090616221147.GC14788@mit.edu>
References: <20090616144413.50e975f9.sfr@canb.auug.org.au> <20090616203034.GB14788@mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from thunk.org ([69.25.196.29]:45979 "EHLO thunker.thunk.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753208AbZFPWLw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Jun 2009 18:11:52 -0400
Content-Disposition: inline
In-Reply-To: <20090616203034.GB14788@mit.edu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Pekka Enberg <penberg@cs.helsinki.fi>, Christoph Lameter <cl@linux-foundation.org>

On Tue, Jun 16, 2009 at 04:30:34PM -0400, Theodore Tso wrote:
> On Tue, Jun 16, 2009 at 02:44:13PM +1000, Stephen Rothwell wrote:
> > Hi Ted,
> > 
> > Today's linux-next build (powerpc ppc64_defconfig) failed like this after
> > the slab tree was merged:
> > 
> > In file included from fs/jbd2/checkpoint.c:26:
> > include/trace/events/jbd2.h:11: error: expected ')' before '(' token
> > include/trace/events/jbd2.h:31: error: expected ')' before '(' token
> 
> Hmm... I wonder why the slab tree would be messing with tracing
> include files.
> 
> Which slab tree is it?  Is it Pekka's?
> 
>       git://git.kernel.org/pub/scm/linux/kernel/git/penberg/slab-2.6.git
> 

Never mind, I see the problem.   Thanks for pointing it out!

      	      	      		 	    - Ted
