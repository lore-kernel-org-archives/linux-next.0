From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Please add fscrypt.git to linux-next
Date: Wed, 4 Jan 2017 22:51:01 +1100
Message-ID: <20170104225101.209ed782@canb.auug.org.au>
References: <20170104044424.jcztr7swmyjc2cwn@thunk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170104044424.jcztr7swmyjc2cwn@thunk.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Theodore Ts'o <tytso@mit.edu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Ted,

On Tue, 3 Jan 2017 23:44:24 -0500 Theodore Ts'o <tytso@mit.edu> wrote:
>
> Could you please add:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/tytso/fscrypt.git  master
> 
> To the linux-next tree?  I was previously feeding fscrypt changes by
> merging them into the ext4.git dev branch, but it will make life
> simpler if we have a separate git tree for it.
> 
> Linus has already accepted a pull request from the for-stable branch
> of fscrypt.git.  I plan to send a separate pull request for the master
> branch of fscrypt.git during the next merge window.

Added from tomorrow.  Should I add the for-stable branch as well (as a
bug fixes tree)?

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window. 

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and 
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

-- 
Cheers,
Stephen Rothwell 
sfr@canb.auug.org.au
