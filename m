From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: manual merge of the vfs tree with Linus' and te ext4
 trees
Date: Tue, 22 Apr 2014 02:34:56 +0100
Message-ID: <20140422013456.GT18016@ZenIV.linux.org.uk>
References: <20140422110459.ab3af554dd61297c61a568c2@canb.auug.org.au>
 <20140422011918.GA9441@thunk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140422011918.GA9441@thunk.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Theodore Ts'o <tytso@mit.edu>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, Apr 21, 2014 at 09:19:19PM -0400, Theodore Ts'o wrote:
> On Tue, Apr 22, 2014 at 11:04:59AM +1000, Stephen Rothwell wrote:
> > 
> > Today's linux-next merge of the vfs tree got a conflict in
> > fs/ext4/extents.c between rebased versions of commits from Linus' and the
> > ext4 trees and the same commits from the vfs tree.
> > 
> > I fixed it up (I just used the version from Linus' and the ext4 trees)
> > and can carry the fix as necessary (no action is required).
> > 
> > Al, this is why I asked you about checking with Ted about his tree being
> > rebased after you merged it into yours ...
> 
> Sorry, Al, I hadn't been aware you wanted to carrying some of these
> changes.  I had mentioned that I was planning on carrying them in the
> ext4 tree and including them for 3.15 because some of them were fixing
> bugs that had been introduced in the merge window.  Since no one
> objected, I thought everyone was on the same page about that plan.

*rechecks*
I have Cc'd you on this:

<quote>
Subject: Re: linus-next stats (Re: Linux 3.15-rc1 out, merge window closed)
Message-ID: <20140417203412.GB18016@ZenIV.linux.org.uk>
[snip]
one non-trivial in ext4 that I've dealt with by merging a piece of ext4
branch up to the relevant point.  As long as ext4.git#dev isn't rebased,
everything should remain fine, when/if it does I'll just redo that merge.
BTW, ext4 side of that thing is *still* not quite right - playing with
rlimit allows one to smuggle an unaligned write past that check...
</quote>

I'll rebase that thing...
