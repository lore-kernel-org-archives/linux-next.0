From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: manual merge of the userns tree with the vfs tree
Date: Tue, 19 Jun 2018 05:11:45 -0500
Message-ID: <874lhz9jby.fsf@xmission.com>
References: <20180619145605.1eb8e86f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180619145605.1eb8e86f@canb.auug.org.au> (Stephen Rothwell's
        message of "Tue, 19 Jun 2018 14:56:05 +1000")
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> Today's linux-next merge of the userns tree got conflicts in:
>
>   fs/proc/inode.c
>   fs/proc/root.c
>
> between commits:
>
>   0223e0999be2 ("procfs: Move proc_fill_super() to fs/proc/root.c")
>   83cd45075c36 ("proc: Add fs_context support to procfs")
>
> from the vfs tree and commit:
>
>   cc8cda3af2ba ("proc: Simplify and fix proc by removing the kernel mount")
>
> from the userns tree.
>
> I don't know how to fix this up, so I just dropped the userns tree for
> today (since it only contained that one commit).

The userns tree is a fix for a regression that I am sending to Linus
ASAP.  I don't remember any fundamental conflicts.  After we get 4.17
sorted out I will worry about this.

Eric
