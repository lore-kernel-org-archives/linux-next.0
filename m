From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the kspp tree with the arm64 tree
Date: Mon, 18 Jul 2016 15:06:02 +1000
Message-ID: <20160718150602.1c8f1896@canb.auug.org.au>
References: <20160718125944.19ebe679@canb.auug.org.au>
	<CAGXu5jL-=N8cxoLmfNhG-1Pa864MQBbue1SyBQo-HsuOH41_nQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35734 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751451AbcGRFGF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Jul 2016 01:06:05 -0400
In-Reply-To: <CAGXu5jL-=N8cxoLmfNhG-1Pa864MQBbue1SyBQo-HsuOH41_nQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kees Cook <keescook@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Linux-Next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Yang Shi <yang.shi@linaro.org>

Hi Kees,

On Sun, 17 Jul 2016 21:49:40 -0700 Kees Cook <keescook@google.com> wrote:
>
> If I'm reading correctly, this second fixup is wrong. It should read;
> 
>     kasan_check_read(from, n);
>     check_object_size(from, n, true);
>     return __arch_copy_to_user(to, from, n);
> 
> (i.e. fix double space between "return" and "__arch_copy..." in both
> chunks and add check_object_size() calls after the kasan calls in both
> chunks.

Yep, sorry.  I will fix it up tomorrow.

-- 
Cheers,
Stephen Rothwell
