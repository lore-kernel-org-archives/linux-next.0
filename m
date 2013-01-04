From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: build failure after merge of the pekey tree
Date: Fri, 04 Jan 2013 09:48:11 +0000
Message-ID: <19929.1357292891@warthog.procyon.org.uk>
References: <20130104120823.6ac07043cfdaad89d9e5b006@canb.auug.org.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130104120823.6ac07043cfdaad89d9e5b006@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> After merging the pekey tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> ERROR: "modsign_keyring" [crypto/asymmetric_keys/pefile_key_parser.ko] undefined!

Interesting.  That first one isn't due to a missing EXPORT_SYMBOL_GPL().  That
is there.  The problem is that linux/export.h is not #included.  Why does the
C file even build, I wonder?

Anyway, the revised version is pushed.

David
