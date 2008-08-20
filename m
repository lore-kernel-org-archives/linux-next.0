From: "Alexander Beregalov" <a.beregalov@gmail.com>
Subject: Re: [PATCH] CRED: Take cred_exec_mutex in compat_do_execve() and fix error handling in do_execve()
Date: Wed, 20 Aug 2008 16:00:31 +0400
Message-ID: <a4423d670808200500m2bba097fg1cab607b9271de20@mail.gmail.com>
References: <20080819151829.24589.30461.stgit@warthog.procyon.org.uk>
	 <alpine.LRH.1.10.0808200910020.317@tundra.namei.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from an-out-0708.google.com ([209.85.132.244]:7485 "EHLO
	an-out-0708.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753109AbYHTMAc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 Aug 2008 08:00:32 -0400
Received: by an-out-0708.google.com with SMTP id d40so67289and.103
        for <linux-next@vger.kernel.org>; Wed, 20 Aug 2008 05:00:31 -0700 (PDT)
In-Reply-To: <alpine.LRH.1.10.0808200910020.317@tundra.namei.org>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>
Cc: David Howells <dhowells@redhat.com>, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

> Applied to
> git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/security-testing-2.6#next-creds
>
> Hopefully this will be in the next linux-next tree for testing.
>
> Alexander, please let us know if it fixes the problem you saw.

Yes, it seems fixed.
David, there is one more problem.

2.6.27-rc3-next-20080820:

[   22.266394] [ BUG: bad unlock balance detected! ]
[   22.266495] -------------------------------------
[   22.266594] khelper/8 is trying to release lock (&p->cred_exec_mutex) at:
[   22.266775] [<00000000006af9f8>] mutex_unlock+0x10/0x20
[   22.266881] but there are no more locks to release!
[   22.266982]
[   22.266987] other info that might help us debug this:
[   22.267136] no locks held by khelper/8.
[   22.267224]
[   22.267229] stack backtrace:
[   22.267343] Call Trace:
[   22.267436]  [000000000047800c] print_unlock_inbalance_bug+0xe8/0xf8
[   22.267569]  [0000000000478338] lock_release+0x98/0x1ac
[   22.267685]  [00000000006af954] __mutex_unlock_slowpath+0xbc/0x150
[   22.267816]  [00000000006af9f8] mutex_unlock+0x10/0x20
[   22.267931]  [00000000004b81fc] free_bprm+0x1c/0x3c
[   22.268043]  [00000000004b93d4] do_execve+0x230/0x254
[   22.268158]  [00000000004273d8] sparc_execve+0x64/0xb0
[   22.268284]  [0000000000406194] linux_sparc_syscall+0x34/0x44
[   22.268407]  [0000000000432cf0] kernel_execve+0x20/0x34
[   22.268535]  [0000000000462fa8] ____call_usermodehelper+0xf4/0x10c
[   22.268661]  [0000000000427260] kernel_thread+0x3c/0x54
[   22.268779]  [0000000000462e7c] __call_usermodehelper+0x7c/0xb4
