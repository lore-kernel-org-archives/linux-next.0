From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Can you add the binfmt_misc tree to linux-next?
Date: Mon, 27 Jun 2016 16:57:50 -0700
Message-ID: <1467071870.2264.55.camel@HansenPartnership.com>
References: <1467044198.2264.19.camel@HansenPartnership.com>
	 <20160628092914.7ab1b37e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:45176 "EHLO
	bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752002AbcF0X5y (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 27 Jun 2016 19:57:54 -0400
In-Reply-To: <20160628092914.7ab1b37e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-fsdevel@vger.kernel.org, Linux Containers <containers@lists.linux-foundation.org>, linux-next@vger.kernel.org

On Tue, 2016-06-28 at 09:29 +1000, Stephen Rothwell wrote:
> Hi James,
> 
> On Mon, 27 Jun 2016 09:16:38 -0700 James Bottomley <
> James.Bottomley@HansenPartnership.com> wrote:
> > 
> > Since I'd effectively become binfmt_misc maintainer when these 
> > patches get merged on the last person to touch it owns it 
> > principle, it makes sense to begin now more formally.  The tree is
> > at
> > 
> > git://git.kernel.org/pub/scm/linux/kernel/git/jejb/binfmt_misc.git
> > for-next
> > 
> > It currently contains four patches adding the container emulation
> > infrastructure from the persistent-handlers branch.
> 
> Added from today.  I only found 3 patches, though:
> 
> 4af75df6a410 binfmt_misc: add F option description to documentation
> 948b701a607f binfmt_misc: add persistent opened binary handler for
> containers
> 9a08c352d053 fs: add filp_clone_open API

Yes, that's right, sorry, I can't count.

> Thanks for adding your subsystem tree as a participant of linux-next.
>   As you may know, this is not a judgement of your code.  The purpose 
> of linux-next is for integration testing and to lower the impact of
> conflicts between subsystems in the next merge window. 
> 
> You will need to ensure that the patches/commits in your tree/series
> have
> been:
>      * submitted under GPL v2 (or later) and include the 
> Contributor's Signed-off-by,
>      * posted to the relevant mailing list,
>      * reviewed by you (or another maintainer of your subsystem
> tree),
>      * successfully unit tested, and 
>      * destined for the current or next Linux merge window.
> 
> Basically, this should be just what you would send to Linus (or ask 
> him to fetch).  It is allowed to be rebased if you deem it necessary.

Thanks,

James
