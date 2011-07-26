From: Wu Fengguang <fengguang.wu@intel.com>
Subject: Re: linux-next: manual merge of the writeback tree with the vfs
 tree
Date: Tue, 26 Jul 2011 13:23:03 +0800
Message-ID: <20110726052303.GA3315@localhost>
References: <20110718173409.2885649b65937eb7caecf943@canb.auug.org.au>
 <20110726045812.GA32517@localhost>
 <20110726151451.e3385a5d969fddc210f186f8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110726151451.e3385a5d969fddc210f186f8@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dave Chinner <dchinner@redhat.com>, Christoph Hellwig <hch@infradead.org>, Al Viro <viro@ZenIV.linux.org.uk>
List-Id: linux-next.vger.kernel.org

Stephen,

On Tue, Jul 26, 2011 at 01:14:51PM +0800, Stephen Rothwell wrote:
> Hi,
> 
> On Tue, 26 Jul 2011 12:58:12 +0800 Wu Fengguang <fengguang.wu@intel.com> wrote:
> >
> > What should I do with the 2 conflicts for upstream merge?
> > 
> > I noticed that Linus just merged the vfs tree. So the obvious thing I
> > could do is to rebase writeback.git to Linus' tree and fix the
> > conflicts, and then ask Linus to pull the rebased writeback tree.
> > 
> > Or are there better practices?
> 
> Normally you just ask Linus to pull your tree and let him know that there
> are some conflicts and also ask him to let you know if he wants you to
> fix them up before merging.  He is a smart fellow, and if I worked it out,
> I am sure he can as well.  :-)
> 
> Some people pull Linus' tree into theirs and resolve the conflicts, but
> he prefers to do them himself usually.

Good point. Thank you for the nice guide!

Thanks,
Fengguang
