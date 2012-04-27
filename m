From: Cyrill Gorcunov <gorcunov@openvz.org>
Subject: Re: linux-next: build warning after merge of the akpm tree
Date: Fri, 27 Apr 2012 10:40:15 +0400
Message-ID: <20120427064015.GB1899@moon>
References: <20120427154420.1161da65e7bcc2322857e6b2@canb.auug.org.au>
 <20120427062218.GA1899@moon>
 <20120427162858.857ce3348830abe5bd0f9bb0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120427162858.857ce3348830abe5bd0f9bb0@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>
List-Id: linux-next.vger.kernel.org

On Fri, Apr 27, 2012 at 04:28:58PM +1000, Stephen Rothwell wrote:
> Hi Cyrill,
> 
> > > Introduced by commit 5455a20be1a6 ("c/r: prctl: extend PR_SET_MM to set
> > > up more mm_struct entries").
> > 
> > Hi Stephen, thanks for report, have no idea how it happened, since
> > commit 5455a20be1a6 _has_ error = -EINVAL; line.
> 
> I blamed the wrong patch :-(
> 
> Commit 8f62e9e9ed ("c/r: prctl: simplify PR_SET_MM on mm::code/data
> assignment") removes the "error = -EINVAL".

Ah, could be. Please merge up the fix then (there were another patches
in Andrew's queue where this nit is fixed I think, but they are not yet
in -next). So this fix should do the trick. Thanks.

	Cyrill
