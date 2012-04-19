From: James Morris <jmorris@namei.org>
Subject: Re: [PATCH] samples/seccomp: fix dependencies on arch macros
Date: Thu, 19 Apr 2012 13:44:44 +1000 (EST)
Message-ID: <alpine.LRH.2.02.1204191344290.563@tundra.namei.org>
References: <1334796625-26830-1-git-send-email-wad@chromium.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tundra.namei.org ([65.99.196.166]:44839 "EHLO tundra.namei.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751388Ab2DSDo6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 18 Apr 2012 23:44:58 -0400
In-Reply-To: <1334796625-26830-1-git-send-email-wad@chromium.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Will Drewry <wad@chromium.org>
Cc: james@namei.org, paul.gortmaker@windriver.com, eparis@redhat.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, linux-security-module@vger.kernel.org

On Wed, 18 Apr 2012, Will Drewry wrote:

> This change fixes the compilation error triggered here for
> i386 allmodconfig in linux-next:
>   http://kisskb.ellerman.id.au/kisskb/buildresult/6123842/
> 
> Logic attempting to predict the host architecture has been
> removed from the Makefile.  Instead, the bpf-direct sample
> should now compile on any architecture, but if the architecture
> is not supported, it will compile a minimal main() function.
> 
> This change also ensures the samples are not compiled when
> there is no seccomp filter support.
> 
> (Note, I wasn't able to reproduce the error locally, but
>  the existing approach was clearly flawed.  This tweak
>  should resolve your issue and avoid other future weirdness.)
> 
> Reported-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> Suggested-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Will Drewry <wad@chromium.org>

Applied to
git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-security.git next


-- 
James Morris
<jmorris@namei.org>
