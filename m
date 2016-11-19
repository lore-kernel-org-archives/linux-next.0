From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: linux-next: manual merge of the sound tree with the jc_docs
 tree
Date: Fri, 18 Nov 2016 17:39:35 -0700
Message-ID: <20161118173935.5fd1a747@lwn.net>
References: <20161114111553.533d5615@canb.auug.org.au>
        <20161113175628.7906efa8@lwn.net>
        <s5ha8d2ebhy.wl-tiwai@suse.de>
        <20161118163312.46505e6f@lwn.net>
        <20161119002218.6k5snf7srxhds4ah@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ms.lwn.net ([45.79.88.28]:40546 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752499AbcKSAjh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 18 Nov 2016 19:39:37 -0500
In-Reply-To: <20161119002218.6k5snf7srxhds4ah@intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>

On Fri, 18 Nov 2016 16:22:18 -0800
Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com> wrote:

> Given that there is now a directory for TPM rst documentation do you
> still want all changes to your tree or is it sufficient to just cc
> linux-doc?

For stuff in security/tpm?  It makes my life easier if documentation
patches come through my tree, but it's never going to be the case that
they all take that path.  I'm becoming increasingly insistent that changes
to the top-level makefiles and index.rst files need to come this way;
that way, Stephen doesn't need to send me so many polite merge-conflict
emails :)

For the rest, a CC is appreciated so that I know what's going on, but if
it works better for subsystem-specific documentation patches to go
through the relevant subsystem trees, then that's how it should be done.

Thanks,

jon
