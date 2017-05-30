From: Joe Perches <joe@perches.com>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Mon, 29 May 2017 19:20:25 -0700
Message-ID: <1496110825.2618.7.camel@perches.com>
References: <20170529160209.5230c05b@canb.auug.org.au>
         <20170529211505.GP3956@linux.vnet.ibm.com>
         <20170530114050.2b702cc1@canb.auug.org.au>
         <1496109266.2618.5.camel@perches.com>
         <20170530021404.GT3956@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtprelay0102.hostedemail.com ([216.40.44.102]:48589 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750750AbdE3CUa (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 29 May 2017 22:20:30 -0400
In-Reply-To: <20170530021404.GT3956@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: paulmck@linux.vnet.ibm.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mike Frysinger <vapier@gentoo.org>, Steven Miao <realmz6@gmail.com>

On Mon, 2017-05-29 at 19:14 -0700, Paul E. McKenney wrote:
> On Mon, May 29, 2017 at 06:54:26PM -0700, Joe Perches wrote:
> > On Tue, 2017-05-30 at 11:40 +1000, Stephen Rothwell wrote:
> > > Hi Paul,
> > > 
> > > > On Mon, 29 May 2017 14:15:05 -0700 "Paul E. McKenney" <paulmck@linux.vnet.ibm.com> wrote:
> > > > 
> > > > Anyone see any other options?
> > 
> > My preferred option would be removing pr_fmt
> > and adding a couple new macros.
> 
> Not sure how to evaluate yours and Stephen's changes, but I reverted my
> conversion to a macro based on the hope that something good will come
> of this effort.  ;-)

Stephen's suggestion makes the format and arguments
have an apparent mismatch.  What I suggested hides
the "module %s: ", mod->name bit in the macros (like
the older pr_fmt use), allows anyone else to #define
pr_fmt to taste, and keeps the format and arguments in
agreement.
