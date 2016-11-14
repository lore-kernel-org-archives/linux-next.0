From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: linux-next: manual merge of the sound tree with the jc_docs
 tree
Date: Mon, 14 Nov 2016 09:11:59 -0700
Message-ID: <20161114091159.670ada51@lwn.net>
References: <20161114111553.533d5615@canb.auug.org.au>
        <20161113175628.7906efa8@lwn.net>
        <s5ha8d2ebhy.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tex.lwn.net ([70.33.254.29]:38808 "EHLO vena.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933017AbcKNQMB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Nov 2016 11:12:01 -0500
In-Reply-To: <s5ha8d2ebhy.wl-tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, SeongJae Park <sj38.park@gmail.com>

On Mon, 14 Nov 2016 09:01:13 +0100
Takashi Iwai <tiwai@suse.de> wrote:

> > Sigh.  I'm glad this work is being done, but if we're going to create
> > some coordinated documentation it might be good to involve the docs
> > maintainer when doing it...  
> 
> Sorry, will put you guys in Cc at the next time (although all
> conversions have been done in the sound tree).

That's kind of my point.  The sound tree is not an appropriate place to be
making changes to files like Documentation/index.rst.

> > In this case, I would have liked the chance to comment.  This
> > documentation belongs in the driver-api document, not the top-level
> > one. So, in an ideal world, I'd like to see this stuff moved there,
> > preferably with the patches going though the docs tree.  
> 
> If there needs any other changes, feel free to merge my
> topic/restize-docs branch into yours and keep working there:
>   git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
> topic/resize-docs
> 
> It's based on vanilla 4.9-rc4, so it must be clean to be merged.  A
> few misc fixes will come up in for-next branch, but they should be
> harmless to your changes -- at least the api-related changes won't be
> touched.

OK, I'll probably do that; expect me to run a patch by you that moves it
to the proper place in the hierarchy.

Thanks,

jon
