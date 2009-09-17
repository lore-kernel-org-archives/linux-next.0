From: Dave Jones <davej@redhat.com>
Subject: Re: linux-next: cpufreq-current tree build warning
Date: Wed, 16 Sep 2009 23:17:59 -0400
Message-ID: <20090917031759.GB30706@redhat.com>
References: <20090917120651.f0cdf4c2.sfr@canb.auug.org.au> <20090917022726.GA30706@redhat.com> <20090917125556.1125d8ae.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1759919AbZIQDSF@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090917125556.1125d8ae.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kurt Roeckx <kurt@roeckx.be>
List-Id: linux-next.vger.kernel.org

On Thu, Sep 17, 2009 at 12:55:56PM +1000, Stephen Rothwell wrote:
 > so, no.
 > (origin/master is Linus' tree of about 2 hours ago, commit
 > ab86e5765d41a5eb4239a1c04d613db87bea5ed8 "Merge
 > git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core-2.6")
 > 
 > Looking further, this is the cpureq-current tree I am complaining about,
 > in the cpufreq tree, you also have:

Oh, from the 'fixes' branch ?  Just drop that for now, and only pick up 'next'
(though next pull request went to linus today, so the whole thing should be
 gone soon).

	Dave
