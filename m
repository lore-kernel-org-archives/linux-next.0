From: Stephen Smalley <sds@tycho.nsa.gov>
Subject: Re: linux-next: manual merge of the selinux tree
Date: Tue, 08 Jul 2008 08:19:35 -0400
Message-ID: <1215519575.27975.218.camel@moss-spartans.epoch.ncsc.mil>
References: <20080707225130.ca52d527.sfr@canb.auug.org.au>
	 <Xine.LNX.4.64.0807080042090.11950@us.intercode.com.au>
	 <1215442054.27975.85.camel@moss-spartans.epoch.ncsc.mil>
	 <20080708014950.1caa8a64.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zombie.ncsc.mil ([144.51.88.131]:43790 "EHLO zombie.ncsc.mil"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752509AbYGHMVC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Jul 2008 08:21:02 -0400
In-Reply-To: <20080708014950.1caa8a64.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: James Morris <jmorris@namei.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Eric Paris <eparis@redhat.com>, Paul Moore <paul.moore@hp.com>, linux-next@vger.kernel.org


On Tue, 2008-07-08 at 01:49 -0700, Andrew Morton wrote:
> On Mon, 07 Jul 2008 10:47:34 -0400 Stephen Smalley <sds@tycho.nsa.gov> wrote:
> 
> > 
> > On Tue, 2008-07-08 at 00:43 +1000, James Morris wrote:
> > > On Mon, 7 Jul 2008, Stephen Rothwell wrote:
> > > 
> > > > Hi all,
> > > > 
> > > > Today's linux-next merge of the selinux tree got a conflict in
> > > > fs/proc/task_mmu.c between commit
> > > > 5d7e0d2bd98ef4f5a16ac9da1987ae655368dd6a ("Fix pagemap_read() use of
> > > > struct mm_walk") from Linus' tree and commit
> > > > ca9b1a1413bac6ea5e5c8cb81044a39bdb3b4bc8 ("Security: split proc ptrace
> > > > checking into read vs. attach") from the selinux tree.
> > > > 
> > > > The former removed some of the code that the latter changed.  It is
> > > > probably worth a check on the code in pagemap_read to make sure I got it
> > > > right.
> > > 
> > > I couldn't locate your updated version, but have resolved it in my own 
> > > tree (which is being rebased).  
> > > 
> > > One thing we need to understand is why there were two separate 
> > > ptrace_may_attach() calls in the earlier version of pagemap_read().
> > 
> > It could sleep in between the two calls.
> > 
> 
> This is basically meaningless?  Other threads could be running, accessing
> this mm_struct.  Other processes can be doing stuff.  Preemption can
> happen.
> 
> Are we missing some locking here?

I think so.  mm_for_maps() seems like the way to go - holds task lock
across both mm extraction/validation and __ptrace_may_attach check.

I'm guessing that the writer of pagemap_read took his cue from mem_read,
which likewise does two checks (via check_mem_permission), seemingly
with the same problem.

environ_read() only checks ptrace_may_attach on entry independent of mm
extraction.  Seemingly unsafe unless I'm missing something.

-- 
Stephen Smalley
National Security Agency
