From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the vfs tree with Linus' tree
Date: Fri, 1 Dec 2017 10:36:02 +1100
Message-ID: <20171201103602.1b83eec7@canb.auug.org.au>
References: <20171129105329.41031142@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171129105329.41031142@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi Al,

On Wed, 29 Nov 2017 10:53:29 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Today's linux-next merge of the vfs tree got conflicts in several files
> due to commit:
> 
>   1751e8a6cb93 ("Rename superblock flags (MS_xyz -> SB_xyz)")
> 
> from Linus' tree and commit:
> 
>   c2c6773f9942 ("VFS: Roll out mount flag differentiation (MS_* -> SB_*) generally")
> 
> from the vfs tree.
> 
> I just dropped the vfs tree for today, can you please clean it up?

Ping?
-- 
Cheers,
Stephen Rothwell
