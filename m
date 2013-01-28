From: James Hogan <james.hogan@imgtec.com>
Subject: Re: linux-next: Tree for Jan 25 (BROKEN suspend)
Date: Mon, 28 Jan 2013 22:30:45 +0000
Message-ID: <20130128223045.GA16250@balrog>
References: <CA+icZUW6LBSjpqK-eQUAt7R=kXCPRjFoi=z1UijaajrVAj=fEg@mail.gmail.com>
 <CA+icZUX=XdAJjWwx8P_y31JGW3GC+tdWuFhv2Ym-0OELGWGbDQ@mail.gmail.com>
 <CA+icZUX31SB3+NU8uXA9LH5KOHxgeHKZLcqWNhzUVhx5onk6qA@mail.gmail.com>
 <18624541.r6CtJttOWZ@vostro.rjw.lan>
 <CA+icZUX+o6kB9wXwpuJ8U49j+qHdx=DRq7p+_U1g+1fwGb-S6w@mail.gmail.com>
 <20130128192807.GF22465@mtj.dyndns.org>
 <CA+icZUUHFFB6j-igX-Ec+6ZT2yvGakRd+HNVru1VUAxPXby_Lg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-we0-f172.google.com ([74.125.82.172]:59917 "EHLO
	mail-we0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755318Ab3A1Wau (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 28 Jan 2013 17:30:50 -0500
Received: by mail-we0-f172.google.com with SMTP id x10so1826915wey.31
        for <linux-next@vger.kernel.org>; Mon, 28 Jan 2013 14:30:49 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CA+icZUUHFFB6j-igX-Ec+6ZT2yvGakRd+HNVru1VUAxPXby_Lg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linux PM List <linux-pm@lists.linux-foundation.org>, Linux ACPI <linux-acpi@vger.kernel.org>, Sasha Levin <sasha.levin@oracle.com>, James Hogan <james.hogan@imgtec.com>

On Mon, Jan 28, 2013 at 11:06:11PM +0100, Sedat Dilek wrote:
> I don't see that git-bisect session as a time of waste, but two hints:
> 
> 1. People should sent their patches concerning especially Linux-Next
> fixes not only to LKML but also to <linux-next@vger.kernel.org> (if
> this is not known, pointing to James).
> 
> 2. These patches for Linux-Next should contain a "-next" in their
> subject-line (use 'git format-patch --subject-prefix="PATCH -next"
> ...').

Okay, thanks for the tips. I'll be sure to do this in future.

Cheers
James
