From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Thu, 6 Mar 2014 17:38:22 -0800
Message-ID: <20140306173822.1f4fed3a.akpm@linux-foundation.org>
References: <20140306192234.62ad3ac104a2adc16752b033@canb.auug.org.au>
	<20140306134848.7aabdc426fbad30f6e818631@linux-foundation.org>
	<20140307115744.5c3d5475af77726dc6c5a76b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:37262 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751359AbaCGBeh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 6 Mar 2014 20:34:37 -0500
In-Reply-To: <20140307115744.5c3d5475af77726dc6c5a76b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Lameter <cl@linux.com>

On Fri, 7 Mar 2014 11:57:44 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Andrew,
> 
> On Thu, 6 Mar 2014 13:48:48 -0800 Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > Yes, I've disabled the whole series for now.  Some of these errors
> > appear to be caused by compiler mishandling, so it's going to be
> > difficult :(
> 
> So, by "the whole series" do you mean just/all these:
> 
> percpu-add-raw_cpu_ops.patch
> ...
> sh-replace-__get_cpu_var-uses.patch

Yep.  Commented out in http://ozlabs.org/~akpm/mmots/series

> If so, I will remove them from my tree today (if you don't get around to
> a new mmotm before then).

Cool.
