From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: Tree for Jan 18 [MODSIGN: KEYS:]
Date: Fri, 18 Jan 2013 22:54:23 +0000
Message-ID: <5156.1358549663@warthog.procyon.org.uk>
References: <CA+icZUXNbhX4a0ZG039O5dWiZHpuVM-mwOSD_4g+f==xWD=4Zw@mail.gmail.com> <CA+icZUV+ewSfwdGv+XjzVMF+V5d1t3r6MWGvoBgf08CN=KpBgQ@mail.gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:46809 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751863Ab3ARWyd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Jan 2013 17:54:33 -0500
In-Reply-To: <CA+icZUXNbhX4a0ZG039O5dWiZHpuVM-mwOSD_4g+f==xWD=4Zw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sedat.dilek@gmail.com
Cc: dhowells@redhat.com, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>

Sedat Dilek <sedat.dilek@gmail.com> wrote:

> Culprit seems to be...
> 
> commit d6941c0c6bd42c725e45240a86c4add92e9bfb3e
> "KEYS: Separate the kernel signature checking keyring from module signing"

Try updating.  I pushed a new version out today.  This is now at commit ID
c82af351e270e0d95059d09a1975b61494fbbcd7.

David
