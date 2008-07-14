From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: Tree for July 14
Date: Mon, 14 Jul 2008 10:12:42 -0700
Message-ID: <20080714101242.ace33488.akpm@linux-foundation.org>
References: <20080714201249.947400d0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754487AbYGNRM7@vger.kernel.org>
In-Reply-To: <20080714201249.947400d0.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, 14 Jul 2008 20:12:49 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> With the opening of the merge window, I am hoping my job becomes easier
> again ... :-)

If past experience is a guide, it's about to get harder because

a) maintainers jam untested crap^W^Wrecently-received features into
   their trees so they don't miss the merge window and

b) a storm of git rejects turn up as Linus's tree starts to get changed.

Hopefully b) will improve, as "all" the new code has already gone
through linux-next merging.

As for a), well, it would be nice if people were to be careful about
that sort of thing.  In some ways it's justifiable - we _do_ have a
couple months to fix remaining glitches.  But one would think that when
fast-tracking new features, the code would at least get additional
review and testing to make up for it.
