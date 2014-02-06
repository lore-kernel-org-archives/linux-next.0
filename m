From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: build failure after merge of the fscache tree
Date: Thu, 06 Feb 2014 17:17:16 +0000
Message-ID: <20893.1391707036@warthog.procyon.org.uk>
References: <20140206120843.5a8b2d7928243f52436ac02c@canb.auug.org.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140206120843.5a8b2d7928243f52436ac02c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, John Huston <jhuston@redhat.com>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> After merging the fscache tree, today's linux-next build (x86_64
> allmodconfig) failed like this:

Yep.  I'd forgotten that branch was in linux-next.  I've moved the patches to
fscache-experimental so that they don't pester Fengguang either.

David
