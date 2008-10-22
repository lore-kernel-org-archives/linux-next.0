From: Johannes Schindelin <Johannes.Schindelin@gmx.de>
Subject: Re: linux-next: stackprotector tree build failure
Date: Wed, 22 Oct 2008 19:41:18 +0200 (CEST)
Message-ID: <alpine.DEB.1.00.0810221908100.22125@pacific.mpi-cbg.de.mpi-cbg.de>
References: <20081022131124.a572b11f.sfr@canb.auug.org.au> <20081022043227.GA31413@elte.hu> <20081022182149.f89fe88d.sfr@canb.auug.org.au> <20081022072923.GC27637@elte.hu> <20081022192725.5f5de711.sfr@canb.auug.org.au> <20081022083139.GA4369@elte.hu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.gmx.net ([213.165.64.20]:45576 "HELO mail.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1757582AbYJVReX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 22 Oct 2008 13:34:23 -0400
In-Reply-To: <20081022083139.GA4369@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Junio C Hamano <gitster@pobox.com>, git@vger.kernel.org

Hi,

On Wed, 22 Oct 2008, Ingo Molnar wrote:

> 
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > On Wed, 22 Oct 2008 09:29:23 +0200 Ingo Molnar <mingo@elte.hu> wrote:
> > >
> > > I've Cc:-ed Junio and the Git list as a general FYI - but it must be 
> > > frustrating to get such a bugreport, because i have no reproducer.
> > > 
> > > git-rerere sometimes seems to be picking up the wrong resolution. VERY 
> > > rarely.
> > > 
> > > It seems random and content dependent. Once it happened to 
> > > arch/x86/kernel/traps_32.c and now to kernel/fork.c. Along the ~170 
> > > successful resolutions i have in my tree right now. And i do many 
> > > conflict resolutions every day - and it happened only once every 6 
> > > months or so.
> > > 
> > > (the arch/x86/kernel/traps_32.c one happened regularly, that's why i 
> > > thought it's content sha1 dependent, and not some corruption.)
> > > 
> > > Next time it happens i'll be on the watchout and will save the complete 
> > > tree.
> > 
> > I think rerere matches preimages on the SHA1 of the conflict (or its 
> > reverse), so sufficiently similar pieces of code will match.  I would 
> > expect things like ext2/3/4 to be candidates.  Did the traps_32.c one 
> > match one for traps_64.c?
> > 
> > I may be mistaken, but I once followed the code in rerere to try to 
> > figure out how to fix a resolution.
> 
> the traps_32.c one was that git-rerere put in a traps_64.c end result. 
> So i ended up with a 32-bit kernel that tried to build a 64-bit piece of 
> code - fireworks. That condition persisted - i had to fix it up manually 
> all the time i integrated that portion of the tree. That too was i think 
> centered around a header file chunk - perhaps the #include section of 
> traps_32.c and traps_64.c was similar enough in that section?

I think it might be in order to explain how git-rerere works internally:

- in case of a conflicts, the files' conflicts are written into the 
  rr-cache _per file_.

  First, the human readable stuff after the "<<<", "|||" and ">>>" lines 
  is removed.

  Then, the "||| ... ===" part is removed, too (in effect turning the 
  diff3-style conflicts into an RCS merge-style conflicts).

  The result is recorded as "preimage".  The conflict is identified by the 
  SHA-1 of _just_ the conflicts (including the "<<<", "===" and ">>>" 
  lines).

  After all the conflicted files have been handled, a list is written to 
  the file "MERGE_RR" containing the SHA-1s of the conflicts together with 
  the file names.

- when committing, the files whose conflicts were resolved are recorded 
  verbatim in the file "postimage".

Now, when rerere is called again and there are conflicted files, again the 
files' conflicts are identified by their SHA-1.  If a resolution exists, a 
3-way merge is performed with the recorded preimage (the 
original file with conflict lines) as base, the postimage (the originally 
resolved file) and the current file with conflict lines.

The idea being: the diff between the recorded preimage and postimage gives 
the resolution that you want, and the diff between the recorded preimage 
and the current file with conflict lines gives you the changes that 
happened to the file in-between.

So I think that you might hit the unfortunate case where two files 
happened to have the same conflicts, but you needed to resolve them one 
way for one file, and another way for the other file.

Ciao,
Dscho
