From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the target-bva tree with the
 target-updates tree
Date: Fri, 2 Jun 2017 09:28:46 +1000
Message-ID: <20170602092846.2ebba861@canb.auug.org.au>
References: <20170601141055.3b64fefc@canb.auug.org.au>
        <1496293179.16453.1.camel@sandisk.com>
        <1496293444.27407.184.camel@haakon3.risingtidesystems.com>
        <aff8f6fa-89b4-3dee-2c3f-68eae613fbba@sandisk.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <aff8f6fa-89b4-3dee-2c3f-68eae613fbba@sandisk.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bart Van Assche <bart.vanassche@sandisk.com>
Cc: "Nicholas A. Bellinger" <nab@linux-iscsi.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Bart,

On Thu, 1 Jun 2017 14:14:06 -0700 Bart Van Assche <bart.vanassche@sandisk.com> wrote:
>
> On 05/31/17 22:04, Nicholas A. Bellinger wrote:
> > Go ahead and get list review on drivers/target/ changes before pushing
> > them into linux-next, please.
> > 
> > Btw, I don't care if you queue up one's that do have at least two
> > Reviewed-bys into your tree, but everything that doesn't have
> > Reviewed-bys or Acked-by should not be going into linux-next.  
> 
> It is not your job to rewrite the rules for linux-next. I'm following
> the guidelines I received from Stephen in December 2016. You were copied
> on the e-mail with guidelines Stephen sent to me. See also
> https://www.spinics.net/lists/linux-next/msg38488.html.
> 
> Stephen, if anything would have changed in the meantime that I'm not
> aware of please let me know.

This is what I tell everyone:

"You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and 
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary."

Which is just what was in that message you pointed to.  Note the
"reviewed by you (or another maintainer of your subsystem tree)".  This
is more meant for the top level maintainers, but implies that the
patches have been reviewed, tested and are as ready as possible for
merging into the next level up tree.

-- 
Cheers,
Stephen Rothwell
