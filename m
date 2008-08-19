From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: Tree for August 19: CRED: BUG: bad unlock balance detected!
Date: Tue, 19 Aug 2008 16:23:18 +0100
Message-ID: <24643.1219159398@redhat.com>
References: <a4423d670808190536m7896c849xaa47ab608e954cf9@mail.gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([66.187.233.31]:60474 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752472AbYHSPXe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 19 Aug 2008 11:23:34 -0400
In-Reply-To: <a4423d670808190536m7896c849xaa47ab608e954cf9@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: dhowells@redhat.com, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>


Alexander Beregalov <a.beregalov@gmail.com> wrote:

> [   25.742287] [ BUG: bad unlock balance detected! ]
> [   25.750284] -------------------------------------
> [   25.758404] rc/404 is trying to release lock (&p->cred_exec_mutex) at:
> [   25.766716] [<00000000006aff78>] mutex_unlock+0x10/0x20
> [   25.775078] but there are no more locks to release!

I forgot to lock cred_exec_mutex in compat_do_execve().  I've posted a patch
which should fix this:

Subject: [PATCH] CRED: Take cred_exec_mutex in compat_do_execve() and fix
	error handling in do_execve()

David
