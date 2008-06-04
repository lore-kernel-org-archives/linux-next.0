From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: linux-next: firmware build failure
Date: Wed, 04 Jun 2008 10:22:57 +0100
Message-ID: <1212571377.4042.70.camel@shinybook.infradead.org>
References: <20080604164623.3d5f38d2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:33951 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752292AbYFDJWz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Jun 2008 05:22:55 -0400
In-Reply-To: <20080604164623.3d5f38d2.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Wed, 2008-06-04 at 16:46 +1000, Stephen Rothwell wrote:
> -                 echo "    .align $(ASM_ALIGN)"                        >>$@;\
> +                 echo "    .p2align $${ASM_ALIGN}"                     >>$@;\

Ah, thanks. I did originally start doing it with big C files with char
arrays, which made this part easier -- but I really wanted to
use .incbin so I didn't have to copy the whole of the object into
'source' code. Just checking that that actually does the right thing on
ppc and ppc64 too, and I'll refactor it to include that. And the kaweth
fix.

Then I'll go seeking the usb tree of which you speak, with the ti patch
that conflicts. This not the tree at
kernel.org:/pub/scm/linux/kernel/git/gregkh/usb-2.6.git labelled 'junk
tree; please ignore', I assume?

-- 
dwmw2

