From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: linux-next: manual merge of the sound tree with the jc_docs
 tree
Date: Sun, 13 Nov 2016 17:56:28 -0700
Message-ID: <20161113175628.7906efa8@lwn.net>
References: <20161114111553.533d5615@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161114111553.533d5615@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Takashi Iwai <tiwai@suse.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, SeongJae Park <sj38.park@gmail.com>
List-Id: linux-next.vger.kernel.org

On Mon, 14 Nov 2016 11:15:53 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the sound tree got a conflict in:
> 
>   Documentation/index.rst
> 
> between commits:
> 
>   799a545bb938 ("tpm: move documentation under Documentation/security")
>   ba42c574fc8b ("Documentation: Add HOWTO Korean translation into rst based build system")
> 
> from the jc_docs tree and commit:
> 
>   8551914a5e19 ("ALSA: doc: ReSTize alsa-driver-api document")
> 
> from the sound tree.

Sigh.  I'm glad this work is being done, but if we're going to create
some coordinated documentation it might be good to involve the docs
maintainer when doing it...

In this case, I would have liked the chance to comment.  This
documentation belongs in the driver-api document, not the top-level one.
So, in an ideal world, I'd like to see this stuff moved there, preferably
with the patches going though the docs tree.

(Thanks, Stephen, for fixing it up).

jon
