From: Michel Lespinasse <walken@google.com>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Sun, 5 Aug 2012 22:01:14 -0700
Message-ID: <CANN689GqydNH0-gisSfUPtGKAHVajzZ4KQCTKoJ7J76dJ8zVbg@mail.gmail.com>
References: <20120806134318.8af35d047e255fd25398210b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120806134318.8af35d047e255fd25398210b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Steven Whitehouse <swhiteho@redhat.com>
List-Id: linux-next.vger.kernel.org

On Sun, Aug 5, 2012 at 8:43 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Caused by commit 5599fe1ab023 ("rbtree: empty nodes have no color") from
> the akpm tree interacting with commit cde7c325077b ("GFS2: Add structure
> to contain rgrp, bitmap, offset tuple") from the gfs2 tree.
>
> I have applied the following merge fix patch (which is probably not
> sufficient).

You are right that this is insufficient - gfs2 is using
RB_EMPTY_NODE() to check for nodes not being inserted on any rbtree,
so it must use RB_CLEAR_NODE() for initialization.

Will attach a patch as a reply to this.

I am surprised how fast these rb_init_node() calls are spreading.
Should I send Linus a patch removing that function so he could include
it in v3.6 and avoid having to deal with all these new uses ?

-- 
Michel "Walken" Lespinasse
A program is never fully debugged until the last user dies.
