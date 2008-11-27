From: "Peter Teoh" <htmldeveloper@gmail.com>
Subject: Re: linux-next: powerpc build failure
Date: Thu, 27 Nov 2008 08:26:45 +0800
Message-ID: <804dabb00811261626n6b94bd5dh5dc2a3d329014718@mail.gmail.com>
References: <20081127013405.fcdaaed2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from an-out-0708.google.com ([209.85.132.241]:16145 "EHLO
	an-out-0708.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752507AbYK0A0q (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 26 Nov 2008 19:26:46 -0500
Received: by an-out-0708.google.com with SMTP id d40so308800and.1
        for <linux-next@vger.kernel.org>; Wed, 26 Nov 2008 16:26:45 -0800 (PST)
In-Reply-To: <20081127013405.fcdaaed2.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: paulus@samba.org, linux-next@vger.kernel.org

On Wed, Nov 26, 2008 at 10:34 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Paul,
>
> Today's linux-next build (powerpc allyesconfig) failed like this:
>
> drivers/built-in.o: In function `get_dma_ops':
> arch/powerpc/include/asm/dma-mapping.h:97: relocation truncated to fit: R_PPC64_REL24 against symbol `.ftrace_likely_update' defined in .text section in kernel/built-in.o
> drivers/built-in.o: In function `init_shadow_tids':
> drivers/infiniband/hw/ipath/ipath_init_chip.c:457: relocation truncated to fit: R_PPC64_REL24 against symbol `.vfree' defined in .text section in mm/built-in.o

Not sure if my guess is correct, but the explanation for the
"relocation truncated to fit" error is here:

http://www.gossamer-threads.com/lists/linux/kernel/156801?search_string=%26quot%3Brelocation%20truncated%20to%20fit%3A%20%26quot%3B;#156801

and solved here:

http://www.gossamer-threads.com/lists/linux/kernel/156815?search_string=%26quot%3Brelocation%20truncated%20to%20fit%3A%20%26quot%3B;#156815

as well.

Perhaps u have a clue now?

-- 
Regards,
Peter Teoh

Ernest Hemingway - "Never mistake motion for action."
