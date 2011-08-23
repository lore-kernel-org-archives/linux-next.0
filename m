From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: build failure after merge of the final tree
Date: Tue, 23 Aug 2011 07:32:17 -0700
Message-ID: <20110823073217.d2794369.rdunlap@xenotime.net>
References: <20110823154811.527ae4929dd2078e694fe32a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy1-pub.bluehost.com ([66.147.249.253]:32795 "HELO
	oproxy1-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1754352Ab1HWOcT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 23 Aug 2011 10:32:19 -0400
In-Reply-To: <20110823154811.527ae4929dd2078e694fe32a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>

On Tue, 23 Aug 2011 15:48:11 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> After merging the final tree, today's linux-next build (powerpc
> allnoconfig) failed like this:
> 
> kernel/cred.c: In function 'prepare_kernel_cred':
> kernel/cred.c:657:2: error: 'tgcred' undeclared (first use in this function)
> 
> Caused by commit 012146d0728f ("CRED: Fix prepare_kernel_cred() to
> provide a new thread_group_cred struct").  CONFIG_KEYS is not set in this
> build ...
> 
> Please, please build test with and without CONFIG settings that affect
> your changes.
> 
> I discovered this after releaseing linux-next for today.

This one also causes UML (defconfig) builds to fail today.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
