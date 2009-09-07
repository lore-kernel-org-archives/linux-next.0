From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: linux-next: slab tree build failure
Date: Mon, 7 Sep 2009 11:04:41 +0200
Message-ID: <20090907090441.GB4717@osiris.boeblingen.de.ibm.com>
References: <20090907153723.0c984c83.sfr@canb.auug.org.au>
 <84144f020909062310u37ecdddfw31c6cc9a22ccabd9@mail.gmail.com>
 <20090907173108.3c0148d7.sfr@canb.auug.org.au>
 <1252309426.4964.3.camel@penberg-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752531AbZIGJEm@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1252309426.4964.3.camel@penberg-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Pekka Enberg <penberg@cs.helsinki.fi>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Luis R. Rodriguez" <lrodriguez@atheros.com>, "John W. Linville" <linville@tuxdriver.com>, Catalin Marinas <catalin.marinas@arm.com>, npiggin@suse.de
List-Id: linux-next.vger.kernel.org

On Mon, Sep 07, 2009 at 10:43:46AM +0300, Pekka Enberg wrote:
> Aah, let me guess, CONFIG_SLQB? I guess I'll just rebase the damn tree
> and make it non-default. We need that anyway if we want to merge it to
> 2.6.32. I'll take a stab at it later this evening (my time zone).

Will SLQB be merged during the next merge window? Just realized that s390
doesn't boot with CONFIG_SLQB (crashes before the console is active).

I tend to ignore bugs which seem to be related to SLQB in linux-next,
but if it gets merged I might need to look deeper into this.
