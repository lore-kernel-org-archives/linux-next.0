From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: Fixes tag needs some work in Linus' tree
Date: Wed, 20 Feb 2019 21:36:56 +0000
Message-ID: <28431.1550698616@warthog.procyon.org.uk>
References: <20190221073835.7a18f007@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190221073835.7a18f007@canb.auug.org.au>
Content-ID: <28430.1550698616.1@warthog.procyon.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, Linus Torvalds <torvalds@linux-foundation.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, James Morris <james.morris@microsoft.com>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> In commit
> 
>   822ad64d7e46 ("keys: Fix dependency loop between construction record and auth key")
> 
> Fixes tag
> 
>   Fixes: 7ee02a316600 ("keys: Fix dependency loop between construction record and auth key")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist

Oops.  I guess I pasted in the wrong commit details.

	commit 76181c134f87479fa13bf2548ddf2999055d34d4
	KEYS: Make request_key() and co fundamentally asynchronous

should've been it.

David
