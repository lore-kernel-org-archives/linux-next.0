From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Thu, 15 Jun 2017 12:12:20 -0700
Message-ID: <20170615121220.4331a37b0fb736ec9da4e423@linux-foundation.org>
References: <20170605170117.6a1fc15e@canb.auug.org.au>
        <20170615113548.3e4edcf4@canb.auug.org.au>
        <CAGXu5jJyjymPfRNcKrRruYzZFUR-W8H7EWUnYR-6PJi3HcQ+-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGXu5jJyjymPfRNcKrRruYzZFUR-W8H7EWUnYR-6PJi3HcQ+-A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <keescook@chromium.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Micay <danielmicay@gmail.com>
List-Id: linux-next.vger.kernel.org

On Wed, 14 Jun 2017 18:56:30 -0700 Kees Cook <keescook@chromium.org> wrote:

> >> Caused by commit
> >>
> >>   088a5ecf7581 ("include/linux/string.h: add the option of fortified string.h functions")
> >>
> >> We really need to fix all the known problems it detects *before*
> >> merging this commit ...
> >>
> >> I have reverted it for today.
> >
> > I am still needing to revert this every day ...
> 
> I sent a series for -mm (or maintainers) to merge that should catch
> everything. Do you want me to carry it in my kspp tree instead? (My
> original intention was to carry all the fixes and the fortify patch in
> kspp but akpm took it into -mm somewhat unexpectedly, not that I'm
> complaining.)

This is all getting a bit foggy in my mind.  Can we please have a full
resend of everything?  Sufficient to hopefully produce a tree which has
no build-time or run-time regressions?  Including the buildbot's
recently-reported alpha and xtensa issues?
