From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the kspp tree with the powerpc tree
Date: Mon, 18 Jul 2016 22:19:49 +1000
Message-ID: <20160718221949.620fba2c@canb.auug.org.au>
References: <20160718130315.314f8a77@canb.auug.org.au>
	<871t2rb496.fsf@@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53426 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751557AbcGRMTw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Jul 2016 08:19:52 -0400
In-Reply-To: <871t2rb496.fsf@@concordia.ellerman.id.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Kees Cook <keescook@google.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@c-s.fr>, "oss@buserror.net" <oss@buserror.net>

Hi Michael,

On Mon, 18 Jul 2016 21:00:05 +1000 Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
> 
> > from the powerpc tree and commit:  
> 
> Actually that's in Scott's tree.

Oops, sorry.

> > Michael: time to sort these selects?  
> 
> Yeah I was thinking that the other day. Not sure when is a good time though.

Just after -rc1, before you open the powerpc tree up again so most of
the powerpc patches can be based after it.  Also a good time to update
the config files if necessary.

-- 
Cheers,
Stephen Rothwell
