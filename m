From: Dan Magenheimer <dan.magenheimer@oracle.com>
Subject: frontswap.v16 now in Linus tree, please stop pulling frontswap for
 linux-next
Date: Fri, 8 Jun 2012 15:04:05 -0700 (PDT)
Message-ID: <b4f9b288-da94-4e54-b5dd-7d8b0b4e5d68@default>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet15.oracle.com ([148.87.113.117]:47085 "EHLO
	rcsinet15.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964922Ab2FHWEY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 8 Jun 2012 18:04:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Konrad Wilk <konrad.wilk@oracle.com>, Sasha Levin <levinsasha928@gmail.com>, linux-next@vger.kernel.org

Hi Stephen --

Don't know if Konrad is on vacation today or if this is already
resolved but, if not, please stop pulling frontswap.v14 (tmem branch)
from Konrad as frontswap.v16 is now in Linus' tree as of
Monday, shortly after -rc1.

Thanks,
Dan

2790 Merging tmem/linux-next (0f1ea93 Merge branch 'stable/frontswap.v14' into linux-next)
2791 $ git merge tmem/linux-next
2792 Resolved 'Documentation/vm/frontswap.txt' using previous resolution.
2793 Resolved 'include/linux/frontswap.h' using previous resolution.
2794 Resolved 'mm/Makefile' using previous resolution.
2795 Resolved 'mm/frontswap.c' using previous resolution.
2796 Resolved 'mm/page_io.c' using previous resolution.
2797 Auto-merging mm/page_io.c
2798 CONFLICT (content): Merge conflict in mm/page_io.c
2799 Auto-merging mm/frontswap.c
2800 CONFLICT (add/add): Merge conflict in mm/frontswap.c
2801 Auto-merging mm/Makefile
2802 CONFLICT (content): Merge conflict in mm/Makefile
2803 Auto-merging include/linux/frontswap.h
2804 CONFLICT (add/add): Merge conflict in include/linux/frontswap.h
2805 Auto-merging Documentation/vm/frontswap.txt
2806 CONFLICT (add/add): Merge conflict in Documentation/vm/frontswap.txt
2807 Automatic merge failed; fix conflicts and then commit the result.

> -----Original Message-----
> From: Sasha Levin [mailto:levinsasha928@gmail.com]
> Sent: Friday, June 08, 2012 3:44 PM
> To: Dan Magenheimer
> Cc: Konrad Wilk
> Subject: RE: [PATCH 08/11] mm: frontswap: add tracing support
> 
> On Thu, 2012-06-07 at 14:10 -0700, Dan Magenheimer wrote:
> > > From: Konrad Rzeszutek Wilk
> > > Subject: Re: [PATCH 08/11] mm: frontswap: add tracing support
> >
> 
> btw, I've based my original patch series on linux-next, and it turned
> out to be outdated. I'm not sure what's being pulled for linux-next, but
> it probably should be updated.
> 
