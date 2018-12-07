From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: linux-next: manual merge of the jc_docs tree with the fscrypt
 tree
Date: Fri, 7 Dec 2018 00:08:28 -0700
Message-ID: <20181207000828.3dead855@lwn.net>
References: <20181207115340.2465a854@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181207115340.2465a854@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Theodore Ts'o <tytso@mit.edu>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, NeilBrown <neilb@suse.com>, Eric Biggers <ebiggers@google.com>
List-Id: linux-next.vger.kernel.org

On Fri, 7 Dec 2018 11:53:40 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the jc_docs tree got a conflict in:
> 
>   Documentation/filesystems/index.rst
> 
> between commit:
> 
>   1b71a6809f96 ("fs-verity: add a documentation file")
> 
> from the fscrypt tree and commit:
> 
>   7bbfd9ad8eb2 ("Documentation: convert path-lookup from markdown to resturctured text")
> 
> from the jc_docs tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

That fix is as good as any, thanks.

jon
