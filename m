From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the tty tree with the jc_docs tree
Date: Tue, 8 Nov 2016 20:55:26 +0100
Message-ID: <20161108195526.GA30597@kroah.com>
References: <20161108163013.24d165f3@canb.auug.org.au>
 <20161108101554.GA17244@kroah.com>
 <8b7599f2-6933-9636-7326-6c7fd08ddb16@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8b7599f2-6933-9636-7326-6c7fd08ddb16@suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Slaby <jslaby@suse.cz>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jonathan Corbet <corbet@lwn.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@s-opensource.com>
List-Id: linux-next.vger.kernel.org

On Tue, Nov 08, 2016 at 07:40:53PM +0100, Jiri Slaby wrote:
> On 11/08/2016, 11:15 AM, Greg KH wrote:
> > On Tue, Nov 08, 2016 at 04:30:13PM +1100, Stephen Rothwell wrote:
> >> Hi Greg,
> >>
> >> Today's linux-next merge of the tty tree got a conflict in:
> >>
> >>   Documentation/VGA-softcursor.txt
> >>
> >> between commits:
> >>
> >>   27641b953c54 ("Documentation/VGA-softcursor.txt: convert to ReST markup")
> >>   9d85025b0418 ("docs-rst: create an user's manual book")
> >>
> >> from the jc_docs tree and commit:
> >>
> >>   b9c8b7fc252c ("vgacon: remove prehistoric macros")
> >>
> >> from the tty tree.
> >>
> >> I fixed it up (I deleted it - since 9d85025b0418 moved it - but that
> >> means it may need fixing up in its new location to match any relevant
> >> changes in b9c8b7fc252c) and can carry the fix as necessary. This is
> >> now fixed as far as linux-next is concerned, but any non trivial
> >> conflicts should be mentioned to your upstream maintainer when your
> >> tree is submitted for merging.  You may also want to consider
> >> cooperating with the maintainer of the conflicting tree to minimise any
> >> particularly complex conflicts.
> > 
> > Thanks, I'll work on sending a documentation patch after 4.10-rc1 to fix
> > this up.
> 
> I have the change in my tree already:
> https://git.kernel.org/cgit/linux/kernel/git/jirislaby/linux.git/commit/?h=devel&id=c4321f11b3ea88fc1c756a087869c09e89f2d299
> 
> If you want me to send that as a separate patch (or any other action),
> please let me know.

Can you send it to the documentation tree so it doesn't get lost?

thanks for doing this,

greg k-h
