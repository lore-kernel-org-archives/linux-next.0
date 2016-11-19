From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: linux-next: manual merge of the sound tree with the jc_docs tree
Date: Fri, 18 Nov 2016 16:22:18 -0800
Message-ID: <20161119002218.6k5snf7srxhds4ah@intel.com>
References: <20161114111553.533d5615@canb.auug.org.au>
 <20161113175628.7906efa8@lwn.net>
 <s5ha8d2ebhy.wl-tiwai@suse.de>
 <20161118163312.46505e6f@lwn.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:15163 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752686AbcKSAWU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 18 Nov 2016 19:22:20 -0500
Content-Disposition: inline
In-Reply-To: <20161118163312.46505e6f@lwn.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Takashi Iwai <tiwai@suse.de>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>

On Fri, Nov 18, 2016 at 04:33:12PM -0700, Jonathan Corbet wrote:
> On Mon, 14 Nov 2016 09:01:13 +0100
> Takashi Iwai <tiwai@suse.de> wrote:
> 
> > > In this case, I would have liked the chance to comment.  This
> > > documentation belongs in the driver-api document, not the top-level one.
> > > So, in an ideal world, I'd like to see this stuff moved there, preferably
> > > with the patches going though the docs tree.  
> > 
> > If there needs any other changes, feel free to merge my
> > topic/restize-docs branch into yours and keep working there:
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git topic/resize-docs
> 
> OK, I've done that, so this series will show up in docs-next; hopefully
> the merge conflicts will be resolved in the process.
> 
> I had said that I really wanted to move it all under driver-api and put
> it into that manual, but, looking at what's there, it's not that simple.
> The driver API parts of that manual belong there, but some of the
> information is user-oriented.  A long-term goal is to separate out those
> two types of information so that interested readers can more easily find
> the information relevant to them.  But that won't happen for 4.10..:)  So
> I'll leave things as they are for now.
> 
> (Note also that the driver API manual already has a section on sound
> devices:
> 
> 	http://static.lwn.net/kerneldoc/driver-api/sound.html
> 
> This came from the driver DocBook conversion a while back.  At some point
> we should really pull all that stuff together into a single document).
> 
> Thanks again for doing this conversion,
> 
> jon

Given that there is now a directory for TPM rst documentation do you
still want all changes to your tree or is it sufficient to just cc
linux-doc?

Thanks for fixing the issues!

/Jarkko
