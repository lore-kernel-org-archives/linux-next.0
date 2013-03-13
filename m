From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: linux-next: unneeded merge in the security tree
Date: Tue, 12 Mar 2013 22:30:26 -0400
Message-ID: <20130313023026.GD16919@thunk.org>
References: <7vtxog5msj.fsf@alter.siamese.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <git-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7vtxog5msj.fsf@alter.siamese.dyndns.org>
 <CA+55aFwHJtOU4Qzt3XZsER165kTc5P0ATQP2wPHvuUiVic8bnA@mail.gmail.com>
Sender: git-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>, Junio C Hamano <gitster@pobox.com>
Cc: James Morris <jmorris@namei.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Git Mailing List <git@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Mar 12, 2013 at 02:30:04PM -0700, Junio C Hamano wrote:
> Theodore Ts'o <tytso@mit.edu> writes:
> 
> > [remote "origin"]
> > 	url = git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
> > 	fetch = +refs/heads/master:refs/heads/master
> > 	mergeoptions = --ff-only
> >
> 
> Is there an escape hatch for that rare case?  IOW, how does a
> submaintainer who configured the above to override --ff-only?

Hmm, maybe we would need to add a --no-ff-only?  Or they could just
do:

	git fetch origin
	git merge FETCH_HEAD

On Tue, Mar 12, 2013 at 02:28:39PM -0700, Linus Torvalds wrote:
>
> Of course, I'm not really sure if we want to list the flags. Maybe
> it's better to just introduce the notion of "upstream" directly, and
> make that a flag, and make "origin" default to that when you clone.
> And then have git use different heurstics for pulling upstream (like
> warning by default when doing a back-merge, perhaps?)

What if git automaticallly set up the origin branch to have a certain
set of mergeoptions by default?  That would probably be right for most
users, but it makes it obvious what's going on when they take a look
at the .git/config file, and doesn't make the remote that happens to
have the name "origin" as having certain magic properties.  Using a
set of mergeoptions would also be bit more general, and might have
applications in the future.

     	      	       	  	 	       - Ted
