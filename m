From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the
 net/wireless tree
Date: Tue, 27 Oct 2009 09:23:14 -0700
Message-ID: <20091027162314.GA23768@kroah.com>
References: <20091027183503.5c398311.sfr@canb.auug.org.au>
 <20091027141325.GA17352@kroah.com>
 <20091027145631.GB15566@tuxdriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756118AbZJ0Q0L@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20091027145631.GB15566@tuxdriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "John W. Linville" <linville@tuxdriver.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Johannes Berg <johannes@sipsolutions.net>, Holger Schurig <hs4233@mail.mn-solutions.de>
List-Id: linux-next.vger.kernel.org

On Tue, Oct 27, 2009 at 10:56:31AM -0400, John W. Linville wrote:
> On Tue, Oct 27, 2009 at 07:13:25AM -0700, Greg KH wrote:
> > On Tue, Oct 27, 2009 at 06:35:03PM +1100, Stephen Rothwell wrote:
> > > Hi Greg,
> > > 
> > > Today's linux-next merge of the staging tree got conflicts in
> > > drivers/net/wireless/Kconfig between commits
> > > 3d23e349d807177eaf519d444677cee86b1a04cf ("wext: refactor") and
> > > 0465af8e03bdc6cd0b49dc5548671387a8674b69 ("libertas: separate libertas'
> > > Kconfig in it's own file") from the net/wireless tree and various commits
> > > ("... move driver to staging") from the staging tree.
> > > 
> > > I fixed it up (see below) and added a merge fixup (see further below) and
> > > can carry these as necessary (though it may be easier for everyone (i.e.
> > > me :-)) if these 4 staging tree commits are moved to the wireless
> > > tree ...).
> > 
> > John, I have no objection to these 4 commits going through your tree, if
> > it will make these types of merge issues go away.  If so, I have 4 more
> > patches that should be added, adding the TODO files for the drivers.  I
> > can send them to you if you want to take them.
> 
> Sure, that would be fine.  I did get copies of the TODO addition
> patches, but I deleted them as I had not yet seen this. :-(  Could
> you resend them to me?

Now sent.

thanks,

greg k-h
