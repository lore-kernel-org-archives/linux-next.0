From: "J. Bruce Fields" <bfields@fieldses.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the nfsd tree
Date: Thu, 24 Aug 2017 22:37:15 -0400
Message-ID: <20170825023715.GC26099@fieldses.org>
References: <20170825084821.2870bbb7@canb.auug.org.au>
 <20170825022141.GB26099@fieldses.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170825022141.GB26099@fieldses.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Aug 24, 2017 at 10:21:41PM -0400, J. Bruce Fields wrote:
> On Fri, Aug 25, 2017 at 08:48:21AM +1000, Stephen Rothwell wrote:
> > Hi Bruce,
> > 
> > Commit
> > 
> >   1b7f1a85c0fa ("opdesc will be useful outside nfs4proc.c")
> > 
> > is missing a Signed-off-by from its author and committer.
> 
> Fixed, thanks.--b.

And, sorry, somehow I lost your other message, but: the compiler errors
should also have been fixed.  (As should be the testing error that let
them slip through--I thought I had CONFIG_NFSD_PNFS turned on in my
testing, but I didn't.)

--b.
