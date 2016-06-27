From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Can you add the binfmt_misc tree to linux-next?
Date: Tue, 28 Jun 2016 09:29:14 +1000
Message-ID: <20160628092914.7ab1b37e@canb.auug.org.au>
References: <1467044198.2264.19.camel@HansenPartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <1467044198.2264.19.camel@HansenPartnership.com>
Sender: linux-fsdevel-owner@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org, Linux Containers <containers@lists.linux-foundation.org>
List-Id: linux-next.vger.kernel.org

Hi James,

On Mon, 27 Jun 2016 09:16:38 -0700 James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
>
> Since I'd effectively become binfmt_misc maintainer when these patches
> get merged on the last person to touch it owns it principle, it makes
> sense to begin now more formally.  The tree is at
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/jejb/binfmt_misc.git for-next
> 
> It currently contains four patches adding the container emulation
> infrastructure from the persistent-handlers branch.

Added from today.  I only found 3 patches, though:

4af75df6a410 binfmt_misc: add F option description to documentation
948b701a607f binfmt_misc: add persistent opened binary handler for containers
9a08c352d053 fs: add filp_clone_open API

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
