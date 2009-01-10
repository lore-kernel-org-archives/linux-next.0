From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: Tree for January 8 (percpu)
Date: Sat, 10 Jan 2009 16:48:31 +1030
Message-ID: <200901101648.32757.rusty@rustcorp.com.au>
References: <20090108171730.19a41e14.sfr@canb.auug.org.au> <496636AB.9000903@oracle.com> <20090109092322.fd43b3b6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:58574 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752936AbZAJGSr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 10 Jan 2009 01:18:47 -0500
In-Reply-To: <20090109092322.fd43b3b6.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Randy Dunlap <randy.dunlap@oracle.com>

On Friday 09 January 2009 08:53:22 Stephen Rothwell wrote:
> (Forward to Rusty)
> 
> On Thu, 08 Jan 2009 09:23:55 -0800 Randy Dunlap <randy.dunlap@oracle.com> wrote:
> >
> > Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Changes since 20090107:
> > > 
> > > Undropped tree:
> > > 	rr
> > > 
> > > Dropped trees (temporarily):
> > > 	ocfs2 (build problem)
> > > 	cpu_alloc (build problem)
> > 
> > 
> > When CONFIG_SMP=n, both arch/x86/include/asm/percpu.h and
> > include/asm-generic/percpu.h define both of
> > read_percpu_ptr() and read_percpu_var().

Erk... this header is a bit of a mess of 64bit/32bit UP/SMP defines.

I've thwacked it harder, thanks!
Rusty.
