From: Josh Boyer <jwboyer@gmail.com>
Subject: Re: linux-next: old trees
Date: Tue, 17 Sep 2013 08:53:16 -0400
Message-ID: <CA+5PVA6YxDCFbYbBdds1P-k3TPQbcp=VOcKdzRrpfSSk8y3gmg@mail.gmail.com>
References: <20130917170124.0afa2e103a9977355ad7c72c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130917170124.0afa2e103a9977355ad7c72c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linus <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On Tue, Sep 17, 2013 at 3:01 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> This message is bcc'd to each of the contacts for the trees listed below,
> so apologies if you get two copies.
>
> I have been inspired to check the ages of the trees included in
> linux-next.  Below I have listed all the trees that have not been
> commited to in the past 6 months.  Please let me know if the tree is not
> longer in use.  I don't mind keeping these trees in linux-next if they
> will have continued use, but would like to remove any that are no longer
> needed.
>
> Tree            Last commit
> ----            -----------
> 4xx             1 year, 4 months ago

This is subarch is basically in maintenance mode.  There have only
been a handful of patches that have been submitted over the past year,
and I've ACKed them for Ben to bring in via his tree.  The arch isn't
dead, but it's certainly not going to have much in the way of new
changes.  The overall powerpc tree is probably sufficient for
linux-next.

josh
