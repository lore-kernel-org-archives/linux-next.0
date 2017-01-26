From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 userns tree
Date: Wed, 25 Jan 2017 17:43:22 -0800
Message-ID: <20170125174322.777ddcb0e232d5409569e95c@linux-foundation.org>
References: <20170125160835.1b94db55@canb.auug.org.au>
        <871svqeivo.fsf@xmission.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:33102 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752203AbdAZBnY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 25 Jan 2017 20:43:24 -0500
In-Reply-To: <871svqeivo.fsf@xmission.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Aleksa Sarai <asarai@suse.de>

On Thu, 26 Jan 2017 13:59:23 +1300 ebiederm@xmission.com (Eric W. Biederman) wrote:

> Stephen Rothwell <sfr@canb.auug.org.au> writes:
> 
> > Hi all,
> >
> > Today's linux-next merge of the akpm-current tree got a conflict in:
> >
> >   fs/proc/base.c
> >
> > between commit:
> >
> >   68eb94f16227 ("proc: Better ownership of files for non-dumpable tasks in user namespaces")
> >
> > from the userns tree and commit:
> >
> >   d15d29b5352f ("procfs: change the owner of non-dumpable and writeable files")
> >
> > from the akpm-current tree.
> >
> > I *think* that the former supercedes the latter?
> 
> Sort of.  After a long conversation it turns out what they are trying to
> do is orthogonal.
> 
> The first (mine) is handling the case of non-dumpable tasks in user
> namespaces.
> 
> The second by Aleksa Sarai is trying to trying to relax the permission
> checks in proc so that non-dumpable is not as strict, to sort out some
> runC issues where they are having challenges coding themselves into a
> corner.  In the case of /proc/self I think there may be a case but in
> general relaxing the permission checks in proc gives me the Heebie
> Jeebies.
> 
> Andrew do you see merit in Aleksa's patch that I don't?  Otherwise can
> you remove it from your tree?

I have done so.
