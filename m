From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: linux-next: block tree build failure
Date: Wed, 8 Jul 2009 08:55:02 +0200
Message-ID: <20090708065502.GR23611@kernel.dk>
References: <20090707134908.e81b1556.sfr@canb.auug.org.au> <20090707063846.GY23611@kernel.dk> <20090708131713.61d9ea7b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1759905AbZGHGzU@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090708131713.61d9ea7b.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Zhang, Yanmin" <yanmin_zhang@linux.intel.com>
List-Id: linux-next.vger.kernel.org

On Wed, Jul 08 2009, Stephen Rothwell wrote:
> Hi Jens,
> 
> On Tue, 7 Jul 2009 08:38:46 +0200 Jens Axboe <jens.axboe@oracle.com> wrote:
> >
> > That is correct! I have just now updated for-next as well, so your next
> > pull should lose this fixup.
> 
> Except you left the call to wakeup_pdflush(0) in there ...  I will fix
> that up while Christoph's concerns are addressed.

Oops, belt and suspenders and all that... Sorry, fixing it up now.

-- 
Jens Axboe
