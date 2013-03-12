From: Junio C Hamano <gitster@pobox.com>
Subject: Re: linux-next: unneeded merge in the security tree
Date: Tue, 12 Mar 2013 14:47:38 -0700
Message-ID: <7vppz45lz9.fsf@alter.siamese.dyndns.org>
References: <20130312100950.e45ef0e721492ff0d5fd7c8d@canb.auug.org.au>
 <alpine.LRH.2.02.1303121510270.25612@tundra.namei.org>
 <20130312041641.GE18595@thunk.org>
 <CA+55aFzFLDcN-1GKae6Xqrns59K1xOD_HPzuv2Lv1__fZpqFMw@mail.gmail.com>
 <20130312212027.GE14792@thunk.org>
 <CA+55aFwHJtOU4Qzt3XZsER165kTc5P0ATQP2wPHvuUiVic8bnA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+55aFwHJtOU4Qzt3XZsER165kTc5P0ATQP2wPHvuUiVic8bnA@mail.gmail.com> (Linus
 Torvalds's message of "Tue, 12 Mar 2013 14:28:39 -0700")
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Theodore Ts'o <tytso@mit.edu>, James Morris <jmorris@namei.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Git Mailing List <git@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Linus Torvalds <torvalds@linux-foundation.org> writes:

>  - I do think that we might want a "--no-signatures" for the specific
> case of merging signed tags without actually taking the signature
> (because it's a "upstream" repo). The "--ff-only" thing is *too*
> strict. Sometimes you really do want to merge in new code, disallowing
> it entirely is tough.

I agree that "--ff-only" thing is too strict and sometimes you would
want to allow back-merges, but when you do allow such a back-merge,
is there a reason you want it to be --no-signatures merge?  When a
subtree maintainer decides to merge a stable release point from you
with a good reason, I do not see anything wrong in recording that
the resulting commit _did_ merge what you released with a signature.
