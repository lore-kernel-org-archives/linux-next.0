From: Chris Perl <cperl@janestreet.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the nfs-anna tree
Date: Mon, 17 Dec 2018 08:59:58 -0500
Message-ID: <CAAih9mj+u8Ec6=3K53_x8S-tHz_dXHORMfqZWsAnMS1WLzgz-w@mail.gmail.com>
References: <20181216171933.2e4f5be6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181216171933.2e4f5be6@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Anna Schumaker <Anna.Schumaker@netapp.com>, Trond Myklebust <trondmy@gmail.com>, NFS Mailing List <linux-nfs@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Sun, Dec 16, 2018 at 1:19 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
> Commit
>
>   748d6fd8d297 ("NFS: nfs_compare_mount_options always compare auth flavors.")
>
> is missing a Signed-off-by from its author.

Whoops.  Sorry about that (I forgot to run it through checkpatch.pl).

Should I resend a fresh patch with the Signed-off-by included or is it
enough to just assert in this email that I wrote it and have the right
to pass it on?  If the latter is sufficient, then I do assert those
things.  If not, I'm happy to resend.
