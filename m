From: Christoph Lameter <cl@linux.com>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Fri, 7 Mar 2014 11:05:49 -0600 (CST)
Message-ID: <alpine.DEB.2.10.1403071103040.21846@nuc>
References: <20140306192234.62ad3ac104a2adc16752b033@canb.auug.org.au> <20140306134848.7aabdc426fbad30f6e818631@linux-foundation.org> <20140307115744.5c3d5475af77726dc6c5a76b@canb.auug.org.au> <20140306173822.1f4fed3a.akpm@linux-foundation.org>
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140306173822.1f4fed3a.akpm@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, 6 Mar 2014, Andrew Morton wrote:

> > So, by "the whole series" do you mean just/all these:
> >
> > percpu-add-raw_cpu_ops.patch
> > ...
> > sh-replace-__get_cpu_var-uses.patch
>
> Yep.  Commented out in http://ozlabs.org/~akpm/mmots/series
>
> > If so, I will remove them from my tree today (if you don't get around to
> > a new mmotm before then).
>
> Cool.

I need at least the initial 5 patches that establish the framework in
-next and do the debugging in order to make further progress on this one.

The rest are bits and pieces that may require some detail work.
