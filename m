From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: linux-next: Tree for Apr 17 (objtool)
Date: Wed, 24 Apr 2019 11:03:57 -0500
Message-ID: <20190424160357.6olyocstevbz7wnw@treble>
References: <20190417173117.196b5ac6@canb.auug.org.au>
 <7114e2f5-0c1f-c5e4-177c-2a5c61d12d58@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7114e2f5-0c1f-c5e4-177c-2a5c61d12d58@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Apr 17, 2019 at 08:41:34AM -0700, Randy Dunlap wrote:
> On 4/17/19 12:31 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > News: there will be no linux-next release on Friday, Monday or Thursday
> > April 25.
> > 
> > Changes since 20190416:
> > 
> 
> on x86_64:
> 
>   CC      drivers/gpu/drm/i915/i915_gem_execbuffer.o
> drivers/gpu/drm/i915/i915_gem_execbuffer.o: warning: objtool: .altinstr_replacement+0x18: redundant UACCESS disable
> 
> 
> obj file is attached.

Peter,

I haven't looked at this, do you know if this is the same issue as the
other note from Randy, or something else?

-- 
Josh
