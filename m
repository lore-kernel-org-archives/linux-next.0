From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Tue, 30 May 2017 13:13:47 +1000
Message-ID: <20170530131347.23024992@canb.auug.org.au>
References: <20170529160209.5230c05b@canb.auug.org.au>
        <20170529211505.GP3956@linux.vnet.ibm.com>
        <20170530114050.2b702cc1@canb.auug.org.au>
        <1496109266.2618.5.camel@perches.com>
        <20170530021404.GT3956@linux.vnet.ibm.com>
        <1496110825.2618.7.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50063 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750839AbdE3DNu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 29 May 2017 23:13:50 -0400
In-Reply-To: <1496110825.2618.7.camel@perches.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: paulmck@linux.vnet.ibm.com, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mike Frysinger <vapier@gentoo.org>, Steven Miao <realmz6@gmail.com>

Hi Joe,

On Mon, 29 May 2017 19:20:25 -0700 Joe Perches <joe@perches.com> wrote:
>
> On Mon, 2017-05-29 at 19:14 -0700, Paul E. McKenney wrote:
> > On Mon, May 29, 2017 at 06:54:26PM -0700, Joe Perches wrote:  
> > > On Tue, 2017-05-30 at 11:40 +1000, Stephen Rothwell wrote:  
> > > > Hi Paul,
> > > >   
> > > > > On Mon, 29 May 2017 14:15:05 -0700 "Paul E. McKenney" <paulmck@linux.vnet.ibm.com> wrote:
> > > > > 
> > > > > Anyone see any other options?  
> > > 
> > > My preferred option would be removing pr_fmt
> > > and adding a couple new macros.  
> > 
> > Not sure how to evaluate yours and Stephen's changes, but I reverted my
> > conversion to a macro based on the hope that something good will come
> > of this effort.  ;-)  
> 
> Stephen's suggestion makes the format and arguments
> have an apparent mismatch.  What I suggested hides
> the "module %s: ", mod->name bit in the macros (like
> the older pr_fmt use), allows anyone else to #define
> pr_fmt to taste, and keeps the format and arguments in
> agreement.

Yours is much better, mine was just a quick hack ... consider yours

Acked-by: Stephen Rothwell <sfr@canb.auug.org.au>

-- 
Cheers,
Stephen Rothwell
