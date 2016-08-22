From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: linux-next: build warnings after merge of the kbuild tree
Date: Mon, 22 Aug 2016 20:47:58 +1000
Message-ID: <20160822204758.5b2cff63@roar.ozlabs.ibm.com>
References: <20160817114443.67675413@canb.auug.org.au>
        <e6fbe17c-1981-1579-433d-88462d2efb58@suse.cz>
        <20160818110948.52f1322d@roar.ozlabs.ibm.com>
        <20160819133854.17a7b1ca@canb.auug.org.au>
        <20160819150914.36106b5b@canb.auug.org.au>
        <5babe9ef-0e3d-6975-9ba4-9a29a700b24d@suse.cz>
        <20160819204455.6351ffb8@roar.ozlabs.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f67.google.com ([209.85.220.67]:35828 "EHLO
        mail-pa0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754269AbcHVKsN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Aug 2016 06:48:13 -0400
In-Reply-To: <20160819204455.6351ffb8@roar.ozlabs.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, PowerPC <linuxppc-dev@lists.ozlabs.org>, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>

On Fri, 19 Aug 2016 20:44:55 +1000
Nicholas Piggin <npiggin@gmail.com> wrote:

> On Fri, 19 Aug 2016 10:37:00 +0200
> Michal Marek <mmarek@suse.cz> wrote:
> 
> > On 2016-08-19 07:09, Stephen Rothwell wrote:  

[snip]

> > > 
> > > I may be missing something, but genksyms generates the crc's off the
> > > preprocessed C source code and we don't have any for the asm files ...    
> > 
> > Of course you are right. Which means that we are losing type information
> > for these exports for CONFIG_MODVERSIONS purposes. I guess it's
> > acceptable, since the asm functions are pretty basic and their
> > signatures do not change.  
> 
> I don't completely agree. It would be nice to have the functionality
> still there.
> 
> What happens if you just run cmd_modversions on the as rule? It relies on
> !defined(__ASSEMBLY__), but we're feeding the result to genksyms, not as.
> It would require the header be included in the .S file and be protected for
> asm builds.


This seems like it *could* be made to work, but there's a few problems.

- .h files are not made for C consumption. Matter of manually adding the
ifdef guards, which isn't terrible.

- .S files do not all include their .h where the C declaration is. Also
will cause some churn but doable and maybe not completely unreasonable.

- genksyms parser barfs when it hits the assembly of the .S file. Best
way to fix that seems just send the #include and EXPORT_SYMBOL lines
from the .S to the preprocessor. That's a bit of a rabbit hole too, with
some .S files being included, etc.

I'm not sure what to do here. If nobody cares and we lose CRCs for .S
exports, then okay we can whitelist those relocs easily. If we don't want
to lose the functionality, the above might work but it's a bit intrusive
an is going to require another cycle of prep patches to go through arch
code first.

Or suggestions for alternative approach?

Thanks,
Nick
