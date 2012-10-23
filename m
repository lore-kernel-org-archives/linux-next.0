From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Tue, 23 Oct 2012 13:02:34 -0700
Message-ID: <20121023130234.827aa5df.akpm@linux-foundation.org>
References: <20121023144221.5ae3061a11766df8175b959d@canb.auug.org.au>
	<20121023124414.61568323.akpm@linux-foundation.org>
	<1351021889.7502.55.camel@joe-AO722>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1351021889.7502.55.camel@joe-AO722>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kay Sievers <kay@vrfy.org>
List-Id: linux-next.vger.kernel.org

On Tue, 23 Oct 2012 12:51:29 -0700
Joe Perches <joe@perches.com> wrote:

> > btw, what's up with printk_syslog.h?  It includes two header files which it
> > doesn't need but fails to include the two it *does* need: printk_log.h
> > and types.h.
> > 
> > 
> 
> printk_syslog.c includes kernel.h (it includes types.h)
> and printk_log.h.
> 
> I think printk_syslog.h doesn't need printk_log.h

A general rule is that the header file shouldn't know or care what else
it's includer has included.  Ideally it shouldn't know or care what
else its includees have included, either.

A fun test would be

for i in *.h
	echo $i > foo.c
	make foo.o
done
