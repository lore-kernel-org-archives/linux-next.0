From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: manual merge of the userns tree with the vfs tree
Date: Mon, 06 Aug 2018 12:35:20 -0500
Message-ID: <87lg9j8kkn.fsf@xmission.com>
References: <20180620123905.348181b2@canb.auug.org.au>
        <20180806175047.5b612a77@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180806175047.5b612a77@canb.auug.org.au> (Stephen Rothwell's
        message of "Mon, 6 Aug 2018 17:50:47 +1000")
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> On Wed, 20 Jun 2018 12:39:05 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Are there any comments on this resolution.  I just had to do it all
> again due to slight changes in the vfs tree.  What are you guys going
> to tell Linus when he comes to merge this?

Currently that the fscontext changes have a gaping security hole in it's
userspace API.  Granted the security hole is copied from the existing
mount api.  But I have had multiple real world problems with the
existing behavior, and I have reported it to David Howells multiple
times.

So I honestly don't think David Howells changes are ready to be merged.

The changes to proc exhibit the security holet and I expect they will
have to be redone to make the patch functional.

Eric
